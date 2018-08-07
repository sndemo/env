RM=/bin/rm -f
RMD=/bin/rm -Rf

.install-gateway-rules:
	kubectl apply -f gateway/gateway.yaml

.delete-gateway-rules:
	kubectl delete -f gateway/gateway.yaml

.install-istio-helm-tiller:
	#-${RMD} istio-1.0.0
	#curl -L https://git.io/getLatestIstio | ISTIO_VERSION=1.0.0 sh
	#cp istio-1.0.0/bin/istioctl ~/.local/bin
	kubectl create namespace istio-system
	helm install istio-1.0.0/install/kubernetes/helm/istio --debug --timeout 600 --wait --name istio --namespace istio-system --set grafana.enabled=true --set servicegraph.enabled=true --set prometheus.enabled=true --set tracing.enabled=true --set global.configValidation=false 

.install-istio-helm-template:
	#cp istio-1.0.0/bin/istioctl ~/.local/bin
	kubectl create namespace istio-system
	helm template istio-1.0.0/install/kubernetes/helm/istio --name istio --namespace istio-system --set grafana.enabled=true --set servicegraph.enabled=true --set prometheus.enabled=true --set tracing.enabled=true > istio-1.0.0/istio.yaml
	kubectl create -f istio-1.0.0/istio.yaml

.delete-istio-helm-tiller:
	-helm del --purge istio
	-kubectl -n istio-system delete job --all
	-kubectl delete -f istio-1.0.0/install/kubernetes/helm/istio/templates/crds.yaml -n istio-system
	-kubectl delete namespace istio-system
	-${RM} ~/.local/bin/istioctl

.delete-istio-helm-template:
	-kubectl delete -f istio-1.0.0/istio.yaml
	-kubectl -n istio-system delete job --all
	-kubectl delete -f istio-1.0.0/install/kubernetes/helm/istio/templates/crds.yaml -n istio-system
	-kubectl delete namespace istio-system
	-${RM} ~/.local/bin/istioctl

.install-helm-bin:
	curl https://storage.googleapis.com/kubernetes-helm/helm-v2.10.0-rc.2-linux-amd64.tar.gz | tar -xzv
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
	
