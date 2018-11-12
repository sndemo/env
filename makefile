RM=/bin/rm -f
RMD=/bin/rm -Rf
ISTIO_VERSION=1.0.3

.install-argo-ci:
	helm repo add argo https://argoproj.github.io/argo-helm/
	helm install argo/argo-ci --name argo-ci

.delete-argo-ci:
	helm del --purge argo-ci

.install-argo-cd:
	kubectl create namespace argocd
	kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/v0.7.1/manifests/install.yaml
	sudo curl -L -o /usr/local/bin/argocd https://github.com/argoproj/argo-cd/releases/download/v0.7.1/argocd-linux-amd64
	sudo chmod +x /usr/local/bin/argocd

.delete-argo-cd:
	-kubectl delete -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/v0.7.1/manifests/install.yaml	
	-kubectl delete namespace argocd
	-sudo $(RM) /usr/local/bin/argocd 	

.install-kubernetes-dashboard:
	kubectl apply -f dashboard/kubernetes-dashboard.yaml
	

.delete-kubernetes-dashboard:
	kubectl delete -f dashboard/kubernetes-dashboard.yaml

.install-istio-helm-tiller:
	#-${RMD} istio-$(ISTIO_VERSION)
	#curl -L https://git.io/getLatestIstio | ISTIO_VERSION=(ISTIO_VERSION) sh
	#cp istio-$(ISTIO_VERSION)/bin/istioctl ~/.local/bin
	-kubectl create namespace istio-system
	helm install istio-$(ISTIO_VERSION)/install/kubernetes/helm/istio --debug --timeout 600 --wait --name istio --namespace istio-system --set grafana.enabled=true --set servicegraph.enabled=true --set prometheus.enabled=true --set tracing.enabled=true --set global.configValidation=true --set sidecarInjectorWebhook.enabled=true

.install-istio-helm-template:
	-${RMD} istio-1.0.3
	curl -L https://git.io/getLatestIstio | ISTIO_VERSION=1.0.3 sh
	cp istio-1.0.3/bin/istioctl ~/.local/bin
	cp istio-1.0.3/bin/istioctl ~/.local/bin
	kubectl create namespace istio-system
	helm template istio-1.0.3/install/kubernetes/helm/istio --name istio --namespace istio-system --set grafana.enabled=true --set servicegraph.enabled=true --set prometheus.enabled=true --set tracing.enabled=true > istio-1.0.3/istio.yaml
	kubectl create -f istio-1.0.3/istio.yaml

.delete-istio-helm-tiller:
	-helm del --purge istio
	-kubectl -n istio-system delete job --all
	-kubectl delete -f istio-1.0.0/install/kubernetes/helm/istio/templates/crds.yaml -n istio-system
	-kubectl delete namespace istio-system
	-${RM} ~/.local/bin/istioctl

.delete-istio-helm-template:
	-kubectl delete -f istio-1.0.3/istio.yaml
	-kubectl -n istio-system delete job --all
	-kubectl delete -f istio-1.0.3/install/kubernetes/helm/istio/templates/crds.yaml -n istio-system
	-kubectl delete namespace istio-system
	-${RM} ~/.local/bin/istioctl

.install-helm-bin:
	curl -L https://storage.googleapis.com/kubernetes-helm/helm-v2.10.0-rc.2-linux-amd64.tar.gz | tar -xzv
	sudo cp linux-amd64/helm /usr/local/bin
	${RMD} linux-amd64
	helm home

.delete-helm-bin:
	-sudo ${RM} /usr/local/bin/helm

.helm-install: .install-helm-bin
	kubectl -n kube-system create serviceaccount tiller
	kubectl create clusterrolebinding tiller --clusterrole cluster-admin --serviceaccount=kube-system:tiller
	helm init --service-account=tiller
	-helm repo update

.helm-delete: 
	-helm reset
	-${RMD} ~/.helm
	-kubectl -n kube-system delete deployment tiller-deploy 
	-kubectl delete clusterrolebinding tiller
	-kubectl -n kube-system delete serviceaccount tiller
	-make .delete-helm-bin
	-echo 'helm deleted.'

#for ML model deployment with Seldon	
.install-s2i: .delete-s2i
	mkdir seldon
	curl -L https://github.com/openshift/source-to-image/releases/download/v1.1.10/source-to-image-v1.1.10-27f0729d-linux-amd64.tar.gz | tar -xzv -C seldon
	sudo cp seldon/s2i /usr/local/bin
	$(RMD) seldon
.delete-s2i:
	-$(RM) /usr/local/bin/s2i

.install-seldon-core:
	helm install seldon-core-crd --name seldon-core-crd --repo https://storage.googleapis.com/seldon-charts --set usage_metrics.enabled=true
	helm install seldon-core --name seldon-core --repo https://storage.googleapis.com/seldon-charts --set apife.enabled=true --set rbac.enabled=true --set ambassador.enabled=true

.delete-seldon-core:
	helm del --purge seldon-core-crd
	helm del --purge seldon-core
