#-/bin/rm -Rf istio-1.0.3
#curl -L https://git.io/getLatestIstio | ISTIO_VERSION=(ISTIO_VERSION) sh
#cp istio-1.0.3/bin/istioctl ~/.local/bin
kubectl create namespace istio-system
namespace "istio-system" created
#helm install istio-1.0.3/install/kubernetes/helm/istio --debug --timeout 600 --wait --name istio --namespace istio-system --set grafana.enabled=true --set servicegraph.enabled=true --set prometheus.enabled=true --set tracing.enabled=true --set global.configValidation=true --set sidecarInjectorWebhook.enabled=true --set gateways.istio-ingressgateway.serviceAnnotations[0].service\.beta\.kubernetes\.io/aws-load-balancer-type=nlb
helm install istio-1.0.3/install/kubernetes/helm/istio --debug --timeout 600 --wait --name istio --namespace istio-system --set grafana.enabled=true --set servicegraph.enabled=true --set prometheus.enabled=true --set tracing.enabled=true --set global.configValidation=true --set sidecarInjectorWebhook.enabled=true
[debug] Created tunnel using local port: '62065'

[debug] SERVER: "127.0.0.1:62065"

[debug] Original chart version: ""
[debug] CHART PATH: /home/kamran/sndemo/env/istio-1.0.3/install/kubernetes/helm/istio

NAME:   istio
REVISION: 1
RELEASED: Thu Nov 22 22:57:58 2018
CHART: istio-1.0.3
USER-SUPPLIED VALUES:
global:
  configValidation: true
grafana:
  enabled: true
prometheus:
  enabled: true
servicegraph:
  enabled: true
sidecarInjectorWebhook:
  enabled: true
tracing:
  enabled: true

COMPUTED VALUES:
certmanager:
  enabled: false
  hub: quay.io/jetstack
  resources: {}
  tag: v0.3.1
galley:
  enabled: true
  global:
    arch:
      amd64: 2
      ppc64le: 2
      s390x: 2
    configValidation: true
    controlPlaneSecurityEnabled: false
    crds: true
    defaultResources:
      requests:
        cpu: 10m
    disablePolicyChecks: false
    enableTracing: true
    hub: docker.io/istio
    hyperkube:
      hub: quay.io/coreos
      tag: v1.7.6_coreos.0
    imagePullPolicy: IfNotPresent
    imagePullSecrets: null
    k8sIngressHttps: false
    k8sIngressSelector: ingress
    meshExpansion: false
    meshExpansionILB: false
    mtls:
      enabled: false
    oneNamespace: false
    policyCheckFailOpen: false
    priorityClassName: ""
    proxy:
      accessLogFile: /dev/stdout
      autoInject: enabled
      concurrency: 0
      enableCoreDump: false
      envoyStatsd:
        enabled: false
        host: null
        port: null
      excludeIPRanges: ""
      excludeInboundPorts: ""
      image: proxyv2
      includeIPRanges: '*'
      includeInboundPorts: '*'
      privileged: false
      readinessFailureThreshold: 30
      readinessInitialDelaySeconds: 1
      readinessPeriodSeconds: 2
      resources:
        requests:
          cpu: 10m
      stats:
        prometheusPort: 15090
      statusPort: 0
    proxy_init:
      image: proxy_init
    tag: 1.0.3
  image: galley
  replicaCount: 1
gateways:
  enabled: true
  global:
    arch:
      amd64: 2
      ppc64le: 2
      s390x: 2
    configValidation: true
    controlPlaneSecurityEnabled: false
    crds: true
    defaultResources:
      requests:
        cpu: 10m
    disablePolicyChecks: false
    enableTracing: true
    hub: docker.io/istio
    hyperkube:
      hub: quay.io/coreos
      tag: v1.7.6_coreos.0
    imagePullPolicy: IfNotPresent
    imagePullSecrets: null
    k8sIngressHttps: false
    k8sIngressSelector: ingress
    meshExpansion: false
    meshExpansionILB: false
    mtls:
      enabled: false
    oneNamespace: false
    policyCheckFailOpen: false
    priorityClassName: ""
    proxy:
      accessLogFile: /dev/stdout
      autoInject: enabled
      concurrency: 0
      enableCoreDump: false
      envoyStatsd:
        enabled: false
        host: null
        port: null
      excludeIPRanges: ""
      excludeInboundPorts: ""
      image: proxyv2
      includeIPRanges: '*'
      includeInboundPorts: '*'
      privileged: false
      readinessFailureThreshold: 30
      readinessInitialDelaySeconds: 1
      readinessPeriodSeconds: 2
      resources:
        requests:
          cpu: 10m
      stats:
        prometheusPort: 15090
      statusPort: 0
    proxy_init:
      image: proxy_init
    tag: 1.0.3
  istio-egressgateway:
    autoscaleMax: 5
    autoscaleMin: 1
    cpu:
      targetAverageUtilization: 80
    enabled: true
    labels:
      app: istio-egressgateway
      istio: egressgateway
    ports:
    - name: http2
      port: 80
    - name: https
      port: 443
    replicaCount: 1
    secretVolumes:
    - mountPath: /etc/istio/egressgateway-certs
      name: egressgateway-certs
      secretName: istio-egressgateway-certs
    - mountPath: /etc/istio/egressgateway-ca-certs
      name: egressgateway-ca-certs
      secretName: istio-egressgateway-ca-certs
    serviceAnnotations: {}
    type: ClusterIP
  istio-ilbgateway:
    autoscaleMax: 5
    autoscaleMin: 1
    cpu:
      targetAverageUtilization: 80
    enabled: false
    labels:
      app: istio-ilbgateway
      istio: ilbgateway
    loadBalancerIP: ""
    ports:
    - name: grpc-pilot-mtls
      port: 15011
    - name: grpc-pilot
      port: 15010
    - name: tcp-citadel-grpc-tls
      port: 8060
      targetPort: 8060
    - name: tcp-dns
      port: 853
    replicaCount: 1
    resources:
      requests:
        cpu: 800m
        memory: 512Mi
    secretVolumes:
    - mountPath: /etc/istio/ilbgateway-certs
      name: ilbgateway-certs
      secretName: istio-ilbgateway-certs
    - mountPath: /etc/istio/ilbgateway-ca-certs
      name: ilbgateway-ca-certs
      secretName: istio-ilbgateway-ca-certs
    serviceAnnotations:
      cloud.google.com/load-balancer-type: internal
    type: LoadBalancer
  istio-ingressgateway:
    autoscaleMax: 5
    autoscaleMin: 1
    cpu:
      targetAverageUtilization: 80
    enabled: true
    labels:
      app: istio-ingressgateway
      istio: ingressgateway
    loadBalancerIP: ""
    ports:
    - name: http2
      nodePort: 31380
      port: 80
      targetPort: 80
    - name: https
      nodePort: 31390
      port: 443
    - name: tcp
      nodePort: 31400
      port: 31400
    - name: tcp-pilot-grpc-tls
      port: 15011
      targetPort: 15011
    - name: tcp-citadel-grpc-tls
      port: 8060
      targetPort: 8060
    - name: tcp-dns-tls
      port: 853
      targetPort: 853
    - name: http2-prometheus
      port: 15030
      targetPort: 15030
    - name: http2-grafana
      port: 15031
      targetPort: 15031
    replicaCount: 1
    resources: {}
    secretVolumes:
    - mountPath: /etc/istio/ingressgateway-certs
      name: ingressgateway-certs
      secretName: istio-ingressgateway-certs
    - mountPath: /etc/istio/ingressgateway-ca-certs
      name: ingressgateway-ca-certs
      secretName: istio-ingressgateway-ca-certs
    serviceAnnotations: {}
    type: LoadBalancer
global:
  arch:
    amd64: 2
    ppc64le: 2
    s390x: 2
  configValidation: true
  controlPlaneSecurityEnabled: false
  crds: true
  defaultResources:
    requests:
      cpu: 10m
  disablePolicyChecks: false
  enableTracing: true
  hub: docker.io/istio
  hyperkube:
    hub: quay.io/coreos
    tag: v1.7.6_coreos.0
  imagePullPolicy: IfNotPresent
  imagePullSecrets: null
  k8sIngressHttps: false
  k8sIngressSelector: ingress
  meshExpansion: false
  meshExpansionILB: false
  mtls:
    enabled: false
  oneNamespace: false
  policyCheckFailOpen: false
  priorityClassName: ""
  proxy:
    accessLogFile: /dev/stdout
    autoInject: enabled
    concurrency: 0
    enableCoreDump: false
    envoyStatsd:
      enabled: false
      host: null
      port: null
    excludeIPRanges: ""
    excludeInboundPorts: ""
    image: proxyv2
    includeIPRanges: '*'
    includeInboundPorts: '*'
    privileged: false
    readinessFailureThreshold: 30
    readinessInitialDelaySeconds: 1
    readinessPeriodSeconds: 2
    resources:
      requests:
        cpu: 10m
    stats:
      prometheusPort: 15090
    statusPort: 0
  proxy_init:
    image: proxy_init
  tag: 1.0.3
grafana:
  dashboardProviders:
    dashboardproviders.yaml:
      apiVersion: 1
      providers:
      - disableDeletion: false
        folder: istio
        name: istio
        options:
          path: /var/lib/grafana/dashboards/istio
        orgId: 1
        type: file
  datasources:
    datasources.yaml:
      apiVersion: 1
      datasources:
      - access: proxy
        editable: true
        isDefault: true
        jsonData:
          timeInterval: 5s
        name: Prometheus
        orgId: 1
        type: prometheus
        url: http://prometheus:9090
  enabled: true
  global:
    arch:
      amd64: 2
      ppc64le: 2
      s390x: 2
    configValidation: true
    controlPlaneSecurityEnabled: false
    crds: true
    defaultResources:
      requests:
        cpu: 10m
    disablePolicyChecks: false
    enableTracing: true
    hub: docker.io/istio
    hyperkube:
      hub: quay.io/coreos
      tag: v1.7.6_coreos.0
    imagePullPolicy: IfNotPresent
    imagePullSecrets: null
    k8sIngressHttps: false
    k8sIngressSelector: ingress
    meshExpansion: false
    meshExpansionILB: false
    mtls:
      enabled: false
    oneNamespace: false
    policyCheckFailOpen: false
    priorityClassName: ""
    proxy:
      accessLogFile: /dev/stdout
      autoInject: enabled
      concurrency: 0
      enableCoreDump: false
      envoyStatsd:
        enabled: false
        host: null
        port: null
      excludeIPRanges: ""
      excludeInboundPorts: ""
      image: proxyv2
      includeIPRanges: '*'
      includeInboundPorts: '*'
      privileged: false
      readinessFailureThreshold: 30
      readinessInitialDelaySeconds: 1
      readinessPeriodSeconds: 2
      resources:
        requests:
          cpu: 10m
      stats:
        prometheusPort: 15090
      statusPort: 0
    proxy_init:
      image: proxy_init
    tag: 1.0.3
  image:
    repository: grafana/grafana
    tag: 5.2.3
  persist: false
  replicaCount: 1
  security:
    adminPassword: admin
    adminUser: admin
    enabled: false
  service:
    annotations: {}
    externalPort: 3000
    internalPort: 3000
    name: http
    type: ClusterIP
  storageClassName: ""
ingress:
  autoscaleMax: 5
  autoscaleMin: 1
  enabled: false
  replicaCount: 1
  service:
    annotations: {}
    loadBalancerIP: ""
    ports:
    - name: http
      nodePort: 32000
      port: 80
    - name: https
      port: 443
    selector:
      istio: ingress
    type: LoadBalancer
kiali:
  dashboard:
    passphrase: admin
    username: admin
  enabled: false
  hub: docker.io/kiali
  ingress:
    annotations: null
    enabled: false
    tls: null
  replicaCount: 1
  tag: v0.9
mixer:
  autoscaleMax: 5
  autoscaleMin: 1
  enabled: true
  env:
    GODEBUG: gctrace=2
  global:
    arch:
      amd64: 2
      ppc64le: 2
      s390x: 2
    configValidation: true
    controlPlaneSecurityEnabled: false
    crds: true
    defaultResources:
      requests:
        cpu: 10m
    disablePolicyChecks: false
    enableTracing: true
    hub: docker.io/istio
    hyperkube:
      hub: quay.io/coreos
      tag: v1.7.6_coreos.0
    imagePullPolicy: IfNotPresent
    imagePullSecrets: null
    k8sIngressHttps: false
    k8sIngressSelector: ingress
    meshExpansion: false
    meshExpansionILB: false
    mtls:
      enabled: false
    oneNamespace: false
    policyCheckFailOpen: false
    priorityClassName: ""
    proxy:
      accessLogFile: /dev/stdout
      autoInject: enabled
      concurrency: 0
      enableCoreDump: false
      envoyStatsd:
        enabled: false
        host: null
        port: null
      excludeIPRanges: ""
      excludeInboundPorts: ""
      image: proxyv2
      includeIPRanges: '*'
      includeInboundPorts: '*'
      privileged: false
      readinessFailureThreshold: 30
      readinessInitialDelaySeconds: 1
      readinessPeriodSeconds: 2
      resources:
        requests:
          cpu: 10m
      stats:
        prometheusPort: 15090
      statusPort: 0
    proxy_init:
      image: proxy_init
    tag: 1.0.3
  image: mixer
  istio-policy:
    autoscaleEnabled: true
    autoscaleMax: 5
    autoscaleMin: 1
    cpu:
      targetAverageUtilization: 80
  istio-telemetry:
    autoscaleEnabled: true
    autoscaleMax: 5
    autoscaleMin: 1
    cpu:
      targetAverageUtilization: 80
  prometheusStatsdExporter:
    hub: docker.io/prom
    tag: v0.6.0
  replicaCount: 1
pilot:
  autoscaleMax: 5
  autoscaleMin: 1
  cpu:
    targetAverageUtilization: 80
  enabled: true
  env:
    GODEBUG: gctrace=2
    PILOT_PUSH_THROTTLE_COUNT: 100
  global:
    arch:
      amd64: 2
      ppc64le: 2
      s390x: 2
    configValidation: true
    controlPlaneSecurityEnabled: false
    crds: true
    defaultResources:
      requests:
        cpu: 10m
    disablePolicyChecks: false
    enableTracing: true
    hub: docker.io/istio
    hyperkube:
      hub: quay.io/coreos
      tag: v1.7.6_coreos.0
    imagePullPolicy: IfNotPresent
    imagePullSecrets: null
    k8sIngressHttps: false
    k8sIngressSelector: ingress
    meshExpansion: false
    meshExpansionILB: false
    mtls:
      enabled: false
    oneNamespace: false
    policyCheckFailOpen: false
    priorityClassName: ""
    proxy:
      accessLogFile: /dev/stdout
      autoInject: enabled
      concurrency: 0
      enableCoreDump: false
      envoyStatsd:
        enabled: false
        host: null
        port: null
      excludeIPRanges: ""
      excludeInboundPorts: ""
      image: proxyv2
      includeIPRanges: '*'
      includeInboundPorts: '*'
      privileged: false
      readinessFailureThreshold: 30
      readinessInitialDelaySeconds: 1
      readinessPeriodSeconds: 2
      resources:
        requests:
          cpu: 10m
      stats:
        prometheusPort: 15090
      statusPort: 0
    proxy_init:
      image: proxy_init
    tag: 1.0.3
  image: pilot
  replicaCount: 1
  resources:
    requests:
      cpu: 500m
      memory: 2048Mi
  sidecar: true
  traceSampling: 1
prometheus:
  enabled: true
  global:
    arch:
      amd64: 2
      ppc64le: 2
      s390x: 2
    configValidation: true
    controlPlaneSecurityEnabled: false
    crds: true
    defaultResources:
      requests:
        cpu: 10m
    disablePolicyChecks: false
    enableTracing: true
    hub: docker.io/istio
    hyperkube:
      hub: quay.io/coreos
      tag: v1.7.6_coreos.0
    imagePullPolicy: IfNotPresent
    imagePullSecrets: null
    k8sIngressHttps: false
    k8sIngressSelector: ingress
    meshExpansion: false
    meshExpansionILB: false
    mtls:
      enabled: false
    oneNamespace: false
    policyCheckFailOpen: false
    priorityClassName: ""
    proxy:
      accessLogFile: /dev/stdout
      autoInject: enabled
      concurrency: 0
      enableCoreDump: false
      envoyStatsd:
        enabled: false
        host: null
        port: null
      excludeIPRanges: ""
      excludeInboundPorts: ""
      image: proxyv2
      includeIPRanges: '*'
      includeInboundPorts: '*'
      privileged: false
      readinessFailureThreshold: 30
      readinessInitialDelaySeconds: 1
      readinessPeriodSeconds: 2
      resources:
        requests:
          cpu: 10m
      stats:
        prometheusPort: 15090
      statusPort: 0
    proxy_init:
      image: proxy_init
    tag: 1.0.3
  hub: docker.io/prom
  replicaCount: 1
  service:
    annotations: {}
    nodePort:
      enabled: false
      port: 32090
  tag: v2.3.1
security:
  global:
    arch:
      amd64: 2
      ppc64le: 2
      s390x: 2
    configValidation: true
    controlPlaneSecurityEnabled: false
    crds: true
    defaultResources:
      requests:
        cpu: 10m
    disablePolicyChecks: false
    enableTracing: true
    hub: docker.io/istio
    hyperkube:
      hub: quay.io/coreos
      tag: v1.7.6_coreos.0
    imagePullPolicy: IfNotPresent
    imagePullSecrets: null
    k8sIngressHttps: false
    k8sIngressSelector: ingress
    meshExpansion: false
    meshExpansionILB: false
    mtls:
      enabled: false
    oneNamespace: false
    policyCheckFailOpen: false
    priorityClassName: ""
    proxy:
      accessLogFile: /dev/stdout
      autoInject: enabled
      concurrency: 0
      enableCoreDump: false
      envoyStatsd:
        enabled: false
        host: null
        port: null
      excludeIPRanges: ""
      excludeInboundPorts: ""
      image: proxyv2
      includeIPRanges: '*'
      includeInboundPorts: '*'
      privileged: false
      readinessFailureThreshold: 30
      readinessInitialDelaySeconds: 1
      readinessPeriodSeconds: 2
      resources:
        requests:
          cpu: 10m
      stats:
        prometheusPort: 15090
      statusPort: 0
    proxy_init:
      image: proxy_init
    tag: 1.0.3
  image: citadel
  replicaCount: 1
  selfSigned: true
servicegraph:
  enabled: true
  global:
    arch:
      amd64: 2
      ppc64le: 2
      s390x: 2
    configValidation: true
    controlPlaneSecurityEnabled: false
    crds: true
    defaultResources:
      requests:
        cpu: 10m
    disablePolicyChecks: false
    enableTracing: true
    hub: docker.io/istio
    hyperkube:
      hub: quay.io/coreos
      tag: v1.7.6_coreos.0
    imagePullPolicy: IfNotPresent
    imagePullSecrets: null
    k8sIngressHttps: false
    k8sIngressSelector: ingress
    meshExpansion: false
    meshExpansionILB: false
    mtls:
      enabled: false
    oneNamespace: false
    policyCheckFailOpen: false
    priorityClassName: ""
    proxy:
      accessLogFile: /dev/stdout
      autoInject: enabled
      concurrency: 0
      enableCoreDump: false
      envoyStatsd:
        enabled: false
        host: null
        port: null
      excludeIPRanges: ""
      excludeInboundPorts: ""
      image: proxyv2
      includeIPRanges: '*'
      includeInboundPorts: '*'
      privileged: false
      readinessFailureThreshold: 30
      readinessInitialDelaySeconds: 1
      readinessPeriodSeconds: 2
      resources:
        requests:
          cpu: 10m
      stats:
        prometheusPort: 15090
      statusPort: 0
    proxy_init:
      image: proxy_init
    tag: 1.0.3
  image: servicegraph
  ingress:
    annotations: null
    enabled: false
    hosts:
    - servicegraph.local
    tls: null
  prometheusAddr: http://prometheus:9090
  replicaCount: 1
  service:
    annotations: {}
    externalPort: 8088
    internalPort: 8088
    name: http
    type: ClusterIP
sidecarInjectorWebhook:
  enableNamespacesByDefault: false
  enabled: true
  global:
    arch:
      amd64: 2
      ppc64le: 2
      s390x: 2
    configValidation: true
    controlPlaneSecurityEnabled: false
    crds: true
    defaultResources:
      requests:
        cpu: 10m
    disablePolicyChecks: false
    enableTracing: true
    hub: docker.io/istio
    hyperkube:
      hub: quay.io/coreos
      tag: v1.7.6_coreos.0
    imagePullPolicy: IfNotPresent
    imagePullSecrets: null
    k8sIngressHttps: false
    k8sIngressSelector: ingress
    meshExpansion: false
    meshExpansionILB: false
    mtls:
      enabled: false
    oneNamespace: false
    policyCheckFailOpen: false
    priorityClassName: ""
    proxy:
      accessLogFile: /dev/stdout
      autoInject: enabled
      concurrency: 0
      enableCoreDump: false
      envoyStatsd:
        enabled: false
        host: null
        port: null
      excludeIPRanges: ""
      excludeInboundPorts: ""
      image: proxyv2
      includeIPRanges: '*'
      includeInboundPorts: '*'
      privileged: false
      readinessFailureThreshold: 30
      readinessInitialDelaySeconds: 1
      readinessPeriodSeconds: 2
      resources:
        requests:
          cpu: 10m
      stats:
        prometheusPort: 15090
      statusPort: 0
    proxy_init:
      image: proxy_init
    tag: 1.0.3
  image: sidecar_injector
  replicaCount: 1
telemetry-gateway:
  gatewayName: ingressgateway
  global:
    arch:
      amd64: 2
      ppc64le: 2
      s390x: 2
    configValidation: true
    controlPlaneSecurityEnabled: false
    crds: true
    defaultResources:
      requests:
        cpu: 10m
    disablePolicyChecks: false
    enableTracing: true
    hub: docker.io/istio
    hyperkube:
      hub: quay.io/coreos
      tag: v1.7.6_coreos.0
    imagePullPolicy: IfNotPresent
    imagePullSecrets: null
    k8sIngressHttps: false
    k8sIngressSelector: ingress
    meshExpansion: false
    meshExpansionILB: false
    mtls:
      enabled: false
    oneNamespace: false
    policyCheckFailOpen: false
    priorityClassName: ""
    proxy:
      accessLogFile: /dev/stdout
      autoInject: enabled
      concurrency: 0
      enableCoreDump: false
      envoyStatsd:
        enabled: false
        host: null
        port: null
      excludeIPRanges: ""
      excludeInboundPorts: ""
      image: proxyv2
      includeIPRanges: '*'
      includeInboundPorts: '*'
      privileged: false
      readinessFailureThreshold: 30
      readinessInitialDelaySeconds: 1
      readinessPeriodSeconds: 2
      resources:
        requests:
          cpu: 10m
      stats:
        prometheusPort: 15090
      statusPort: 0
    proxy_init:
      image: proxy_init
    tag: 1.0.3
  grafanaEnabled: false
  prometheusEnabled: false
tracing:
  enabled: true
  global:
    arch:
      amd64: 2
      ppc64le: 2
      s390x: 2
    configValidation: true
    controlPlaneSecurityEnabled: false
    crds: true
    defaultResources:
      requests:
        cpu: 10m
    disablePolicyChecks: false
    enableTracing: true
    hub: docker.io/istio
    hyperkube:
      hub: quay.io/coreos
      tag: v1.7.6_coreos.0
    imagePullPolicy: IfNotPresent
    imagePullSecrets: null
    k8sIngressHttps: false
    k8sIngressSelector: ingress
    meshExpansion: false
    meshExpansionILB: false
    mtls:
      enabled: false
    oneNamespace: false
    policyCheckFailOpen: false
    priorityClassName: ""
    proxy:
      accessLogFile: /dev/stdout
      autoInject: enabled
      concurrency: 0
      enableCoreDump: false
      envoyStatsd:
        enabled: false
        host: null
        port: null
      excludeIPRanges: ""
      excludeInboundPorts: ""
      image: proxyv2
      includeIPRanges: '*'
      includeInboundPorts: '*'
      privileged: false
      readinessFailureThreshold: 30
      readinessInitialDelaySeconds: 1
      readinessPeriodSeconds: 2
      resources:
        requests:
          cpu: 10m
      stats:
        prometheusPort: 15090
      statusPort: 0
    proxy_init:
      image: proxy_init
    tag: 1.0.3
  ingress:
    annotations: null
    enabled: false
    hosts:
    - tracing.local
    tls: null
  jaeger:
    hub: docker.io/jaegertracing
    ingress:
      annotations: null
      enabled: false
      hosts:
      - jaeger.local
      tls: null
    memory:
      max_traces: 50000
    tag: 1.5
    ui:
      port: 16686
  provider: jaeger
  replicaCount: 1
  service:
    annotations: {}
    externalPort: 9411
    internalPort: 9411
    name: http
    type: ClusterIP

HOOKS:
---
# istio-security-post-install
apiVersion: batch/v1
kind: Job
metadata:
  name: istio-security-post-install
  namespace: istio-system
  annotations:
    "helm.sh/hook": post-install
    "helm.sh/hook-delete-policy": hook-succeeded
  labels:
    app: istio-security
    chart: security-1.0.3
    release: istio
    heritage: Tiller
spec:
  template:
    metadata:
      name: istio-security-post-install
      labels:
        app: istio-security
        release: istio
    spec:
      serviceAccountName: istio-security-post-install-account
      containers:
        - name: hyperkube
          image: "quay.io/coreos/hyperkube:v1.7.6_coreos.0"
          command: [ "/bin/bash", "/tmp/security/run.sh", "/tmp/security/custom-resources.yaml" ]
          volumeMounts:
            - mountPath: "/tmp/security"
              name: tmp-configmap-security
      volumes:
        - name: tmp-configmap-security
          configMap:
            name: istio-security-custom-resources
      restartPolicy: OnFailure
---
# istio-cleanup-secrets
apiVersion: batch/v1
kind: Job
metadata:
  name: istio-cleanup-secrets
  namespace: istio-system
  annotations:
    "helm.sh/hook": post-delete
    "helm.sh/hook-delete-policy": hook-succeeded
    "helm.sh/hook-weight": "3"
  labels:
    app: security
    chart: security-1.0.3
    release: istio
    heritage: Tiller
spec:
  template:
    metadata:
      name: istio-cleanup-secrets
      labels:
        app: security
        release: istio
    spec:
      serviceAccountName: istio-cleanup-secrets-service-account
      containers:
        - name: hyperkube
          image: "quay.io/coreos/hyperkube:v1.7.6_coreos.0"
          command:
          - /bin/bash
          - -c
          - >
              kubectl get secret --all-namespaces | grep "istio.io/key-and-cert" |  while read -r entry; do
                ns=$(echo $entry | awk '{print $1}');
                name=$(echo $entry | awk '{print $2}');
                kubectl delete secret $name -n $ns;
              done
      restartPolicy: OnFailure
---
# istio-cleanup-secrets-service-account
# The reason for creating a ServiceAccount and ClusterRole specifically for this
# post-delete hooked job is because the citadel ServiceAccount is being deleted
# before this hook is launched. On the other hand, running this hook before the
# deletion of the citadel (e.g. pre-delete) won't delete the secrets because they
# will be re-created immediately by the to-be-deleted citadel.
#
# It's also important that the ServiceAccount, ClusterRole and ClusterRoleBinding
# will be ready before running the hooked Job therefore the hook weights.

apiVersion: v1
kind: ServiceAccount
metadata:
  name: istio-cleanup-secrets-service-account
  namespace: istio-system
  annotations:
    "helm.sh/hook": post-delete
    "helm.sh/hook-delete-policy": hook-succeeded
    "helm.sh/hook-weight": "1"
  labels:
    app: security
    chart: security-1.0.3
    heritage: Tiller
    release: istio
---
# istio-cleanup-secrets-istio-system
apiVersion: rbac.authorization.k8s.io/v1beta1
kind: ClusterRole
metadata:
  name: istio-cleanup-secrets-istio-system
  annotations:
    "helm.sh/hook": post-delete
    "helm.sh/hook-delete-policy": hook-succeeded
    "helm.sh/hook-weight": "1"
  labels:
    app: security
    chart: security-1.0.3
    heritage: Tiller
    release: istio
rules:
- apiGroups: [""]
  resources: ["secrets"]
  verbs: ["list", "delete"]
---
# istio-cleanup-secrets-istio-system
apiVersion: rbac.authorization.k8s.io/v1beta1
kind: ClusterRoleBinding
metadata:
  name: istio-cleanup-secrets-istio-system
  annotations:
    "helm.sh/hook": post-delete
    "helm.sh/hook-delete-policy": hook-succeeded
    "helm.sh/hook-weight": "2"
  labels:
    app: security
    chart: security-1.0.3
    heritage: Tiller
    release: istio
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: istio-cleanup-secrets-istio-system
subjects:
  - kind: ServiceAccount
    name: istio-cleanup-secrets-service-account
    namespace: istio-system
---
# istio-grafana-post-install
apiVersion: batch/v1
kind: Job
metadata:
  name: istio-grafana-post-install
  namespace: istio-system
  annotations:
    "helm.sh/hook": post-install
    "helm.sh/hook-delete-policy": hook-succeeded
  labels:
    app: istio-grafana
    chart: grafana-1.0.3
    release: istio
    heritage: Tiller
spec:
  template:
    metadata:
      name: istio-grafana-post-install
      labels:
        app: istio-grafana
        release: istio
    spec:
      serviceAccountName: istio-grafana-post-install-account
      containers:
        - name: hyperkube
          image: "quay.io/coreos/hyperkube:v1.7.6_coreos.0"
          command: [ "/bin/bash", "/tmp/grafana/run.sh", "/tmp/grafana/custom-resources.yaml" ]
          volumeMounts:
            - mountPath: "/tmp/grafana"
              name: tmp-configmap-grafana
      volumes:
        - name: tmp-configmap-grafana
          configMap:
            name: istio-grafana-custom-resources
      restartPolicy: OnFailure
---
# memquotas.config.istio.io
kind: CustomResourceDefinition
apiVersion: apiextensions.k8s.io/v1beta1
metadata:
  name: memquotas.config.istio.io
  annotations:
    "helm.sh/hook": crd-install
  labels:
    app: mixer
    package: memquota
    istio: mixer-adapter
spec:
  group: config.istio.io
  names:
    kind: memquota
    plural: memquotas
    singular: memquota
    categories:
    - istio-io
    - policy-istio-io
  scope: Namespaced
  version: v1alpha2
---
# opas.config.istio.io
kind: CustomResourceDefinition
apiVersion: apiextensions.k8s.io/v1beta1
metadata:
  name: opas.config.istio.io
  annotations:
    "helm.sh/hook": crd-install
  labels:
    app: mixer
    package: opa
    istio: mixer-adapter
spec:
  group: config.istio.io
  names:
    kind: opa
    plural: opas
    singular: opa
    categories:
    - istio-io
    - policy-istio-io
  scope: Namespaced
  version: v1alpha2
---
# prometheuses.config.istio.io
kind: CustomResourceDefinition
apiVersion: apiextensions.k8s.io/v1beta1
metadata:
  name: prometheuses.config.istio.io
  annotations:
    "helm.sh/hook": crd-install
  labels:
    app: mixer
    package: prometheus
    istio: mixer-adapter
spec:
  group: config.istio.io
  names:
    kind: prometheus
    plural: prometheuses
    singular: prometheus
    categories:
    - istio-io
    - policy-istio-io
  scope: Namespaced
  version: v1alpha2
---
# rbacs.config.istio.io
kind: CustomResourceDefinition
apiVersion: apiextensions.k8s.io/v1beta1
metadata:
  name: rbacs.config.istio.io
  annotations:
    "helm.sh/hook": crd-install
  labels:
    app: mixer
    package: rbac
    istio: mixer-adapter
spec:
  group: config.istio.io
  names:
    kind: rbac
    plural: rbacs
    singular: rbac
    categories:
    - istio-io
    - policy-istio-io
  scope: Namespaced
  version: v1alpha2
---
# stackdrivers.config.istio.io
kind: CustomResourceDefinition
apiVersion: apiextensions.k8s.io/v1beta1
metadata:
  name: stackdrivers.config.istio.io
  annotations:
    "helm.sh/hook": crd-install
  labels:
    app: mixer
    package: stackdriver
    istio: mixer-adapter
spec:
  group: config.istio.io
  names:
    kind: stackdriver
    plural: stackdrivers
    singular: stackdriver
    categories:
    - istio-io
    - policy-istio-io
  scope: Namespaced
  version: v1alpha2
---
# edges.config.istio.io
kind: CustomResourceDefinition
apiVersion: apiextensions.k8s.io/v1beta1
metadata:
  name: edges.config.istio.io
  annotations:
    "helm.sh/hook": crd-install
  labels:
    app: mixer
    package: edge
    istio: mixer-instance
spec:
  group: config.istio.io
  names:
    kind: edge
    plural: edges
    singular: edge
    categories:
    - istio-io
    - policy-istio-io
  scope: Namespaced
  version: v1alpha2
---
# metrics.config.istio.io
kind: CustomResourceDefinition
apiVersion: apiextensions.k8s.io/v1beta1
metadata:
  name: metrics.config.istio.io
  annotations:
    "helm.sh/hook": crd-install
  labels:
    app: mixer
    package: metric
    istio: mixer-instance
spec:
  group: config.istio.io
  names:
    kind: metric
    plural: metrics
    singular: metric
    categories:
    - istio-io
    - policy-istio-io
  scope: Namespaced
  version: v1alpha2
---
# httpapispecs.config.istio.io
kind: CustomResourceDefinition
apiVersion: apiextensions.k8s.io/v1beta1
metadata:
  annotations:
    "helm.sh/hook": crd-install
  name: httpapispecs.config.istio.io
spec:
  group: config.istio.io
  names:
    kind: HTTPAPISpec
    plural: httpapispecs
    singular: httpapispec
    categories:
    - istio-io
    - apim-istio-io
  scope: Namespaced
  version: v1alpha2
---
# rbacconfigs.rbac.istio.io
kind: CustomResourceDefinition
apiVersion: apiextensions.k8s.io/v1beta1
metadata:
  name: rbacconfigs.rbac.istio.io
  annotations:
    "helm.sh/hook": crd-install
  labels:
    app: mixer
    package: istio.io.mixer
    istio: rbac
spec:
  group: rbac.istio.io
  names:
    kind: RbacConfig
    plural: rbacconfigs
    singular: rbacconfig
    categories:
    - istio-io
    - rbac-istio-io
  scope: Namespaced
  version: v1alpha1
---
# redisquotas.config.istio.io
kind: CustomResourceDefinition
apiVersion: apiextensions.k8s.io/v1beta1
metadata:
  name: redisquotas.config.istio.io
  annotations:
    "helm.sh/hook": crd-install
  labels:
    package: redisquota
    istio: mixer-adapter
spec:
  group: config.istio.io
  names:
    kind: redisquota
    plural: redisquotas
    singular: redisquota
  scope: Namespaced
  version: v1alpha2
---
# quotas.config.istio.io
kind: CustomResourceDefinition
apiVersion: apiextensions.k8s.io/v1beta1
metadata:
  name: quotas.config.istio.io
  annotations:
    "helm.sh/hook": crd-install
  labels:
    app: mixer
    package: quota
    istio: mixer-instance
spec:
  group: config.istio.io
  names:
    kind: quota
    plural: quotas
    singular: quota
    categories:
    - istio-io
    - policy-istio-io
  scope: Namespaced
  version: v1alpha2
---
# servicecontrolreports.config.istio.io
kind: CustomResourceDefinition
apiVersion: apiextensions.k8s.io/v1beta1
metadata:
  name: servicecontrolreports.config.istio.io
  annotations:
    "helm.sh/hook": crd-install
  labels:
    app: mixer
    package: servicecontrolreport
    istio: mixer-instance
spec:
  group: config.istio.io
  names:
    kind: servicecontrolreport
    plural: servicecontrolreports
    singular: servicecontrolreport
    categories:
    - istio-io
    - policy-istio-io
  scope: Namespaced
  version: v1alpha2
---
# serviceroles.rbac.istio.io
kind: CustomResourceDefinition
apiVersion: apiextensions.k8s.io/v1beta1
metadata:
  name: serviceroles.rbac.istio.io
  annotations:
    "helm.sh/hook": crd-install
  labels:
    app: mixer
    package: istio.io.mixer
    istio: rbac
spec:
  group: rbac.istio.io
  names:
    kind: ServiceRole
    plural: serviceroles
    singular: servicerole
    categories:
    - istio-io
    - rbac-istio-io
  scope: Namespaced
  version: v1alpha1
---
# serviceentries.networking.istio.io
apiVersion: apiextensions.k8s.io/v1beta1
kind: CustomResourceDefinition
metadata:
  name: serviceentries.networking.istio.io
  annotations:
    "helm.sh/hook": crd-install
  labels:
    app: istio-pilot
spec:
  group: networking.istio.io
  names:
    kind: ServiceEntry
    listKind: ServiceEntryList
    plural: serviceentries
    singular: serviceentry
    categories:
    - istio-io
    - networking-istio-io
  scope: Namespaced
  version: v1alpha3
---
# rules.config.istio.io
# Mixer CRDs
kind: CustomResourceDefinition
apiVersion: apiextensions.k8s.io/v1beta1
metadata:
  name: rules.config.istio.io
  annotations:
    "helm.sh/hook": crd-install
  labels:
    app: mixer
    package: istio.io.mixer
    istio: core
spec:
  group: config.istio.io
  names:
    kind: rule
    plural: rules
    singular: rule
    categories:
    - istio-io
    - policy-istio-io
  scope: Namespaced
  version: v1alpha2
---
# deniers.config.istio.io
kind: CustomResourceDefinition
apiVersion: apiextensions.k8s.io/v1beta1
metadata:
  name: deniers.config.istio.io
  annotations:
    "helm.sh/hook": crd-install
  labels:
    app: mixer
    package: denier
    istio: mixer-adapter
spec:
  group: config.istio.io
  names:
    kind: denier
    plural: deniers
    singular: denier
    categories:
    - istio-io
    - policy-istio-io
  scope: Namespaced
  version: v1alpha2
---
# solarwindses.config.istio.io
kind: CustomResourceDefinition
apiVersion: apiextensions.k8s.io/v1beta1
metadata:
  name: solarwindses.config.istio.io
  annotations:
    "helm.sh/hook": crd-install
  labels:
    app: mixer
    package: solarwinds
    istio: mixer-adapter
spec:
  group: config.istio.io
  names:
    kind: solarwinds
    plural: solarwindses
    singular: solarwinds
    categories:
    - istio-io
    - policy-istio-io
  scope: Namespaced
  version: v1alpha2
---
# apikeys.config.istio.io
kind: CustomResourceDefinition
apiVersion: apiextensions.k8s.io/v1beta1
metadata:
  name: apikeys.config.istio.io
  annotations:
    "helm.sh/hook": crd-install
  labels:
    app: mixer
    package: apikey
    istio: mixer-instance
spec:
  group: config.istio.io
  names:
    kind: apikey
    plural: apikeys
    singular: apikey
    categories:
    - istio-io
    - policy-istio-io
  scope: Namespaced
  version: v1alpha2
---
# kuberneteses.config.istio.io
kind: CustomResourceDefinition
apiVersion: apiextensions.k8s.io/v1beta1
metadata:
  name: kuberneteses.config.istio.io
  annotations:
    "helm.sh/hook": crd-install
  labels:
    app: mixer
    package: adapter.template.kubernetes
    istio: mixer-instance
spec:
  group: config.istio.io
  names:
    kind: kubernetes
    plural: kuberneteses
    singular: kubernetes
    categories:
    - istio-io
    - policy-istio-io
  scope: Namespaced
  version: v1alpha2
---
# gateways.networking.istio.io
apiVersion: apiextensions.k8s.io/v1beta1
kind: CustomResourceDefinition
metadata:
  name: gateways.networking.istio.io
  annotations:
    "helm.sh/hook": crd-install
    "helm.sh/hook-weight": "-5"
  labels:
    app: istio-pilot
spec:
  group: networking.istio.io
  names:
    kind: Gateway
    plural: gateways
    singular: gateway
    categories:
    - istio-io
    - networking-istio-io
  scope: Namespaced
  version: v1alpha3
---
# signalfxs.config.istio.io
kind: CustomResourceDefinition
apiVersion: apiextensions.k8s.io/v1beta1
metadata:
  name: signalfxs.config.istio.io
  annotations:
    "helm.sh/hook": crd-install
  labels:
    app: mixer
    package: signalfx
    istio: mixer-adapter
spec:
  group: config.istio.io
  names:
    kind: signalfx
    plural: signalfxs
    singular: signalfx
    categories:
    - istio-io
    - policy-istio-io
  scope: Namespaced
  version: v1alpha2
---
# cloudwatches.config.istio.io
kind: CustomResourceDefinition
apiVersion: apiextensions.k8s.io/v1beta1
metadata:
  name: cloudwatches.config.istio.io
  annotations:
    "helm.sh/hook": crd-install
  labels:
    app: mixer
    package: cloudwatch
    istio: mixer-adapter
spec:
  group: config.istio.io
  names:
    kind: cloudwatch
    plural: cloudwatches
    singular: cloudwatch
    categories:
    - istio-io
    - policy-istio-io
  scope: Namespaced
  version: v1alpha2
---
# dogstatsds.config.istio.io
kind: CustomResourceDefinition
apiVersion: apiextensions.k8s.io/v1beta1
metadata:
  name: dogstatsds.config.istio.io
  annotations:
    "helm.sh/hook": crd-install
  labels:
    app: mixer
    package: dogstatsd
    istio: mixer-adapter
spec:
  group: config.istio.io
  names:
    kind: dogstatsd
    plural: dogstatsds
    singular: dogstatsd
    categories:
    - istio-io
    - policy-istio-io
  scope: Namespaced
  version: v1alpha2
---
# tracespans.config.istio.io
kind: CustomResourceDefinition
apiVersion: apiextensions.k8s.io/v1beta1
metadata:
  name: tracespans.config.istio.io
  annotations:
    "helm.sh/hook": crd-install
  labels:
    app: mixer
    package: tracespan
    istio: mixer-instance
spec:
  group: config.istio.io
  names:
    kind: tracespan
    plural: tracespans
    singular: tracespan
    categories:
    - istio-io
    - policy-istio-io
  scope: Namespaced
  version: v1alpha2
---
# httpapispecbindings.config.istio.io
#

# these CRDs only make sense when security is enabled
#

#
kind: CustomResourceDefinition
apiVersion: apiextensions.k8s.io/v1beta1
metadata:
  annotations:
    "helm.sh/hook": crd-install
  name: httpapispecbindings.config.istio.io
spec:
  group: config.istio.io
  names:
    kind: HTTPAPISpecBinding
    plural: httpapispecbindings
    singular: httpapispecbinding
    categories:
    - istio-io
    - apim-istio-io
  scope: Namespaced
  version: v1alpha2
---
# quotaspecs.config.istio.io
kind: CustomResourceDefinition
apiVersion: apiextensions.k8s.io/v1beta1
metadata:
  annotations:
    "helm.sh/hook": crd-install
  name: quotaspecs.config.istio.io
spec:
  group: config.istio.io
  names:
    kind: QuotaSpec
    plural: quotaspecs
    singular: quotaspec
    categories:
    - istio-io
    - apim-istio-io
  scope: Namespaced
  version: v1alpha2
---
# bypasses.config.istio.io
kind: CustomResourceDefinition
apiVersion: apiextensions.k8s.io/v1beta1
metadata:
  name: bypasses.config.istio.io
  annotations:
    "helm.sh/hook": crd-install
  labels:
    app: mixer
    package: bypass
    istio: mixer-adapter
spec:
  group: config.istio.io
  names:
    kind: bypass
    plural: bypasses
    singular: bypass
    categories:
    - istio-io
    - policy-istio-io
  scope: Namespaced
  version: v1alpha2
---
# fluentds.config.istio.io
kind: CustomResourceDefinition
apiVersion: apiextensions.k8s.io/v1beta1
metadata:
  name: fluentds.config.istio.io
  annotations:
    "helm.sh/hook": crd-install
  labels:
    app: mixer
    package: fluentd
    istio: mixer-adapter
spec:
  group: config.istio.io
  names:
    kind: fluentd
    plural: fluentds
    singular: fluentd
    categories:
    - istio-io
    - policy-istio-io
  scope: Namespaced
  version: v1alpha2
---
# noops.config.istio.io
kind: CustomResourceDefinition
apiVersion: apiextensions.k8s.io/v1beta1
metadata:
  name: noops.config.istio.io
  annotations:
    "helm.sh/hook": crd-install
  labels:
    app: mixer
    package: noop
    istio: mixer-adapter
spec:
  group: config.istio.io
  names:
    kind: noop
    plural: noops
    singular: noop
    categories:
    - istio-io
    - policy-istio-io
  scope: Namespaced
  version: v1alpha2
---
# destinationrules.networking.istio.io
apiVersion: apiextensions.k8s.io/v1beta1
kind: CustomResourceDefinition
metadata:
  name: destinationrules.networking.istio.io
  annotations:
    "helm.sh/hook": crd-install
  labels:
    app: istio-pilot
spec:
  group: networking.istio.io
  names:
    kind: DestinationRule
    listKind: DestinationRuleList
    plural: destinationrules
    singular: destinationrule
    categories:
    - istio-io
    - networking-istio-io
  scope: Namespaced
  version: v1alpha3
---
# circonuses.config.istio.io
kind: CustomResourceDefinition
apiVersion: apiextensions.k8s.io/v1beta1
metadata:
  name: circonuses.config.istio.io
  annotations:
    "helm.sh/hook": crd-install
  labels:
    app: mixer
    package: circonus
    istio: mixer-adapter
spec:
  group: config.istio.io
  names:
    kind: circonus
    plural: circonuses
    singular: circonus
    categories:
    - istio-io
    - policy-istio-io
  scope: Namespaced
  version: v1alpha2
---
# listcheckers.config.istio.io
kind: CustomResourceDefinition
apiVersion: apiextensions.k8s.io/v1beta1
metadata:
  name: listcheckers.config.istio.io
  annotations:
    "helm.sh/hook": crd-install
  labels:
    app: mixer
    package: listchecker
    istio: mixer-adapter
spec:
  group: config.istio.io
  names:
    kind: listchecker
    plural: listcheckers
    singular: listchecker
    categories:
    - istio-io
    - policy-istio-io
  scope: Namespaced
  version: v1alpha2
---
# checknothings.config.istio.io
kind: CustomResourceDefinition
apiVersion: apiextensions.k8s.io/v1beta1
metadata:
  name: checknothings.config.istio.io
  annotations:
    "helm.sh/hook": crd-install
  labels:
    app: mixer
    package: checknothing
    istio: mixer-instance
spec:
  group: config.istio.io
  names:
    kind: checknothing
    plural: checknothings
    singular: checknothing
    categories:
    - istio-io
    - policy-istio-io
  scope: Namespaced
  version: v1alpha2
---
# templates.config.istio.io
kind: CustomResourceDefinition
apiVersion: apiextensions.k8s.io/v1beta1
metadata:
  name: templates.config.istio.io
  annotations:
    "helm.sh/hook": crd-install
  labels:
    app: mixer
    package: template
    istio: mixer-template
spec:
  group: config.istio.io
  names:
    kind: template
    plural: templates
    singular: template
    categories:
    - istio-io
    - policy-istio-io
  scope: Namespaced
  version: v1alpha2
---
# envoyfilters.networking.istio.io
apiVersion: apiextensions.k8s.io/v1beta1
kind: CustomResourceDefinition
metadata:
  name: envoyfilters.networking.istio.io
  annotations:
    "helm.sh/hook": crd-install
  labels:
    app: istio-pilot
spec:
  group: networking.istio.io
  names:
    kind: EnvoyFilter
    plural: envoyfilters
    singular: envoyfilter
    categories:
    - istio-io
    - networking-istio-io
  scope: Namespaced
  version: v1alpha3
---
# servicecontrols.config.istio.io
kind: CustomResourceDefinition
apiVersion: apiextensions.k8s.io/v1beta1
metadata:
  name: servicecontrols.config.istio.io
  annotations:
    "helm.sh/hook": crd-install
  labels:
    app: mixer
    package: servicecontrol
    istio: mixer-adapter
spec:
  group: config.istio.io
  names:
    kind: servicecontrol
    plural: servicecontrols
    singular: servicecontrol
    categories:
    - istio-io
    - policy-istio-io
  scope: Namespaced
  version: v1alpha2
---
# authorizations.config.istio.io
kind: CustomResourceDefinition
apiVersion: apiextensions.k8s.io/v1beta1
metadata:
  name: authorizations.config.istio.io
  annotations:
    "helm.sh/hook": crd-install
  labels:
    app: mixer
    package: authorization
    istio: mixer-instance
spec:
  group: config.istio.io
  names:
    kind: authorization
    plural: authorizations
    singular: authorization
    categories:
    - istio-io
    - policy-istio-io
  scope: Namespaced
  version: v1alpha2
---
# logentries.config.istio.io
kind: CustomResourceDefinition
apiVersion: apiextensions.k8s.io/v1beta1
metadata:
  name: logentries.config.istio.io
  annotations:
    "helm.sh/hook": crd-install
  labels:
    app: mixer
    package: logentry
    istio: mixer-instance
spec:
  group: config.istio.io
  names:
    kind: logentry
    plural: logentries
    singular: logentry
    categories:
    - istio-io
    - policy-istio-io
  scope: Namespaced
  version: v1alpha2
---
# reportnothings.config.istio.io
kind: CustomResourceDefinition
apiVersion: apiextensions.k8s.io/v1beta1
metadata:
  name: reportnothings.config.istio.io
  annotations:
    "helm.sh/hook": crd-install
  labels:
    app: mixer
    package: reportnothing
    istio: mixer-instance
spec:
  group: config.istio.io
  names:
    kind: reportnothing
    plural: reportnothings
    singular: reportnothing
    categories:
    - istio-io
    - policy-istio-io
  scope: Namespaced
  version: v1alpha2
---
# adapters.config.istio.io
kind: CustomResourceDefinition
apiVersion: apiextensions.k8s.io/v1beta1
metadata:
  name: adapters.config.istio.io
  annotations:
    "helm.sh/hook": crd-install
  labels:
    app: mixer
    package: adapter
    istio: mixer-adapter
spec:
  group: config.istio.io
  names:
    kind: adapter
    plural: adapters
    singular: adapter
    categories:
    - istio-io
    - policy-istio-io
  scope: Namespaced
  version: v1alpha2
---
# instances.config.istio.io
kind: CustomResourceDefinition
apiVersion: apiextensions.k8s.io/v1beta1
metadata:
  name: instances.config.istio.io
  annotations:
    "helm.sh/hook": crd-install
  labels:
    app: mixer
    package: instance
    istio: mixer-instance
spec:
  group: config.istio.io
  names:
    kind: instance
    plural: instances
    singular: instance
    categories:
    - istio-io
    - policy-istio-io
  scope: Namespaced
  version: v1alpha2
---
# attributemanifests.config.istio.io
kind: CustomResourceDefinition
apiVersion: apiextensions.k8s.io/v1beta1
metadata:
  name: attributemanifests.config.istio.io
  annotations:
    "helm.sh/hook": crd-install
  labels:
    app: mixer
    package: istio.io.mixer
    istio: core
spec:
  group: config.istio.io
  names:
    kind: attributemanifest
    plural: attributemanifests
    singular: attributemanifest
    categories:
    - istio-io
    - policy-istio-io
  scope: Namespaced
  version: v1alpha2
---
# quotaspecbindings.config.istio.io
kind: CustomResourceDefinition
apiVersion: apiextensions.k8s.io/v1beta1
metadata:
  annotations:
    "helm.sh/hook": crd-install
  name: quotaspecbindings.config.istio.io
spec:
  group: config.istio.io
  names:
    kind: QuotaSpecBinding
    plural: quotaspecbindings
    singular: quotaspecbinding
    categories:
    - istio-io
    - apim-istio-io
  scope: Namespaced
  version: v1alpha2
---
# kubernetesenvs.config.istio.io
kind: CustomResourceDefinition
apiVersion: apiextensions.k8s.io/v1beta1
metadata:
  name: kubernetesenvs.config.istio.io
  annotations:
    "helm.sh/hook": crd-install
  labels:
    app: mixer
    package: kubernetesenv
    istio: mixer-adapter
spec:
  group: config.istio.io
  names:
    kind: kubernetesenv
    plural: kubernetesenvs
    singular: kubernetesenv
    categories:
    - istio-io
    - policy-istio-io
  scope: Namespaced
  version: v1alpha2
---
# statsds.config.istio.io
kind: CustomResourceDefinition
apiVersion: apiextensions.k8s.io/v1beta1
metadata:
  name: statsds.config.istio.io
  annotations:
    "helm.sh/hook": crd-install
  labels:
    app: mixer
    package: statsd
    istio: mixer-adapter
spec:
  group: config.istio.io
  names:
    kind: statsd
    plural: statsds
    singular: statsd
    categories:
    - istio-io
    - policy-istio-io
  scope: Namespaced
  version: v1alpha2
---
# stdios.config.istio.io
kind: CustomResourceDefinition
apiVersion: apiextensions.k8s.io/v1beta1
metadata:
  name: stdios.config.istio.io
  annotations:
    "helm.sh/hook": crd-install
  labels:
    app: mixer
    package: stdio
    istio: mixer-adapter
spec:
  group: config.istio.io
  names:
    kind: stdio
    plural: stdios
    singular: stdio
    categories:
    - istio-io
    - policy-istio-io
  scope: Namespaced
  version: v1alpha2
---
# listentries.config.istio.io
kind: CustomResourceDefinition
apiVersion: apiextensions.k8s.io/v1beta1
metadata:
  name: listentries.config.istio.io
  annotations:
    "helm.sh/hook": crd-install
  labels:
    app: mixer
    package: listentry
    istio: mixer-instance
spec:
  group: config.istio.io
  names:
    kind: listentry
    plural: listentries
    singular: listentry
    categories:
    - istio-io
    - policy-istio-io
  scope: Namespaced
  version: v1alpha2
---
# servicerolebindings.rbac.istio.io
kind: CustomResourceDefinition
apiVersion: apiextensions.k8s.io/v1beta1
metadata:
  name: servicerolebindings.rbac.istio.io
  annotations:
    "helm.sh/hook": crd-install
  labels:
    app: mixer
    package: istio.io.mixer
    istio: rbac
spec:
  group: rbac.istio.io
  names:
    kind: ServiceRoleBinding
    plural: servicerolebindings
    singular: servicerolebinding
    categories:
    - istio-io
    - rbac-istio-io
  scope: Namespaced
  version: v1alpha1
---
# handlers.config.istio.io
kind: CustomResourceDefinition
apiVersion: apiextensions.k8s.io/v1beta1
metadata:
  name: handlers.config.istio.io
  annotations:
    "helm.sh/hook": crd-install
  labels:
    app: mixer
    package: handler
    istio: mixer-handler
spec:
  group: config.istio.io
  names:
    kind: handler
    plural: handlers
    singular: handler
    categories:
    - istio-io
    - policy-istio-io
  scope: Namespaced
  version: v1alpha2
---
# virtualservices.networking.istio.io
# 
# these CRDs only make sense when pilot is enabled
#
apiVersion: apiextensions.k8s.io/v1beta1
kind: CustomResourceDefinition
metadata:
  name: virtualservices.networking.istio.io
  annotations:
    "helm.sh/hook": crd-install
  labels:
    app: istio-pilot
spec:
  group: networking.istio.io
  names:
    kind: VirtualService
    listKind: VirtualServiceList
    plural: virtualservices
    singular: virtualservice
    categories:
    - istio-io
    - networking-istio-io
  scope: Namespaced
  version: v1alpha3
MANIFEST:

---
# Source: istio/charts/galley/templates/configmap.yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: istio-galley-configuration
  namespace: istio-system
  labels:
    app: istio-galley
    chart: galley-1.0.3
    release: istio
    heritage: Tiller
    istio: mixer
data:
  validatingwebhookconfiguration.yaml: |-    
    apiVersion: admissionregistration.k8s.io/v1beta1
    kind: ValidatingWebhookConfiguration
    metadata:
      name: istio-galley
      namespace: istio-system
      labels:
        app: istio-galley
        chart: galley-1.0.3
        release: istio
        heritage: Tiller
    webhooks:
      - name: pilot.validation.istio.io
        clientConfig:
          service:
            name: istio-galley
            namespace: istio-system
            path: "/admitpilot"
          caBundle: ""
        rules:
          - operations:
            - CREATE
            - UPDATE
            apiGroups:
            - config.istio.io
            apiVersions:
            - v1alpha2
            resources:
            - httpapispecs
            - httpapispecbindings
            - quotaspecs
            - quotaspecbindings
          - operations:
            - CREATE
            - UPDATE
            apiGroups:
            - rbac.istio.io
            apiVersions:
            - "*"
            resources:
            - "*"
          - operations:
            - CREATE
            - UPDATE
            apiGroups:
            - authentication.istio.io
            apiVersions:
            - "*"
            resources:
            - "*"
          - operations:
            - CREATE
            - UPDATE
            apiGroups:
            - networking.istio.io
            apiVersions:
            - "*"
            resources:
            - destinationrules
            - envoyfilters
            - gateways
            - serviceentries
            - virtualservices
        failurePolicy: Fail
      - name: mixer.validation.istio.io
        clientConfig:
          service:
            name: istio-galley
            namespace: istio-system
            path: "/admitmixer"
          caBundle: ""
        rules:
          - operations:
            - CREATE
            - UPDATE
            apiGroups:
            - config.istio.io
            apiVersions:
            - v1alpha2
            resources:
            - rules
            - attributemanifests
            - circonuses
            - deniers
            - fluentds
            - kubernetesenvs
            - listcheckers
            - memquotas
            - noops
            - opas
            - prometheuses
            - rbacs
            - servicecontrols
            - solarwindses
            - stackdrivers
            - cloudwatches
            - dogstatsds
            - statsds
            - stdios
            - apikeys
            - authorizations
            - checknothings
            # - kuberneteses
            - listentries
            - logentries
            - metrics
            - quotas
            - reportnothings
            - servicecontrolreports
            - tracespans
        failurePolicy: Fail
---
# Source: istio/charts/grafana/templates/configmap-custom-resources.yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: istio-grafana-custom-resources
  namespace: istio-system
  labels:
    app: istio-grafana
    chart: grafana-1.0.3
    release: istio
    heritage: Tiller
    istio: grafana
data:
  custom-resources.yaml: |-    
    apiVersion: authentication.istio.io/v1alpha1
    kind: Policy
    metadata:
      name: grafana-ports-mtls-disabled
      namespace: istio-system
    spec:
      targets:
      - name: grafana
        ports:
        - number: 3000
  run.sh: |-    
    #!/bin/sh
    
    set -x
    
    if [ "$#" -ne "1" ]; then
        echo "first argument should be path to custom resource yaml"
        exit 1
    fi
    
    pathToResourceYAML=${1}
    
    /kubectl get validatingwebhookconfiguration istio-galley 2>/dev/null
    if [ "$?" -eq 0 ]; then
        echo "istio-galley validatingwebhookconfiguration found - waiting for istio-galley deployment to be ready"
        while true; do
            /kubectl -n istio-system get deployment istio-galley 2>/dev/null
            if [ "$?" -eq 0 ]; then
                break
            fi
            sleep 1
        done
        /kubectl -n istio-system rollout status deployment istio-galley
        if [ "$?" -ne 0 ]; then
            echo "istio-galley deployment rollout status check failed"
            exit 1
        fi
        echo "istio-galley deployment ready for configuration validation"
    fi
    sleep 5
    /kubectl apply -f ${pathToResourceYAML}
---
# Source: istio/charts/grafana/templates/configmap-dashboards.yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: istio-grafana-configuration-dashboards
  namespace: istio-system
  labels:
    app: istio-grafana
    chart: grafana-1.0.3
    release: istio
    heritage: Tiller
    istio: grafana

data:
  
  galley-dashboard.json: '{
    "__inputs": [
      {
        "name": "DS_PROMETHEUS",
        "label": "Prometheus",
        "description": "",
        "type": "datasource",
        "pluginId": "prometheus",
        "pluginName": "Prometheus"
      }
    ],
    "__requires": [
      {
        "type": "grafana",
        "id": "grafana",
        "name": "Grafana",
        "version": "5.0.4"
      },
      {
        "type": "panel",
        "id": "graph",
        "name": "Graph",
        "version": "5.0.0"
      },
      {
        "type": "datasource",
        "id": "prometheus",
        "name": "Prometheus",
        "version": "5.0.0"
      }
    ],
    "annotations": {
      "list": [
        {
          "builtIn": 1,
          "datasource": "-- Grafana --",
          "enable": true,
          "hide": true,
          "iconColor": "rgba(0, 211, 255, 1)",
          "name": "Annotations & Alerts",
          "type": "dashboard"
        }
      ]
    },
    "editable": false,
    "gnetId": null,
    "graphTooltip": 0,
    "id": null,
    "links": [],
    "panels": [
      {
        "aliasColors": {},
        "bars": false,
        "dashLength": 10,
        "dashes": false,
        "datasource": "Prometheus",
        "fill": 1,
        "gridPos": {
          "h": 6,
          "w": 8,
          "x": 0,
          "y": 0
        },
        "id": 2,
        "legend": {
          "avg": false,
          "current": false,
          "max": false,
          "min": false,
          "show": true,
          "total": false,
          "values": false
        },
        "lines": true,
        "linewidth": 1,
        "links": [],
        "nullPointMode": "null",
        "percentage": false,
        "pointradius": 5,
        "points": false,
        "renderer": "flot",
        "seriesOverrides": [],
        "spaceLength": 10,
        "stack": false,
        "steppedLine": false,
        "targets": [
          {
            "expr": "galley_validation_cert_key_updates{job=\"galley\"}",
            "format": "time_series",
            "intervalFactor": 1,
            "legendFormat": "Key Updates",
            "refId": "A"
          },
          {
            "expr": "galley_validation_cert_key_update_errors{job=\"galley\"}",
            "format": "time_series",
            "intervalFactor": 1,
            "legendFormat": "Key Update Errors: {{ error }}",
            "refId": "B"
          }
        ],
        "thresholds": [],
        "timeFrom": null,
        "timeShift": null,
        "title": "Validation Webhook Certificate",
        "tooltip": {
          "shared": true,
          "sort": 0,
          "value_type": "individual"
        },
        "type": "graph",
        "xaxis": {
          "buckets": null,
          "mode": "time",
          "name": null,
          "show": true,
          "values": []
        },
        "yaxes": [
          {
            "format": "short",
            "label": null,
            "logBase": 1,
            "max": null,
            "min": null,
            "show": true
          },
          {
            "format": "short",
            "label": null,
            "logBase": 1,
            "max": null,
            "min": null,
            "show": true
          }
        ]
      },
      {
        "aliasColors": {},
        "bars": false,
        "dashLength": 10,
        "dashes": false,
        "datasource": "Prometheus",
        "fill": 1,
        "gridPos": {
          "h": 6,
          "w": 8,
          "x": 8,
          "y": 0
        },
        "id": 3,
        "legend": {
          "avg": false,
          "current": false,
          "max": false,
          "min": false,
          "show": true,
          "total": false,
          "values": false
        },
        "lines": true,
        "linewidth": 1,
        "links": [],
        "nullPointMode": "null",
        "percentage": false,
        "pointradius": 5,
        "points": false,
        "renderer": "flot",
        "seriesOverrides": [],
        "spaceLength": 10,
        "stack": false,
        "steppedLine": false,
        "targets": [
          {
            "expr": "sum(galley_validation_passed{job=\"galley\"}) by (group, version, resource)",
            "format": "time_series",
            "intervalFactor": 1,
            "legendFormat": "Passed: {{ group }}/{{ version }}/{{resource}}",
            "refId": "A"
          },
          {
            "expr": "sum(galley_validation_failed{job=\"galley\"}) by (group, version, resource, reason)",
            "format": "time_series",
            "intervalFactor": 1,
            "legendFormat": "Failed: {{ group }}/{{ version }}/{{resource}} ({{ reason}})",
            "refId": "B"
          }
        ],
        "thresholds": [],
        "timeFrom": null,
        "timeShift": null,
        "title": "Resource Validation",
        "tooltip": {
          "shared": true,
          "sort": 0,
          "value_type": "individual"
        },
        "type": "graph",
        "xaxis": {
          "buckets": null,
          "mode": "time",
          "name": null,
          "show": true,
          "values": []
        },
        "yaxes": [
          {
            "format": "short",
            "label": null,
            "logBase": 1,
            "max": null,
            "min": null,
            "show": true
          },
          {
            "format": "short",
            "label": null,
            "logBase": 1,
            "max": null,
            "min": null,
            "show": true
          }
        ]
      },
      {
        "aliasColors": {},
        "bars": false,
        "dashLength": 10,
        "dashes": false,
        "datasource": "Prometheus",
        "fill": 1,
        "gridPos": {
          "h": 6,
          "w": 8,
          "x": 16,
          "y": 0
        },
        "id": 4,
        "legend": {
          "avg": false,
          "current": false,
          "max": false,
          "min": false,
          "show": true,
          "total": false,
          "values": false
        },
        "lines": true,
        "linewidth": 1,
        "links": [],
        "nullPointMode": "null",
        "percentage": false,
        "pointradius": 5,
        "points": false,
        "renderer": "flot",
        "seriesOverrides": [],
        "spaceLength": 10,
        "stack": false,
        "steppedLine": false,
        "targets": [
          {
            "expr": "sum(galley_validation_http_error{job=\"galley\"}) by (status)",
            "format": "time_series",
            "intervalFactor": 1,
            "legendFormat": "{{ status }}",
            "refId": "A"
          }
        ],
        "thresholds": [],
        "timeFrom": null,
        "timeShift": null,
        "title": "Validation HTTP Errors",
        "tooltip": {
          "shared": true,
          "sort": 0,
          "value_type": "individual"
        },
        "type": "graph",
        "xaxis": {
          "buckets": null,
          "mode": "time",
          "name": null,
          "show": true,
          "values": []
        },
        "yaxes": [
          {
            "format": "short",
            "label": null,
            "logBase": 1,
            "max": null,
            "min": null,
            "show": true
          },
          {
            "format": "short",
            "label": null,
            "logBase": 1,
            "max": null,
            "min": null,
            "show": true
          }
        ]
      }
    ],
    "schemaVersion": 16,
    "style": "dark",
    "tags": [],
    "templating": {
      "list": []
    },
    "time": {
      "from": "now-6h",
      "to": "now"
    },
    "timepicker": {
      "refresh_intervals": [
        "5s",
        "10s",
        "30s",
        "1m",
        "5m",
        "15m",
        "30m",
        "1h",
        "2h",
        "1d"
      ],
      "time_options": [
        "5m",
        "15m",
        "1h",
        "6h",
        "12h",
        "24h",
        "2d",
        "7d",
        "30d"
      ]
    },
    "timezone": "",
    "title": "Istio Galley Dashboard",
    "uid": "DMXUJ6dmz",
    "version": 1
  }
'
  
  istio-mesh-dashboard.json: '{
  "annotations": {
    "list": [
      {
        "builtIn": 1,
        "datasource": "-- Grafana --",
        "enable": true,
        "hide": true,
        "iconColor": "rgba(0, 211, 255, 1)",
        "name": "Annotations & Alerts",
        "type": "dashboard"
      }
    ]
  },
  "editable": false,
  "gnetId": null,
  "graphTooltip": 0,
  "links": [],
  "panels": [
    {
      "content": "<div>\n  <div style=\"position: absolute; bottom: 0\">\n    <a href=\"https://istio.io\" target=\"_blank\" style=\"font-size: 30px; text-decoration: none; color: inherit\"><img src=\"https://istio.io/img/istio-logo.svg\" style=\"height: 50px\"> Istio</a>\n  </div>\n  <div style=\"position: absolute; bottom: 0; right: 0; font-size: 15px\">\n    Istio is an <a href=\"https://github.com/istio/istio\" target=\"_blank\">open platform</a> that provides a uniform way to connect,\n    <a href=\"https://istio.io/docs/concepts/traffic-management/overview.html\" target=\"_blank\">manage</a>, and \n    <a href=\"https://istio.io/docs/concepts/network-and-auth/auth.html\" target=\"_blank\">secure</a> microservices.\n    <br>\n    Need help? Join the <a href=\"https://istio.io/community/\" target=\"_blank\">Istio community</a>.\n  </div>\n</div>",
      "gridPos": {
        "h": 3,
        "w": 24,
        "x": 0,
        "y": 0
      },
      "height": "50px",
      "id": 13,
      "links": [],
      "mode": "html",
      "style": {
        "font-size": "18pt"
      },
      "title": "",
      "transparent": true,
      "type": "text"
    },
    {
      "cacheTimeout": null,
      "colorBackground": false,
      "colorValue": false,
      "colors": [
        "rgba(245, 54, 54, 0.9)",
        "rgba(237, 129, 40, 0.89)",
        "rgba(50, 172, 45, 0.97)"
      ],
      "datasource": "Prometheus",
      "format": "ops",
      "gauge": {
        "maxValue": 100,
        "minValue": 0,
        "show": false,
        "thresholdLabels": false,
        "thresholdMarkers": true
      },
      "gridPos": {
        "h": 3,
        "w": 6,
        "x": 0,
        "y": 3
      },
      "id": 20,
      "interval": null,
      "links": [],
      "mappingType": 1,
      "mappingTypes": [
        {
          "name": "value to text",
          "value": 1
        },
        {
          "name": "range to text",
          "value": 2
        }
      ],
      "maxDataPoints": 100,
      "nullPointMode": "connected",
      "nullText": null,
      "postfix": "",
      "postfixFontSize": "50%",
      "prefix": "",
      "prefixFontSize": "50%",
      "rangeMaps": [
        {
          "from": "null",
          "text": "N/A",
          "to": "null"
        }
      ],
      "sparkline": {
        "fillColor": "rgba(31, 118, 189, 0.18)",
        "full": true,
        "lineColor": "rgb(31, 120, 193)",
        "show": true
      },
      "tableColumn": "",
      "targets": [
        {
          "expr": "round(sum(irate(istio_requests_total{reporter=\"destination\"}[1m])), 0.001)",
          "intervalFactor": 1,
          "refId": "A",
          "step": 4
        }
      ],
      "thresholds": "",
      "title": "Global Request Volume",
      "transparent": false,
      "type": "singlestat",
      "valueFontSize": "80%",
      "valueMaps": [
        {
          "op": "=",
          "text": "N/A",
          "value": "null"
        }
      ],
      "valueName": "avg"
    },
    {
      "cacheTimeout": null,
      "colorBackground": false,
      "colorValue": false,
      "colors": [
        "rgba(245, 54, 54, 0.9)",
        "rgba(237, 129, 40, 0.89)",
        "rgba(50, 172, 45, 0.97)"
      ],
      "datasource": "Prometheus",
      "format": "percentunit",
      "gauge": {
        "maxValue": 100,
        "minValue": 80,
        "show": false,
        "thresholdLabels": false,
        "thresholdMarkers": false
      },
      "gridPos": {
        "h": 3,
        "w": 6,
        "x": 6,
        "y": 3
      },
      "id": 21,
      "interval": null,
      "links": [],
      "mappingType": 1,
      "mappingTypes": [
        {
          "name": "value to text",
          "value": 1
        },
        {
          "name": "range to text",
          "value": 2
        }
      ],
      "maxDataPoints": 100,
      "nullPointMode": "connected",
      "nullText": null,
      "postfix": "",
      "postfixFontSize": "50%",
      "prefix": "",
      "prefixFontSize": "50%",
      "rangeMaps": [
        {
          "from": "null",
          "text": "N/A",
          "to": "null"
        }
      ],
      "sparkline": {
        "fillColor": "rgba(31, 118, 189, 0.18)",
        "full": true,
        "lineColor": "rgb(31, 120, 193)",
        "show": true
      },
      "tableColumn": "",
      "targets": [
        {
          "expr": "sum(rate(istio_requests_total{reporter=\"destination\", response_code!~\"5.*\"}[1m])) / sum(rate(istio_requests_total{reporter=\"destination\"}[1m]))",
          "format": "time_series",
          "intervalFactor": 1,
          "refId": "A",
          "step": 4
        }
      ],
      "thresholds": "95, 99, 99.5",
      "title": "Global Success Rate (non-5xx responses)",
      "transparent": false,
      "type": "singlestat",
      "valueFontSize": "80%",
      "valueMaps": [
        {
          "op": "=",
          "text": "N/A",
          "value": "null"
        }
      ],
      "valueName": "avg"
    },
    {
      "cacheTimeout": null,
      "colorBackground": false,
      "colorValue": false,
      "colors": [
        "rgba(245, 54, 54, 0.9)",
        "rgba(237, 129, 40, 0.89)",
        "rgba(50, 172, 45, 0.97)"
      ],
      "datasource": "Prometheus",
      "format": "ops",
      "gauge": {
        "maxValue": 100,
        "minValue": 0,
        "show": false,
        "thresholdLabels": false,
        "thresholdMarkers": true
      },
      "gridPos": {
        "h": 3,
        "w": 6,
        "x": 12,
        "y": 3
      },
      "id": 22,
      "interval": null,
      "links": [],
      "mappingType": 1,
      "mappingTypes": [
        {
          "name": "value to text",
          "value": 1
        },
        {
          "name": "range to text",
          "value": 2
        }
      ],
      "maxDataPoints": 100,
      "nullPointMode": "connected",
      "nullText": null,
      "postfix": "",
      "postfixFontSize": "50%",
      "prefix": "",
      "prefixFontSize": "50%",
      "rangeMaps": [
        {
          "from": "null",
          "text": "N/A",
          "to": "null"
        }
      ],
      "sparkline": {
        "fillColor": "rgba(31, 118, 189, 0.18)",
        "full": true,
        "lineColor": "rgb(31, 120, 193)",
        "show": true
      },
      "tableColumn": "",
      "targets": [
        {
          "expr": "sum(irate(istio_requests_total{reporter=\"destination\", response_code=~\"4.*\"}[1m])) ",
          "format": "time_series",
          "intervalFactor": 1,
          "refId": "A",
          "step": 4
        }
      ],
      "thresholds": "",
      "title": "4xxs",
      "transparent": false,
      "type": "singlestat",
      "valueFontSize": "80%",
      "valueMaps": [
        {
          "op": "=",
          "text": "N/A",
          "value": "null"
        }
      ],
      "valueName": "avg"
    },
    {
      "cacheTimeout": null,
      "colorBackground": false,
      "colorValue": false,
      "colors": [
        "rgba(245, 54, 54, 0.9)",
        "rgba(237, 129, 40, 0.89)",
        "rgba(50, 172, 45, 0.97)"
      ],
      "datasource": "Prometheus",
      "format": "ops",
      "gauge": {
        "maxValue": 100,
        "minValue": 0,
        "show": false,
        "thresholdLabels": false,
        "thresholdMarkers": true
      },
      "gridPos": {
        "h": 3,
        "w": 6,
        "x": 18,
        "y": 3
      },
      "id": 23,
      "interval": null,
      "links": [],
      "mappingType": 1,
      "mappingTypes": [
        {
          "name": "value to text",
          "value": 1
        },
        {
          "name": "range to text",
          "value": 2
        }
      ],
      "maxDataPoints": 100,
      "nullPointMode": "connected",
      "nullText": null,
      "postfix": "",
      "postfixFontSize": "50%",
      "prefix": "",
      "prefixFontSize": "50%",
      "rangeMaps": [
        {
          "from": "null",
          "text": "N/A",
          "to": "null"
        }
      ],
      "sparkline": {
        "fillColor": "rgba(31, 118, 189, 0.18)",
        "full": true,
        "lineColor": "rgb(31, 120, 193)",
        "show": true
      },
      "tableColumn": "",
      "targets": [
        {
          "expr": "sum(irate(istio_requests_total{reporter=\"destination\", response_code=~\"5.*\"}[1m])) ",
          "format": "time_series",
          "intervalFactor": 1,
          "refId": "A",
          "step": 4
        }
      ],
      "thresholds": "",
      "title": "5xxs",
      "transparent": false,
      "type": "singlestat",
      "valueFontSize": "80%",
      "valueMaps": [
        {
          "op": "=",
          "text": "N/A",
          "value": "null"
        }
      ],
      "valueName": "avg"
    },
    {
      "columns": [],
      "datasource": "Prometheus",
      "fontSize": "100%",
      "gridPos": {
        "h": 21,
        "w": 24,
        "x": 0,
        "y": 6
      },
      "hideTimeOverride": false,
      "id": 73,
      "links": [],
      "pageSize": null,
      "repeat": null,
      "repeatDirection": "v",
      "scroll": true,
      "showHeader": true,
      "sort": {
        "col": 4,
        "desc": true
      },
      "styles": [
        {
          "alias": "Workload",
          "colorMode": null,
          "colors": [
            "rgba(245, 54, 54, 0.9)",
            "rgba(237, 129, 40, 0.89)",
            "rgba(50, 172, 45, 0.97)"
          ],
          "dateFormat": "YYYY-MM-DD HH:mm:ss",
          "decimals": 2,
          "link": false,
          "linkTargetBlank": false,
          "linkTooltip": "Workload dashboard",
          "linkUrl": "/dashboard/db/istio-workload-dashboard?var-namespace=$__cell_2&var-workload=$__cell_",
          "pattern": "destination_workload",
          "preserveFormat": false,
          "sanitize": false,
          "thresholds": [],
          "type": "hidden",
          "unit": "short"
        },
        {
          "alias": "",
          "colorMode": null,
          "colors": [
            "rgba(245, 54, 54, 0.9)",
            "rgba(237, 129, 40, 0.89)",
            "rgba(50, 172, 45, 0.97)"
          ],
          "dateFormat": "YYYY-MM-DD HH:mm:ss",
          "decimals": 2,
          "pattern": "Time",
          "thresholds": [],
          "type": "hidden",
          "unit": "short"
        },
        {
          "alias": "Requests",
          "colorMode": null,
          "colors": [
            "rgba(245, 54, 54, 0.9)",
            "rgba(237, 129, 40, 0.89)",
            "rgba(50, 172, 45, 0.97)"
          ],
          "dateFormat": "YYYY-MM-DD HH:mm:ss",
          "decimals": 2,
          "pattern": "Value #A",
          "thresholds": [],
          "type": "number",
          "unit": "ops"
        },
        {
          "alias": "P50 Latency",
          "colorMode": null,
          "colors": [
            "rgba(245, 54, 54, 0.9)",
            "rgba(237, 129, 40, 0.89)",
            "rgba(50, 172, 45, 0.97)"
          ],
          "dateFormat": "YYYY-MM-DD HH:mm:ss",
          "decimals": 2,
          "pattern": "Value #B",
          "thresholds": [],
          "type": "number",
          "unit": "s"
        },
        {
          "alias": "P90 Latency",
          "colorMode": null,
          "colors": [
            "rgba(245, 54, 54, 0.9)",
            "rgba(237, 129, 40, 0.89)",
            "rgba(50, 172, 45, 0.97)"
          ],
          "dateFormat": "YYYY-MM-DD HH:mm:ss",
          "decimals": 2,
          "pattern": "Value #D",
          "thresholds": [],
          "type": "number",
          "unit": "s"
        },
        {
          "alias": "P99 Latency",
          "colorMode": null,
          "colors": [
            "rgba(245, 54, 54, 0.9)",
            "rgba(237, 129, 40, 0.89)",
            "rgba(50, 172, 45, 0.97)"
          ],
          "dateFormat": "YYYY-MM-DD HH:mm:ss",
          "decimals": 2,
          "pattern": "Value #E",
          "thresholds": [],
          "type": "number",
          "unit": "s"
        },
        {
          "alias": "Success Rate",
          "colorMode": "cell",
          "colors": [
            "rgba(245, 54, 54, 0.9)",
            "rgba(237, 129, 40, 0.89)",
            "rgba(50, 172, 45, 0.97)"
          ],
          "dateFormat": "YYYY-MM-DD HH:mm:ss",
          "decimals": 2,
          "pattern": "Value #F",
          "thresholds": [
            ".95",
            " 1.00"
          ],
          "type": "number",
          "unit": "percentunit"
        },
        {
          "alias": "Workload",
          "colorMode": null,
          "colors": [
            "rgba(245, 54, 54, 0.9)",
            "rgba(237, 129, 40, 0.89)",
            "rgba(50, 172, 45, 0.97)"
          ],
          "dateFormat": "YYYY-MM-DD HH:mm:ss",
          "decimals": 2,
          "link": true,
          "linkTooltip": "$__cell dashboard",
          "linkUrl": "/dashboard/db/istio-workload-dashboard?var-workload=$__cell_2&var-namespace=$__cell_3",
          "pattern": "destination_workload_var",
          "thresholds": [],
          "type": "number",
          "unit": "short"
        },
        {
          "alias": "Service",
          "colorMode": null,
          "colors": [
            "rgba(245, 54, 54, 0.9)",
            "rgba(237, 129, 40, 0.89)",
            "rgba(50, 172, 45, 0.97)"
          ],
          "dateFormat": "YYYY-MM-DD HH:mm:ss",
          "decimals": 2,
          "link": true,
          "linkTooltip": "$__cell dashboard",
          "linkUrl": "/dashboard/db/istio-service-dashboard?var-service=$__cell",
          "pattern": "destination_service",
          "thresholds": [],
          "type": "string",
          "unit": "short"
        },
        {
          "alias": "",
          "colorMode": null,
          "colors": [
            "rgba(245, 54, 54, 0.9)",
            "rgba(237, 129, 40, 0.89)",
            "rgba(50, 172, 45, 0.97)"
          ],
          "dateFormat": "YYYY-MM-DD HH:mm:ss",
          "decimals": 2,
          "pattern": "destination_workload_namespace",
          "thresholds": [],
          "type": "hidden",
          "unit": "short"
        }
      ],
      "targets": [
        {
          "expr": "label_join(sum(rate(istio_requests_total{reporter=\"destination\", response_code=\"200\"}[1m])) by (destination_workload, destination_workload_namespace, destination_service), \"destination_workload_var\", \".\", \"destination_workload\", \"destination_workload_namespace\")",
          "format": "table",
          "hide": false,
          "instant": true,
          "intervalFactor": 1,
          "legendFormat": "{{ destination_workload}}.{{ destination_workload_namespace }}",
          "refId": "A"
        },
        {
          "expr": "label_join(histogram_quantile(0.50, sum(rate(istio_request_duration_seconds_bucket{reporter=\"destination\"}[1m])) by (le, destination_workload, destination_workload_namespace)), \"destination_workload_var\", \".\", \"destination_workload\", \"destination_workload_namespace\")",
          "format": "table",
          "hide": false,
          "instant": true,
          "intervalFactor": 1,
          "legendFormat": "{{ destination_workload}}.{{ destination_workload_namespace }}",
          "refId": "B"
        },
        {
          "expr": "label_join(histogram_quantile(0.90, sum(rate(istio_request_duration_seconds_bucket{reporter=\"destination\"}[1m])) by (le, destination_workload, destination_workload_namespace)), \"destination_workload_var\", \".\", \"destination_workload\", \"destination_workload_namespace\")",
          "format": "table",
          "hide": false,
          "instant": true,
          "intervalFactor": 1,
          "legendFormat": "{{ destination_workload }}.{{ destination_workload_namespace }}",
          "refId": "D"
        },
        {
          "expr": "label_join(histogram_quantile(0.99, sum(rate(istio_request_duration_seconds_bucket{reporter=\"destination\"}[1m])) by (le, destination_workload, destination_workload_namespace)), \"destination_workload_var\", \".\", \"destination_workload\", \"destination_workload_namespace\")",
          "format": "table",
          "hide": false,
          "instant": true,
          "intervalFactor": 1,
          "legendFormat": "{{ destination_workload }}.{{ destination_workload_namespace }}",
          "refId": "E"
        },
        {
          "expr": "label_join((sum(rate(istio_requests_total{reporter=\"destination\", response_code!~\"5.*\"}[1m])) by (destination_workload, destination_workload_namespace) / sum(rate(istio_requests_total{reporter=\"destination\"}[1m])) by (destination_workload, destination_workload_namespace)), \"destination_workload_var\", \".\", \"destination_workload\", \"destination_workload_namespace\")",
          "format": "table",
          "hide": false,
          "instant": true,
          "interval": "",
          "intervalFactor": 1,
          "legendFormat": "{{ destination_workload }}.{{ destination_workload_namespace }}",
          "refId": "F"
        }
      ],
      "timeFrom": null,
      "title": "HTTP/GRPC Workloads",
      "transform": "table",
      "transparent": false,
      "type": "table"
    },
    {
      "columns": [],
      "datasource": "Prometheus",
      "fontSize": "100%",
      "gridPos": {
        "h": 18,
        "w": 24,
        "x": 0,
        "y": 27
      },
      "hideTimeOverride": false,
      "id": 109,
      "links": [],
      "pageSize": null,
      "repeatDirection": "v",
      "scroll": true,
      "showHeader": true,
      "sort": {
        "col": 2,
        "desc": true
      },
      "styles": [
        {
          "alias": "Workload",
          "colorMode": null,
          "colors": [
            "rgba(245, 54, 54, 0.9)",
            "rgba(237, 129, 40, 0.89)",
            "rgba(50, 172, 45, 0.97)"
          ],
          "dateFormat": "YYYY-MM-DD HH:mm:ss",
          "decimals": 2,
          "link": false,
          "linkTargetBlank": false,
          "linkTooltip": "$__cell dashboard",
          "linkUrl": "/dashboard/db/istio-tcp-workload-dashboard?var-namespace=$__cell_2&&var-workload=$__cell",
          "pattern": "destination_workload",
          "preserveFormat": false,
          "sanitize": false,
          "thresholds": [],
          "type": "hidden",
          "unit": "short"
        },
        {
          "alias": "Bytes Sent",
          "colorMode": null,
          "colors": [
            "rgba(245, 54, 54, 0.9)",
            "rgba(237, 129, 40, 0.89)",
            "rgba(50, 172, 45, 0.97)"
          ],
          "dateFormat": "YYYY-MM-DD HH:mm:ss",
          "decimals": 2,
          "pattern": "Value #A",
          "thresholds": [
            ""
          ],
          "type": "number",
          "unit": "Bps"
        },
        {
          "alias": "Bytes Received",
          "colorMode": null,
          "colors": [
            "rgba(245, 54, 54, 0.9)",
            "rgba(237, 129, 40, 0.89)",
            "rgba(50, 172, 45, 0.97)"
          ],
          "dateFormat": "YYYY-MM-DD HH:mm:ss",
          "decimals": 2,
          "pattern": "Value #C",
          "thresholds": [],
          "type": "number",
          "unit": "Bps"
        },
        {
          "alias": "",
          "colorMode": null,
          "colors": [
            "rgba(245, 54, 54, 0.9)",
            "rgba(237, 129, 40, 0.89)",
            "rgba(50, 172, 45, 0.97)"
          ],
          "dateFormat": "YYYY-MM-DD HH:mm:ss",
          "decimals": 2,
          "pattern": "Time",
          "thresholds": [],
          "type": "hidden",
          "unit": "short"
        },
        {
          "alias": "Workload",
          "colorMode": null,
          "colors": [
            "rgba(245, 54, 54, 0.9)",
            "rgba(237, 129, 40, 0.89)",
            "rgba(50, 172, 45, 0.97)"
          ],
          "dateFormat": "YYYY-MM-DD HH:mm:ss",
          "decimals": 2,
          "link": true,
          "linkTooltip": "$__cell dashboard",
          "linkUrl": "/dashboard/db/istio-workload-dashboard?var-namespace=$__cell_3&var-workload=$__cell_2",
          "pattern": "destination_workload_var",
          "thresholds": [],
          "type": "string",
          "unit": "short"
        },
        {
          "alias": "",
          "colorMode": null,
          "colors": [
            "rgba(245, 54, 54, 0.9)",
            "rgba(237, 129, 40, 0.89)",
            "rgba(50, 172, 45, 0.97)"
          ],
          "dateFormat": "YYYY-MM-DD HH:mm:ss",
          "decimals": 2,
          "pattern": "destination_workload_namespace",
          "thresholds": [],
          "type": "hidden",
          "unit": "short"
        },
        {
          "alias": "Service",
          "colorMode": null,
          "colors": [
            "rgba(245, 54, 54, 0.9)",
            "rgba(237, 129, 40, 0.89)",
            "rgba(50, 172, 45, 0.97)"
          ],
          "dateFormat": "YYYY-MM-DD HH:mm:ss",
          "decimals": 2,
          "link": true,
          "linkTooltip": "$__cell dashboard",
          "linkUrl": "/dashboard/db/istio-service-dashboard?var-service=$__cell",
          "pattern": "destination_service",
          "thresholds": [],
          "type": "number",
          "unit": "short"
        }
      ],
      "targets": [
        {
          "expr": "label_join(sum(rate(istio_tcp_received_bytes_total{reporter=\"source\"}[1m])) by (destination_workload, destination_workload_namespace, destination_service), \"destination_workload_var\", \".\", \"destination_workload\", \"destination_workload_namespace\")",
          "format": "table",
          "hide": false,
          "instant": true,
          "intervalFactor": 1,
          "legendFormat": "{{ destination_workload }}",
          "refId": "C"
        },
        {
          "expr": "label_join(sum(rate(istio_tcp_sent_bytes_total{reporter=\"source\"}[1m])) by (destination_workload, destination_workload_namespace, destination_service), \"destination_workload_var\", \".\", \"destination_workload\", \"destination_workload_namespace\")",
          "format": "table",
          "hide": false,
          "instant": true,
          "intervalFactor": 1,
          "legendFormat": "{{ destination_workload }}",
          "refId": "A"
        }
      ],
      "timeFrom": null,
      "title": "TCP Workloads",
      "transform": "table",
      "transparent": false,
      "type": "table"
    }
  ],
  "refresh": "5s",
  "schemaVersion": 16,
  "style": "dark",
  "tags": [],
  "templating": {
    "list": []
  },
  "time": {
    "from": "now-5m",
    "to": "now"
  },
  "timepicker": {
    "refresh_intervals": [
      "5s",
      "10s",
      "30s",
      "1m",
      "5m",
      "15m",
      "30m",
      "1h",
      "2h",
      "1d"
    ],
    "time_options": [
      "5m",
      "15m",
      "1h",
      "6h",
      "12h",
      "24h",
      "2d",
      "7d",
      "30d"
    ]
  },
  "timezone": "browser",
  "title": "Istio Mesh Dashboard",
  "uid": "1",
  "version": 2
}
'
  
  istio-performance-dashboard.json: '{
  "__inputs": [
    {
      "name": "DS_PROMETHEUS",
      "label": "Prometheus",
      "description": "",
      "type": "datasource",
      "pluginId": "prometheus",
      "pluginName": "Prometheus"
    }
  ],
  "__requires": [
    {
      "type": "grafana",
      "id": "grafana",
      "name": "Grafana",
      "version": "5.2.3"
    },
    {
      "type": "panel",
      "id": "graph",
      "name": "Graph",
      "version": "5.0.0"
    },
    {
      "type": "datasource",
      "id": "prometheus",
      "name": "Prometheus",
      "version": "5.0.0"
    }
  ],
  "annotations": {
    "list": [
      {
        "builtIn": 1,
        "datasource": "-- Grafana --",
        "enable": true,
        "hide": true,
        "iconColor": "rgba(0, 211, 255, 1)",
        "name": "Annotations & Alerts",
        "type": "dashboard"
      }
    ]
  },
  "editable": true,
  "gnetId": null,
  "graphTooltip": 0,
  "id": null,
  "links": [],
  "panels": [
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": "Prometheus",
      "fill": 1,
      "gridPos": {
        "h": 9,
        "w": 12,
        "x": 0,
        "y": 0
      },
      "id": 2,
      "legend": {
        "avg": false,
        "current": false,
        "max": false,
        "min": false,
        "show": true,
        "total": false,
        "values": false
      },
      "lines": true,
      "linewidth": 1,
      "links": [],
      "nullPointMode": "null",
      "percentage": false,
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "expr": "sum(rate(container_cpu_usage_seconds_total{pod_name=~\"istio-telemetry-.*\"}[1m]))/ (round(sum(irate(istio_requests_total[1m])), 0.001)/1000)",
          "format": "time_series",
          "intervalFactor": 1,
          "legendFormat": "istio-telemetry",
          "refId": "A"
        },
        {
          "expr": "sum(rate(container_cpu_usage_seconds_total{pod_name=~\"istio-ingressgateway-.*\"}[1m])) / (round(sum(irate(istio_requests_total{source_workload=\"istio-ingressgateway\", reporter=\"source\"}[1m])), 0.001)/1000)",
          "format": "time_series",
          "intervalFactor": 1,
          "legendFormat": "istio-ingressgateway",
          "refId": "B"
        },
        {
          "expr": "sum(rate(container_cpu_usage_seconds_total{container_name=\"istio-proxy\"}[1m]))/ (round(sum(irate(istio_requests_total[1m])), 0.001)/1000)",
          "format": "time_series",
          "intervalFactor": 1,
          "legendFormat": "istio-proxy",
          "refId": "C"
        },
        {
          "expr": "sum(rate(container_cpu_usage_seconds_total{pod_name=~\"istio-policy-.*\"}[1m]))/ (round(sum(irate(istio_requests_total[1m])), 0.001)/1000)",
          "format": "time_series",
          "intervalFactor": 1,
          "legendFormat": "istio-policy",
          "refId": "D"
        }
      ],
      "thresholds": [],
      "timeFrom": null,
      "timeShift": null,
      "title": "vCPU / 1k rps",
      "tooltip": {
        "shared": true,
        "sort": 0,
        "value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
        "buckets": null,
        "mode": "time",
        "name": null,
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        },
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        }
      ],
      "yaxis": {
        "align": false,
        "alignLevel": null
      }
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": "Prometheus",
      "fill": 1,
      "gridPos": {
        "h": 9,
        "w": 12,
        "x": 12,
        "y": 0
      },
      "id": 6,
      "legend": {
        "avg": false,
        "current": false,
        "max": false,
        "min": false,
        "show": true,
        "total": false,
        "values": false
      },
      "lines": true,
      "linewidth": 1,
      "links": [],
      "nullPointMode": "null",
      "percentage": false,
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "expr": "sum(rate(container_cpu_usage_seconds_total{pod_name=~\"istio-telemetry-.*\"}[1m]))",
          "format": "time_series",
          "intervalFactor": 1,
          "legendFormat": "istio-telemetry",
          "refId": "A"
        },
        {
          "expr": "sum(rate(container_cpu_usage_seconds_total{pod_name=~\"istio-ingressgateway-.*\"}[1m]))",
          "format": "time_series",
          "intervalFactor": 1,
          "legendFormat": "istio-ingressgateway",
          "refId": "B"
        },
        {
          "expr": "sum(rate(container_cpu_usage_seconds_total{container_name=\"istio-proxy\"}[1m]))",
          "format": "time_series",
          "intervalFactor": 1,
          "legendFormat": "istio-proxy",
          "refId": "C"
        },
        {
          "expr": "sum(rate(container_cpu_usage_seconds_total{pod_name=~\"istio-policy-.*\"}[1m]))",
          "format": "time_series",
          "intervalFactor": 1,
          "legendFormat": "istio-policy",
          "refId": "D"
        }
      ],
      "thresholds": [],
      "timeFrom": null,
      "timeShift": null,
      "title": "vCPU",
      "tooltip": {
        "shared": true,
        "sort": 0,
        "value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
        "buckets": null,
        "mode": "time",
        "name": null,
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        },
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        }
      ],
      "yaxis": {
        "align": false,
        "alignLevel": null
      }
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": "Prometheus",
      "fill": 1,
      "gridPos": {
        "h": 9,
        "w": 12,
        "x": 0,
        "y": 9
      },
      "id": 4,
      "legend": {
        "avg": false,
        "current": false,
        "max": false,
        "min": false,
        "show": true,
        "total": false,
        "values": false
      },
      "lines": true,
      "linewidth": 1,
      "links": [],
      "nullPointMode": "null",
      "percentage": false,
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "expr": "sum(container_memory_usage_bytes{pod_name=~\"istio-telemetry-.*\"}) / (sum(irate(istio_requests_total[1m])) / 1000)",
          "format": "time_series",
          "intervalFactor": 1,
          "legendFormat": "istio-telemetry / 1k rps",
          "refId": "A"
        },
        {
          "expr": "sum(container_memory_usage_bytes{pod_name=~\"istio-ingressgateway-.*\"}) / count(container_memory_usage_bytes{pod_name=~\"istio-ingressgateway-.*\"})",
          "format": "time_series",
          "intervalFactor": 1,
          "legendFormat": "per istio-ingressgateway",
          "refId": "C"
        },
        {
          "expr": "sum(container_memory_usage_bytes{container_name=\"istio-proxy\"}) / count(container_memory_usage_bytes{container_name=\"istio-proxy\"})",
          "format": "time_series",
          "intervalFactor": 1,
          "legendFormat": "per istio-proxy",
          "refId": "B"
        },
        {
          "expr": "sum(container_memory_usage_bytes{pod_name=~\"istio-policy-.*\"}) / (sum(irate(istio_requests_total[1m])) / 1000)",
          "format": "time_series",
          "intervalFactor": 1,
          "legendFormat": "istio-policy / 1k rps",
          "refId": "D"
        }
      ],
      "thresholds": [],
      "timeFrom": null,
      "timeShift": null,
      "title": "Memory",
      "tooltip": {
        "shared": true,
        "sort": 0,
        "value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
        "buckets": null,
        "mode": "time",
        "name": null,
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "decbytes",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        },
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        }
      ],
      "yaxis": {
        "align": false,
        "alignLevel": null
      }
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": "Prometheus",
      "fill": 1,
      "gridPos": {
        "h": 9,
        "w": 12,
        "x": 12,
        "y": 9
      },
      "id": 5,
      "legend": {
        "avg": false,
        "current": false,
        "max": false,
        "min": false,
        "show": true,
        "total": false,
        "values": false
      },
      "lines": true,
      "linewidth": 1,
      "links": [],
      "nullPointMode": "null",
      "percentage": false,
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "expr": "sum(irate(istio_response_bytes_sum{destination_workload=\"istio-telemetry\"}[1m])) + sum(irate(istio_request_bytes_sum{destination_workload=\"istio-telemetry\"}[1m]))",
          "format": "time_series",
          "intervalFactor": 1,
          "legendFormat": "istio-telemetry",
          "refId": "A"
        },
        {
          "expr": "sum(irate(istio_response_bytes_sum{source_workload=\"istio-ingressgateway\", reporter=\"source\"}[1m]))",
          "format": "time_series",
          "intervalFactor": 1,
          "legendFormat": "istio-ingressgateway",
          "refId": "C"
        },
        {
          "expr": "sum(irate(istio_response_bytes_sum{source_workload_namespace!=\"istio-system\", reporter=\"source\"}[1m])) + sum(irate(istio_response_bytes_sum{destination_workload_namespace!=\"istio-system\", reporter=\"destination\"}[1m])) + sum(irate(istio_request_bytes_sum{source_workload_namespace!=\"istio-system\", reporter=\"source\"}[1m])) + sum(irate(istio_request_bytes_sum{destination_workload_namespace!=\"istio-system\", reporter=\"destination\"}[1m]))",
          "format": "time_series",
          "intervalFactor": 1,
          "legendFormat": "istio-proxy",
          "refId": "D"
        },
        {
          "expr": "sum(irate(istio_response_bytes_sum{destination_workload=\"istio-policy\"}[1m])) + sum(irate(istio_request_bytes_sum{destination_workload=\"istio-policy\"}[1m]))",
          "format": "time_series",
          "intervalFactor": 1,
          "legendFormat": "istio-policy",
          "refId": "E"
        }
      ],
      "thresholds": [],
      "timeFrom": null,
      "timeShift": null,
      "title": "Bytes transferred / sec",
      "tooltip": {
        "shared": true,
        "sort": 0,
        "value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
        "buckets": null,
        "mode": "time",
        "name": null,
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "bytes",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        },
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        }
      ],
      "yaxis": {
        "align": false,
        "alignLevel": null
      }
    }
  ],
  "schemaVersion": 16,
  "style": "dark",
  "tags": [],
  "templating": {
    "list": []
  },
  "time": {
    "from": "now-5m",
    "to": "now"
  },
  "timepicker": {
    "refresh_intervals": [
      "5s",
      "10s",
      "30s",
      "1m",
      "5m",
      "15m",
      "30m",
      "1h",
      "2h",
      "1d"
    ],
    "time_options": [
      "5m",
      "15m",
      "1h",
      "6h",
      "12h",
      "24h",
      "2d",
      "7d",
      "30d"
    ]
  },
  "timezone": "",
  "title": "Istio Performance Dashboard",
  "uid": "t8BUIg1mz",
  "version": 5
}
'
  
  istio-service-dashboard.json: '{
  "__inputs": [
    {
      "name": "DS_PROMETHEUS",
      "label": "Prometheus",
      "description": "",
      "type": "datasource",
      "pluginId": "prometheus",
      "pluginName": "Prometheus"
    }
  ],
  "__requires": [
    {
      "type": "grafana",
      "id": "grafana",
      "name": "Grafana",
      "version": "5.0.4"
    },
    {
      "type": "panel",
      "id": "graph",
      "name": "Graph",
      "version": "5.0.0"
    },
    {
      "type": "datasource",
      "id": "prometheus",
      "name": "Prometheus",
      "version": "5.0.0"
    },
    {
      "type": "panel",
      "id": "singlestat",
      "name": "Singlestat",
      "version": "5.0.0"
    },
    {
      "type": "panel",
      "id": "text",
      "name": "Text",
      "version": "5.0.0"
    }
  ],
  "annotations": {
    "list": [
      {
        "builtIn": 1,
        "datasource": "-- Grafana --",
        "enable": true,
        "hide": true,
        "iconColor": "rgba(0, 211, 255, 1)",
        "name": "Annotations & Alerts",
        "type": "dashboard"
      }
    ]
  },
  "editable": true,
  "gnetId": null,
  "graphTooltip": 0,
  "id": null,
  "iteration": 1530559387240,
  "links": [],
  "panels": [
    {
      "content": "<div class=\"dashboard-header text-center\">\n<span>SERVICE: $service</span>\n</div>",
      "gridPos": {
        "h": 3,
        "w": 24,
        "x": 0,
        "y": 0
      },
      "id": 89,
      "links": [],
      "mode": "html",
      "title": "",
      "transparent": true,
      "type": "text"
    },
    {
      "cacheTimeout": null,
      "colorBackground": false,
      "colorValue": false,
      "colors": [
        "rgba(245, 54, 54, 0.9)",
        "rgba(237, 129, 40, 0.89)",
        "rgba(50, 172, 45, 0.97)"
      ],
      "datasource": "Prometheus",
      "format": "ops",
      "gauge": {
        "maxValue": 100,
        "minValue": 0,
        "show": false,
        "thresholdLabels": false,
        "thresholdMarkers": true
      },
      "gridPos": {
        "h": 4,
        "w": 6,
        "x": 0,
        "y": 3
      },
      "id": 12,
      "interval": null,
      "links": [],
      "mappingType": 1,
      "mappingTypes": [
        {
          "name": "value to text",
          "value": 1
        },
        {
          "name": "range to text",
          "value": 2
        }
      ],
      "maxDataPoints": 100,
      "nullPointMode": "connected",
      "nullText": null,
      "postfix": "",
      "postfixFontSize": "50%",
      "prefix": "",
      "prefixFontSize": "50%",
      "rangeMaps": [
        {
          "from": "null",
          "text": "N/A",
          "to": "null"
        }
      ],
      "sparkline": {
        "fillColor": "rgba(31, 118, 189, 0.18)",
        "full": true,
        "lineColor": "rgb(31, 120, 193)",
        "show": true
      },
      "tableColumn": "",
      "targets": [
        {
          "expr": "round(sum(rate(istio_requests_total{reporter=\"source\",destination_service=~\"$service\"}[30s])), 0.001)",
          "format": "time_series",
          "intervalFactor": 1,
          "refId": "A",
          "step": 4
        }
      ],
      "thresholds": "",
      "title": "Client Request Volume",
      "transparent": false,
      "type": "singlestat",
      "valueFontSize": "80%",
      "valueMaps": [
        {
          "op": "=",
          "text": "N/A",
          "value": "null"
        }
      ],
      "valueName": "current"
    },
    {
      "cacheTimeout": null,
      "colorBackground": false,
      "colorValue": false,
      "colors": [
        "rgba(50, 172, 45, 0.97)",
        "rgba(237, 129, 40, 0.89)",
        "rgba(245, 54, 54, 0.9)"
      ],
      "datasource": "Prometheus",
      "decimals": null,
      "format": "percentunit",
      "gauge": {
        "maxValue": 100,
        "minValue": 80,
        "show": false,
        "thresholdLabels": false,
        "thresholdMarkers": false
      },
      "gridPos": {
        "h": 4,
        "w": 6,
        "x": 6,
        "y": 3
      },
      "id": 14,
      "interval": null,
      "links": [],
      "mappingType": 1,
      "mappingTypes": [
        {
          "name": "value to text",
          "value": 1
        },
        {
          "name": "range to text",
          "value": 2
        }
      ],
      "maxDataPoints": 100,
      "nullPointMode": "connected",
      "nullText": null,
      "postfix": "",
      "postfixFontSize": "50%",
      "prefix": "",
      "prefixFontSize": "50%",
      "rangeMaps": [
        {
          "from": "null",
          "text": "N/A",
          "to": "null"
        }
      ],
      "sparkline": {
        "fillColor": "rgba(31, 118, 189, 0.18)",
        "full": true,
        "lineColor": "rgb(31, 120, 193)",
        "show": true
      },
      "tableColumn": "",
      "targets": [
        {
          "expr": "sum(irate(istio_requests_total{reporter=\"source\",destination_service=~\"$service\",response_code!~\"5.*\"}[30s])) / sum(irate(istio_requests_total{reporter=\"source\",destination_service=~\"$service\"}[30s]))",
          "format": "time_series",
          "intervalFactor": 1,
          "refId": "B"
        }
      ],
      "thresholds": "95, 99, 99.5",
      "title": "Client Success Rate (non-5xx responses)",
      "transparent": false,
      "type": "singlestat",
      "valueFontSize": "80%",
      "valueMaps": [
        {
          "op": "=",
          "text": "N/A",
          "value": "null"
        }
      ],
      "valueName": "avg"
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": "Prometheus",
      "fill": 1,
      "gridPos": {
        "h": 4,
        "w": 6,
        "x": 12,
        "y": 3
      },
      "id": 87,
      "legend": {
        "alignAsTable": false,
        "avg": false,
        "current": false,
        "hideEmpty": false,
        "hideZero": false,
        "max": false,
        "min": false,
        "rightSide": true,
        "show": true,
        "total": false,
        "values": false
      },
      "lines": true,
      "linewidth": 1,
      "links": [],
      "nullPointMode": "null",
      "percentage": false,
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "expr": "histogram_quantile(0.50, sum(irate(istio_request_duration_seconds_bucket{reporter=\"source\",destination_service=~\"$service\"}[1m])) by (le))",
          "format": "time_series",
          "interval": "",
          "intervalFactor": 1,
          "legendFormat": "P50",
          "refId": "A"
        },
        {
          "expr": "histogram_quantile(0.90, sum(irate(istio_request_duration_seconds_bucket{reporter=\"source\",destination_service=~\"$service\"}[1m])) by (le))",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 1,
          "legendFormat": "P90",
          "refId": "B"
        },
        {
          "expr": "histogram_quantile(0.99, sum(irate(istio_request_duration_seconds_bucket{reporter=\"source\",destination_service=~\"$service\"}[1m])) by (le))",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 1,
          "legendFormat": "P99",
          "refId": "C"
        }
      ],
      "thresholds": [],
      "timeFrom": null,
      "timeShift": null,
      "title": "Client Request Duration",
      "tooltip": {
        "shared": true,
        "sort": 0,
        "value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
        "buckets": null,
        "mode": "time",
        "name": null,
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "s",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        },
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": false
        }
      ]
    },
    {
      "cacheTimeout": null,
      "colorBackground": false,
      "colorValue": false,
      "colors": [
        "#299c46",
        "rgba(237, 129, 40, 0.89)",
        "#d44a3a"
      ],
      "datasource": "Prometheus",
      "format": "Bps",
      "gauge": {
        "maxValue": 100,
        "minValue": 0,
        "show": false,
        "thresholdLabels": false,
        "thresholdMarkers": true
      },
      "gridPos": {
        "h": 4,
        "w": 6,
        "x": 18,
        "y": 3
      },
      "id": 84,
      "interval": null,
      "links": [],
      "mappingType": 1,
      "mappingTypes": [
        {
          "name": "value to text",
          "value": 1
        },
        {
          "name": "range to text",
          "value": 2
        }
      ],
      "maxDataPoints": 100,
      "nullPointMode": "connected",
      "nullText": null,
      "postfix": "",
      "postfixFontSize": "50%",
      "prefix": "",
      "prefixFontSize": "50%",
      "rangeMaps": [
        {
          "from": "null",
          "text": "N/A",
          "to": "null"
        }
      ],
      "sparkline": {
        "fillColor": "rgba(31, 118, 189, 0.18)",
        "full": true,
        "lineColor": "rgb(31, 120, 193)",
        "show": true
      },
      "tableColumn": "",
      "targets": [
        {
          "expr": "sum(irate(istio_tcp_sent_bytes_total{reporter=\"source\", destination_service=~\"$service\"}[1m])) + sum(irate(istio_tcp_received_bytes_total{reporter=\"source\", destination_service=~\"$service\"}[1m]))",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 1,
          "legendFormat": "",
          "refId": "A"
        }
      ],
      "thresholds": "",
      "title": "Client TCP Bandwidth",
      "transparent": false,
      "type": "singlestat",
      "valueFontSize": "80%",
      "valueMaps": [
        {
          "op": "=",
          "text": "N/A",
          "value": "null"
        }
      ],
      "valueName": "avg"
    },
    {
      "cacheTimeout": null,
      "colorBackground": false,
      "colorValue": false,
      "colors": [
        "rgba(245, 54, 54, 0.9)",
        "rgba(237, 129, 40, 0.89)",
        "rgba(50, 172, 45, 0.97)"
      ],
      "datasource": "Prometheus",
      "format": "ops",
      "gauge": {
        "maxValue": 100,
        "minValue": 0,
        "show": false,
        "thresholdLabels": false,
        "thresholdMarkers": true
      },
      "gridPos": {
        "h": 4,
        "w": 6,
        "x": 0,
        "y": 7
      },
      "id": 97,
      "interval": null,
      "links": [],
      "mappingType": 1,
      "mappingTypes": [
        {
          "name": "value to text",
          "value": 1
        },
        {
          "name": "range to text",
          "value": 2
        }
      ],
      "maxDataPoints": 100,
      "nullPointMode": "connected",
      "nullText": null,
      "postfix": "",
      "postfixFontSize": "50%",
      "prefix": "",
      "prefixFontSize": "50%",
      "rangeMaps": [
        {
          "from": "null",
          "text": "N/A",
          "to": "null"
        }
      ],
      "sparkline": {
        "fillColor": "rgba(31, 118, 189, 0.18)",
        "full": true,
        "lineColor": "rgb(31, 120, 193)",
        "show": true
      },
      "tableColumn": "",
      "targets": [
        {
          "expr": "round(sum(rate(istio_requests_total{reporter=\"destination\",destination_service=~\"$service\"}[30s])), 0.001)",
          "format": "time_series",
          "intervalFactor": 1,
          "refId": "A",
          "step": 4
        }
      ],
      "thresholds": "",
      "title": "Server Request Volume",
      "transparent": false,
      "type": "singlestat",
      "valueFontSize": "80%",
      "valueMaps": [
        {
          "op": "=",
          "text": "N/A",
          "value": "null"
        }
      ],
      "valueName": "current"
    },
    {
      "cacheTimeout": null,
      "colorBackground": false,
      "colorValue": false,
      "colors": [
        "rgba(50, 172, 45, 0.97)",
        "rgba(237, 129, 40, 0.89)",
        "rgba(245, 54, 54, 0.9)"
      ],
      "datasource": "Prometheus",
      "decimals": null,
      "format": "percentunit",
      "gauge": {
        "maxValue": 100,
        "minValue": 80,
        "show": false,
        "thresholdLabels": false,
        "thresholdMarkers": false
      },
      "gridPos": {
        "h": 4,
        "w": 6,
        "x": 6,
        "y": 7
      },
      "id": 98,
      "interval": null,
      "links": [],
      "mappingType": 1,
      "mappingTypes": [
        {
          "name": "value to text",
          "value": 1
        },
        {
          "name": "range to text",
          "value": 2
        }
      ],
      "maxDataPoints": 100,
      "nullPointMode": "connected",
      "nullText": null,
      "postfix": "",
      "postfixFontSize": "50%",
      "prefix": "",
      "prefixFontSize": "50%",
      "rangeMaps": [
        {
          "from": "null",
          "text": "N/A",
          "to": "null"
        }
      ],
      "sparkline": {
        "fillColor": "rgba(31, 118, 189, 0.18)",
        "full": true,
        "lineColor": "rgb(31, 120, 193)",
        "show": true
      },
      "tableColumn": "",
      "targets": [
        {
          "expr": "sum(irate(istio_requests_total{reporter=\"destination\",destination_service=~\"$service\",response_code!~\"5.*\"}[30s])) / sum(irate(istio_requests_total{reporter=\"destination\",destination_service=~\"$service\"}[30s]))",
          "format": "time_series",
          "intervalFactor": 1,
          "refId": "B"
        }
      ],
      "thresholds": "95, 99, 99.5",
      "title": "Server Success Rate (non-5xx responses)",
      "transparent": false,
      "type": "singlestat",
      "valueFontSize": "80%",
      "valueMaps": [
        {
          "op": "=",
          "text": "N/A",
          "value": "null"
        }
      ],
      "valueName": "avg"
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": "Prometheus",
      "fill": 1,
      "gridPos": {
        "h": 4,
        "w": 6,
        "x": 12,
        "y": 7
      },
      "id": 99,
      "legend": {
        "alignAsTable": false,
        "avg": false,
        "current": false,
        "hideEmpty": false,
        "hideZero": false,
        "max": false,
        "min": false,
        "rightSide": true,
        "show": true,
        "total": false,
        "values": false
      },
      "lines": true,
      "linewidth": 1,
      "links": [],
      "nullPointMode": "null",
      "percentage": false,
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "expr": "histogram_quantile(0.50, sum(irate(istio_request_duration_seconds_bucket{reporter=\"destination\",destination_service=~\"$service\"}[1m])) by (le))",
          "format": "time_series",
          "interval": "",
          "intervalFactor": 1,
          "legendFormat": "P50",
          "refId": "A"
        },
        {
          "expr": "histogram_quantile(0.90, sum(irate(istio_request_duration_seconds_bucket{reporter=\"destination\",destination_service=~\"$service\"}[1m])) by (le))",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 1,
          "legendFormat": "P90",
          "refId": "B"
        },
        {
          "expr": "histogram_quantile(0.99, sum(irate(istio_request_duration_seconds_bucket{reporter=\"destination\",destination_service=~\"$service\"}[1m])) by (le))",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 1,
          "legendFormat": "P99",
          "refId": "C"
        }
      ],
      "thresholds": [],
      "timeFrom": null,
      "timeShift": null,
      "title": "Server Request Duration",
      "tooltip": {
        "shared": true,
        "sort": 0,
        "value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
        "buckets": null,
        "mode": "time",
        "name": null,
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "s",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        },
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": false
        }
      ]
    },
    {
      "cacheTimeout": null,
      "colorBackground": false,
      "colorValue": false,
      "colors": [
        "#299c46",
        "rgba(237, 129, 40, 0.89)",
        "#d44a3a"
      ],
      "datasource": "Prometheus",
      "format": "Bps",
      "gauge": {
        "maxValue": 100,
        "minValue": 0,
        "show": false,
        "thresholdLabels": false,
        "thresholdMarkers": true
      },
      "gridPos": {
        "h": 4,
        "w": 6,
        "x": 18,
        "y": 7
      },
      "id": 100,
      "interval": null,
      "links": [],
      "mappingType": 1,
      "mappingTypes": [
        {
          "name": "value to text",
          "value": 1
        },
        {
          "name": "range to text",
          "value": 2
        }
      ],
      "maxDataPoints": 100,
      "nullPointMode": "connected",
      "nullText": null,
      "postfix": "",
      "postfixFontSize": "50%",
      "prefix": "",
      "prefixFontSize": "50%",
      "rangeMaps": [
        {
          "from": "null",
          "text": "N/A",
          "to": "null"
        }
      ],
      "sparkline": {
        "fillColor": "rgba(31, 118, 189, 0.18)",
        "full": true,
        "lineColor": "rgb(31, 120, 193)",
        "show": true
      },
      "tableColumn": "",
      "targets": [
        {
          "expr": "sum(irate(istio_tcp_sent_bytes_total{reporter=\"destination\", destination_service=~\"$service\"}[1m])) + sum(irate(istio_tcp_received_bytes_total{reporter=\"destination\", destination_service=~\"$service\"}[1m]))",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 1,
          "legendFormat": "",
          "refId": "A"
        }
      ],
      "thresholds": "",
      "title": "Server TCP Bandwidth",
      "transparent": false,
      "type": "singlestat",
      "valueFontSize": "80%",
      "valueMaps": [
        {
          "op": "=",
          "text": "N/A",
          "value": "null"
        }
      ],
      "valueName": "avg"
    },
    {
      "content": "<div class=\"dashboard-header text-center\">\n<span>CLIENT WORKLOADS</span>\n</div>",
      "gridPos": {
        "h": 3,
        "w": 24,
        "x": 0,
        "y": 11
      },
      "id": 45,
      "links": [],
      "mode": "html",
      "title": "",
      "transparent": true,
      "type": "text"
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": "Prometheus",
      "fill": 0,
      "gridPos": {
        "h": 6,
        "w": 12,
        "x": 0,
        "y": 14
      },
      "id": 25,
      "legend": {
        "avg": false,
        "current": false,
        "hideEmpty": true,
        "max": false,
        "min": false,
        "show": true,
        "total": false,
        "values": false
      },
      "lines": true,
      "linewidth": 1,
      "links": [],
      "nullPointMode": "null as zero",
      "percentage": false,
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "expr": "round(sum(irate(istio_requests_total{connection_security_policy=\"mutual_tls\",destination_service=~\"$service\",reporter=\"source\",source_workload=~\"$srcwl\",source_workload_namespace=~\"$srcns\"}[30s])) by (source_workload, source_workload_namespace, response_code), 0.001)",
          "format": "time_series",
          "intervalFactor": 1,
          "legendFormat": "{{ source_workload }}.{{ source_workload_namespace }} : {{ response_code }} (🔐mTLS)",
          "refId": "B",
          "step": 2
        },
        {
          "expr": "round(sum(irate(istio_requests_total{connection_security_policy!=\"mutual_tls\", destination_service=~\"$service\", reporter=\"source\", source_workload=~\"$srcwl\", source_workload_namespace=~\"$srcns\"}[30s])) by (source_workload, source_workload_namespace, response_code), 0.001)",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 1,
          "legendFormat": "{{ source_workload }}.{{ source_workload_namespace }} : {{ response_code }}",
          "refId": "A",
          "step": 2
        }
      ],
      "thresholds": [],
      "timeFrom": null,
      "timeShift": null,
      "title": "Incoming Requests by Source And Response Code",
      "tooltip": {
        "shared": false,
        "sort": 0,
        "value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
        "buckets": null,
        "mode": "time",
        "name": null,
        "show": true,
        "values": [
          "total"
        ]
      },
      "yaxes": [
        {
          "format": "ops",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": "0",
          "show": true
        },
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": false
        }
      ]
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": "Prometheus",
      "fill": 1,
      "gridPos": {
        "h": 6,
        "w": 12,
        "x": 12,
        "y": 14
      },
      "id": 26,
      "legend": {
        "avg": false,
        "current": false,
        "hideEmpty": true,
        "hideZero": false,
        "max": false,
        "min": false,
        "show": true,
        "total": false,
        "values": false
      },
      "lines": true,
      "linewidth": 1,
      "links": [],
      "nullPointMode": "null",
      "percentage": false,
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "expr": "sum(rate(istio_requests_total{reporter=\"source\", connection_security_policy=\"mutual_tls\", destination_service=~\"$service\",response_code!~\"5.*\", source_workload=~\"$srcwl\", source_workload_namespace=~\"$srcns\"}[30s])) by (source_workload, source_workload_namespace) / sum(rate(istio_requests_total{reporter=\"source\", connection_security_policy=\"mutual_tls\", destination_service=~\"$service\", source_workload=~\"$srcwl\", source_workload_namespace=~\"$srcns\"}[30s])) by (source_workload, source_workload_namespace)",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 1,
          "legendFormat": "{{ source_workload }}.{{ source_workload_namespace }} (🔐mTLS)",
          "refId": "A",
          "step": 2
        },
        {
          "expr": "sum(rate(istio_requests_total{reporter=\"source\", connection_security_policy!=\"mutual_tls\", destination_service=~\"$service\",response_code!~\"5.*\", source_workload=~\"$srcwl\", source_workload_namespace=~\"$srcns\"}[30s])) by (source_workload, source_workload_namespace) / sum(rate(istio_requests_total{reporter=\"source\", connection_security_policy!=\"mutual_tls\", destination_service=~\"$service\", source_workload=~\"$srcwl\", source_workload_namespace=~\"$srcns\"}[30s])) by (source_workload, source_workload_namespace)",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 1,
          "legendFormat": "{{ source_workload }}.{{ source_workload_namespace }}",
          "refId": "B",
          "step": 2
        }
      ],
      "thresholds": [],
      "timeFrom": null,
      "timeShift": null,
      "title": "Incoming Success Rate (non-5xx responses) By Source",
      "tooltip": {
        "shared": true,
        "sort": 0,
        "value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
        "buckets": null,
        "mode": "time",
        "name": null,
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "percentunit",
          "label": null,
          "logBase": 1,
          "max": "1.01",
          "min": "0",
          "show": true
        },
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": false
        }
      ]
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": "Prometheus",
      "description": "",
      "fill": 1,
      "gridPos": {
        "h": 6,
        "w": 8,
        "x": 0,
        "y": 20
      },
      "id": 27,
      "legend": {
        "alignAsTable": false,
        "avg": false,
        "current": false,
        "hideEmpty": true,
        "hideZero": false,
        "max": false,
        "min": false,
        "rightSide": false,
        "show": true,
        "total": false,
        "values": false
      },
      "lines": true,
      "linewidth": 1,
      "links": [],
      "nullPointMode": "null",
      "percentage": false,
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "expr": "histogram_quantile(0.50, sum(irate(istio_request_duration_seconds_bucket{reporter=\"source\", connection_security_policy=\"mutual_tls\", destination_service=~\"$service\", source_workload=~\"$srcwl\", source_workload_namespace=~\"$srcns\"}[1m])) by (source_workload, source_workload_namespace, le))",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 1,
          "legendFormat": "{{source_workload}}.{{source_workload_namespace}} P50 (🔐mTLS)",
          "refId": "D",
          "step": 2
        },
        {
          "expr": "histogram_quantile(0.90, sum(irate(istio_request_duration_seconds_bucket{reporter=\"source\", connection_security_policy=\"mutual_tls\", destination_service=~\"$service\", source_workload=~\"$srcwl\", source_workload_namespace=~\"$srcns\"}[1m])) by (source_workload, source_workload_namespace, le))",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 1,
          "legendFormat": "{{source_workload}}.{{source_workload_namespace}} P90 (🔐mTLS)",
          "refId": "A",
          "step": 2
        },
        {
          "expr": "histogram_quantile(0.95, sum(irate(istio_request_duration_seconds_bucket{reporter=\"source\", connection_security_policy=\"mutual_tls\", destination_service=~\"$service\", source_workload=~\"$srcwl\", source_workload_namespace=~\"$srcns\"}[1m])) by (source_workload, source_workload_namespace, le))",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 1,
          "legendFormat": "{{source_workload}}.{{source_workload_namespace}} P95 (🔐mTLS)",
          "refId": "B",
          "step": 2
        },
        {
          "expr": "histogram_quantile(0.99, sum(irate(istio_request_duration_seconds_bucket{reporter=\"source\", connection_security_policy=\"mutual_tls\", destination_service=~\"$service\", source_workload=~\"$srcwl\", source_workload_namespace=~\"$srcns\"}[1m])) by (source_workload, source_workload_namespace, le))",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 1,
          "legendFormat": "{{source_workload}}.{{source_workload_namespace}} P99 (🔐mTLS)",
          "refId": "C",
          "step": 2
        },
        {
          "expr": "histogram_quantile(0.50, sum(irate(istio_request_duration_seconds_bucket{reporter=\"source\", connection_security_policy!=\"mutual_tls\", destination_service=~\"$service\", source_workload=~\"$srcwl\", source_workload_namespace=~\"$srcns\"}[1m])) by (source_workload, source_workload_namespace, le))",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 1,
          "legendFormat": "{{source_workload}}.{{source_workload_namespace}} P50",
          "refId": "E",
          "step": 2
        },
        {
          "expr": "histogram_quantile(0.90, sum(irate(istio_request_duration_seconds_bucket{reporter=\"source\", connection_security_policy!=\"mutual_tls\", destination_service=~\"$service\", source_workload=~\"$srcwl\", source_workload_namespace=~\"$srcns\"}[1m])) by (source_workload, source_workload_namespace, le))",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 1,
          "legendFormat": "{{source_workload}}.{{source_workload_namespace}} P90",
          "refId": "F",
          "step": 2
        },
        {
          "expr": "histogram_quantile(0.95, sum(irate(istio_request_duration_seconds_bucket{reporter=\"source\", connection_security_policy!=\"mutual_tls\", destination_service=~\"$service\", source_workload=~\"$srcwl\", source_workload_namespace=~\"$srcns\"}[1m])) by (source_workload, source_workload_namespace, le))",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 1,
          "legendFormat": "{{source_workload}}.{{source_workload_namespace}} P95",
          "refId": "G",
          "step": 2
        },
        {
          "expr": "histogram_quantile(0.99, sum(irate(istio_request_duration_seconds_bucket{reporter=\"source\", connection_security_policy!=\"mutual_tls\", destination_service=~\"$service\", source_workload=~\"$srcwl\", source_workload_namespace=~\"$srcns\"}[1m])) by (source_workload, source_workload_namespace, le))",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 1,
          "legendFormat": "{{source_workload}}.{{source_workload_namespace}} P99",
          "refId": "H",
          "step": 2
        }
      ],
      "thresholds": [],
      "timeFrom": null,
      "timeShift": null,
      "title": "Incoming Request Duration by Source",
      "tooltip": {
        "shared": true,
        "sort": 0,
        "value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
        "buckets": null,
        "mode": "time",
        "name": null,
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "s",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": "0",
          "show": true
        },
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": false
        }
      ]
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": "Prometheus",
      "fill": 1,
      "gridPos": {
        "h": 6,
        "w": 8,
        "x": 8,
        "y": 20
      },
      "id": 28,
      "legend": {
        "alignAsTable": false,
        "avg": false,
        "current": false,
        "hideEmpty": true,
        "max": false,
        "min": false,
        "rightSide": false,
        "show": true,
        "total": false,
        "values": false
      },
      "lines": true,
      "linewidth": 1,
      "links": [],
      "nullPointMode": "null",
      "percentage": false,
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "expr": "histogram_quantile(0.50, sum(irate(istio_request_bytes_bucket{reporter=\"source\", connection_security_policy=\"mutual_tls\", destination_service=~\"$service\", source_workload=~\"$srcwl\", source_workload_namespace=~\"$srcns\"}[1m])) by (source_workload, source_workload_namespace, le))",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 1,
          "legendFormat": "{{source_workload}}.{{source_workload_namespace}} P50 (🔐mTLS)",
          "refId": "D",
          "step": 2
        },
        {
          "expr": "histogram_quantile(0.90, sum(irate(istio_request_bytes_bucket{reporter=\"source\", connection_security_policy=\"mutual_tls\", destination_service=~\"$service\", source_workload=~\"$srcwl\", source_workload_namespace=~\"$srcns\"}[1m])) by (source_workload, source_workload_namespace, le))",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 1,
          "legendFormat": "{{source_workload}}.{{source_workload_namespace}}  P90 (🔐mTLS)",
          "refId": "A",
          "step": 2
        },
        {
          "expr": "histogram_quantile(0.95, sum(irate(istio_request_bytes_bucket{reporter=\"source\", connection_security_policy=\"mutual_tls\", destination_service=~\"$service\", source_workload=~\"$srcwl\", source_workload_namespace=~\"$srcns\"}[1m])) by (source_workload, source_workload_namespace, le))",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 1,
          "legendFormat": "{{source_workload}}.{{source_workload_namespace}} P95 (🔐mTLS)",
          "refId": "B",
          "step": 2
        },
        {
          "expr": "histogram_quantile(0.99, sum(irate(istio_request_bytes_bucket{reporter=\"source\", connection_security_policy=\"mutual_tls\", destination_service=~\"$service\", source_workload=~\"$srcwl\", source_workload_namespace=~\"$srcns\"}[1m])) by (source_workload, source_workload_namespace, le))",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 1,
          "legendFormat": "{{source_workload}}.{{source_workload_namespace}}  P99 (🔐mTLS)",
          "refId": "C",
          "step": 2
        },
        {
          "expr": "histogram_quantile(0.50, sum(irate(istio_request_bytes_bucket{reporter=\"source\", connection_security_policy!=\"mutual_tls\", destination_service=~\"$service\", source_workload=~\"$srcwl\", source_workload_namespace=~\"$srcns\"}[1m])) by (source_workload, source_workload_namespace, le))",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 1,
          "legendFormat": "{{source_workload}}.{{source_workload_namespace}} P50",
          "refId": "E",
          "step": 2
        },
        {
          "expr": "histogram_quantile(0.90, sum(irate(istio_request_bytes_bucket{reporter=\"source\", connection_security_policy!=\"mutual_tls\", destination_service=~\"$service\", source_workload=~\"$srcwl\", source_workload_namespace=~\"$srcns\"}[1m])) by (source_workload, source_workload_namespace, le))",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 1,
          "legendFormat": "{{source_workload}}.{{source_workload_namespace}} P90",
          "refId": "F",
          "step": 2
        },
        {
          "expr": "histogram_quantile(0.95, sum(irate(istio_request_bytes_bucket{reporter=\"source\", connection_security_policy!=\"mutual_tls\", destination_service=~\"$service\", source_workload=~\"$srcwl\", source_workload_namespace=~\"$srcns\"}[1m])) by (source_workload, source_workload_namespace, le))",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 1,
          "legendFormat": "{{source_workload}}.{{source_workload_namespace}} P95",
          "refId": "G",
          "step": 2
        },
        {
          "expr": "histogram_quantile(0.99, sum(irate(istio_request_bytes_bucket{reporter=\"source\", connection_security_policy!=\"mutual_tls\", destination_service=~\"$service\", source_workload=~\"$srcwl\", source_workload_namespace=~\"$srcns\"}[1m])) by (source_workload, source_workload_namespace, le))",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 1,
          "legendFormat": "{{source_workload}}.{{source_workload_namespace}} P99",
          "refId": "H",
          "step": 2
        }
      ],
      "thresholds": [],
      "timeFrom": null,
      "timeShift": null,
      "title": "Incoming Request Size By Source",
      "tooltip": {
        "shared": true,
        "sort": 0,
        "value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
        "buckets": null,
        "mode": "time",
        "name": null,
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "decbytes",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": "0",
          "show": true
        },
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": false
        }
      ]
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": "Prometheus",
      "fill": 1,
      "gridPos": {
        "h": 6,
        "w": 8,
        "x": 16,
        "y": 20
      },
      "id": 68,
      "legend": {
        "alignAsTable": false,
        "avg": false,
        "current": false,
        "hideEmpty": true,
        "max": false,
        "min": false,
        "rightSide": false,
        "show": true,
        "total": false,
        "values": false
      },
      "lines": true,
      "linewidth": 1,
      "links": [],
      "nullPointMode": "null",
      "percentage": false,
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "expr": "histogram_quantile(0.50, sum(irate(istio_response_bytes_bucket{reporter=\"source\", connection_security_policy=\"mutual_tls\", destination_service=~\"$service\", source_workload=~\"$srcwl\", source_workload_namespace=~\"$srcns\"}[1m])) by (source_workload, source_workload_namespace, le))",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 1,
          "legendFormat": "{{source_workload}}.{{source_workload_namespace}} P50 (🔐mTLS)",
          "refId": "D",
          "step": 2
        },
        {
          "expr": "histogram_quantile(0.90, sum(irate(istio_response_bytes_bucket{reporter=\"source\", connection_security_policy=\"mutual_tls\", destination_service=~\"$service\", source_workload=~\"$srcwl\", source_workload_namespace=~\"$srcns\"}[1m])) by (source_workload, source_workload_namespace, le))",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 1,
          "legendFormat": "{{source_workload}}.{{source_workload_namespace}}  P90 (🔐mTLS)",
          "refId": "A",
          "step": 2
        },
        {
          "expr": "histogram_quantile(0.95, sum(irate(istio_response_bytes_bucket{reporter=\"source\", connection_security_policy=\"mutual_tls\", destination_service=~\"$service\", source_workload=~\"$srcwl\", source_workload_namespace=~\"$srcns\"}[1m])) by (source_workload, source_workload_namespace, le))",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 1,
          "legendFormat": "{{source_workload}}.{{source_workload_namespace}} P95 (🔐mTLS)",
          "refId": "B",
          "step": 2
        },
        {
          "expr": "histogram_quantile(0.99, sum(irate(istio_response_bytes_bucket{reporter=\"source\", connection_security_policy=\"mutual_tls\", destination_service=~\"$service\", source_workload=~\"$srcwl\", source_workload_namespace=~\"$srcns\"}[1m])) by (source_workload, source_workload_namespace, le))",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 1,
          "legendFormat": "{{source_workload}}.{{source_workload_namespace}}  P99 (🔐mTLS)",
          "refId": "C",
          "step": 2
        },
        {
          "expr": "histogram_quantile(0.50, sum(irate(istio_response_bytes_bucket{reporter=\"source\", connection_security_policy!=\"mutual_tls\", destination_service=~\"$service\", source_workload=~\"$srcwl\", source_workload_namespace=~\"$srcns\"}[1m])) by (source_workload, source_workload_namespace, le))",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 1,
          "legendFormat": "{{source_workload}}.{{source_workload_namespace}} P50",
          "refId": "E",
          "step": 2
        },
        {
          "expr": "histogram_quantile(0.90, sum(irate(istio_response_bytes_bucket{reporter=\"source\", connection_security_policy!=\"mutual_tls\", destination_service=~\"$service\", source_workload=~\"$srcwl\", source_workload_namespace=~\"$srcns\"}[1m])) by (source_workload, source_workload_namespace, le))",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 1,
          "legendFormat": "{{source_workload}}.{{source_workload_namespace}} P90",
          "refId": "F",
          "step": 2
        },
        {
          "expr": "histogram_quantile(0.95, sum(irate(istio_response_bytes_bucket{reporter=\"source\", connection_security_policy!=\"mutual_tls\", destination_service=~\"$service\", source_workload=~\"$srcwl\", source_workload_namespace=~\"$srcns\"}[1m])) by (source_workload, source_workload_namespace, le))",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 1,
          "legendFormat": "{{source_workload}}.{{source_workload_namespace}} P95",
          "refId": "G",
          "step": 2
        },
        {
          "expr": "histogram_quantile(0.99, sum(irate(istio_response_bytes_bucket{reporter=\"source\", connection_security_policy!=\"mutual_tls\", destination_service=~\"$service\", source_workload=~\"$srcwl\", source_workload_namespace=~\"$srcns\"}[1m])) by (source_workload, source_workload_namespace, le))",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 1,
          "legendFormat": "{{source_workload}}.{{source_workload_namespace}} P99",
          "refId": "H",
          "step": 2
        }
      ],
      "thresholds": [],
      "timeFrom": null,
      "timeShift": null,
      "title": "Response Size By Source",
      "tooltip": {
        "shared": true,
        "sort": 0,
        "value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
        "buckets": null,
        "mode": "time",
        "name": null,
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "decbytes",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": "0",
          "show": true
        },
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": false
        }
      ]
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": "Prometheus",
      "fill": 1,
      "gridPos": {
        "h": 6,
        "w": 12,
        "x": 0,
        "y": 26
      },
      "id": 80,
      "legend": {
        "avg": false,
        "current": false,
        "max": false,
        "min": false,
        "show": true,
        "total": false,
        "values": false
      },
      "lines": true,
      "linewidth": 1,
      "links": [],
      "nullPointMode": "null",
      "percentage": false,
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "expr": "round(sum(irate(istio_tcp_received_bytes_total{reporter=\"source\", connection_security_policy=\"mutual_tls\", destination_service=~\"$service\", source_workload=~\"$srcwl\", source_workload_namespace=~\"$srcns\"}[1m])) by (source_workload, source_workload_namespace), 0.001)",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 1,
          "legendFormat": "{{ source_workload }}.{{ source_workload_namespace}} (🔐mTLS)",
          "refId": "A",
          "step": 2
        },
        {
          "expr": "round(sum(irate(istio_tcp_received_bytes_total{reporter=\"source\", connection_security_policy!=\"mutual_tls\", destination_service=~\"$service\", source_workload=~\"$srcwl\", source_workload_namespace=~\"$srcns\"}[1m])) by (source_workload, source_workload_namespace), 0.001)",
          "format": "time_series",
          "intervalFactor": 1,
          "legendFormat": "{{ source_workload }}.{{ source_workload_namespace}}",
          "refId": "B",
          "step": 2
        }
      ],
      "thresholds": [],
      "timeFrom": null,
      "timeShift": null,
      "title": "Bytes Received from Incoming TCP Connection",
      "tooltip": {
        "shared": true,
        "sort": 0,
        "value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
        "buckets": null,
        "mode": "time",
        "name": null,
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "Bps",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": "0",
          "show": true
        },
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        }
      ]
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": "Prometheus",
      "fill": 1,
      "gridPos": {
        "h": 6,
        "w": 12,
        "x": 12,
        "y": 26
      },
      "id": 82,
      "legend": {
        "avg": false,
        "current": false,
        "max": false,
        "min": false,
        "show": true,
        "total": false,
        "values": false
      },
      "lines": true,
      "linewidth": 1,
      "links": [],
      "nullPointMode": "null",
      "percentage": false,
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "expr": "round(sum(irate(istio_tcp_sent_bytes_total{connection_security_policy=\"mutual_tls\", reporter=\"source\", destination_service=~\"$service\", source_workload=~\"$srcwl\", source_workload_namespace=~\"$srcns\"}[1m])) by (source_workload, source_workload_namespace), 0.001)",
          "format": "time_series",
          "intervalFactor": 1,
          "legendFormat": "{{ source_workload }}.{{ source_workload_namespace}} (🔐mTLS)",
          "refId": "A",
          "step": 2
        },
        {
          "expr": "round(sum(irate(istio_tcp_sent_bytes_total{connection_security_policy!=\"mutual_tls\", reporter=\"source\", destination_service=~\"$service\", source_workload=~\"$srcwl\", source_workload_namespace=~\"$srcns\"}[1m])) by (source_workload, source_workload_namespace), 0.001)",
          "format": "time_series",
          "intervalFactor": 1,
          "legendFormat": "{{ source_workload }}.{{ source_workload_namespace}}",
          "refId": "B",
          "step": 2
        }
      ],
      "thresholds": [],
      "timeFrom": null,
      "timeShift": null,
      "title": "Bytes Sent to Incoming TCP Connection",
      "tooltip": {
        "shared": true,
        "sort": 0,
        "value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
        "buckets": null,
        "mode": "time",
        "name": null,
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "Bps",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": "0",
          "show": true
        },
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        }
      ]
    },
    {
      "content": "<div class=\"dashboard-header text-center\">\n<span>SERVICE WORKLOADS</span>\n</div>",
      "gridPos": {
        "h": 3,
        "w": 24,
        "x": 0,
        "y": 32
      },
      "id": 69,
      "links": [],
      "mode": "html",
      "title": "",
      "transparent": true,
      "type": "text"
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": "Prometheus",
      "fill": 0,
      "gridPos": {
        "h": 6,
        "w": 12,
        "x": 0,
        "y": 35
      },
      "id": 90,
      "legend": {
        "avg": false,
        "current": false,
        "hideEmpty": true,
        "max": false,
        "min": false,
        "show": true,
        "total": false,
        "values": false
      },
      "lines": true,
      "linewidth": 1,
      "links": [],
      "nullPointMode": "null as zero",
      "percentage": false,
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "expr": "round(sum(irate(istio_requests_total{connection_security_policy=\"mutual_tls\",destination_service=~\"$service\",reporter=\"destination\",destination_workload=~\"$dstwl\",destination_workload_namespace=~\"$dstns\"}[30s])) by (destination_workload, destination_workload_namespace, response_code), 0.001)",
          "format": "time_series",
          "intervalFactor": 1,
          "legendFormat": "{{ destination_workload }}.{{ destination_workload_namespace }} : {{ response_code }} (🔐mTLS)",
          "refId": "B",
          "step": 2
        },
        {
          "expr": "round(sum(irate(istio_requests_total{connection_security_policy!=\"mutual_tls\", destination_service=~\"$service\", reporter=\"destination\", destination_workload=~\"$dstwl\", destination_workload_namespace=~\"$dstns\"}[30s])) by (destination_workload, destination_workload_namespace, response_code), 0.001)",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 1,
          "legendFormat": "{{ destination_workload }}.{{ destination_workload_namespace }} : {{ response_code }}",
          "refId": "A",
          "step": 2
        }
      ],
      "thresholds": [],
      "timeFrom": null,
      "timeShift": null,
      "title": "Incoming Requests by Destination And Response Code",
      "tooltip": {
        "shared": false,
        "sort": 0,
        "value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
        "buckets": null,
        "mode": "time",
        "name": null,
        "show": true,
        "values": [
          "total"
        ]
      },
      "yaxes": [
        {
          "format": "ops",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": "0",
          "show": true
        },
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": false
        }
      ]
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": "Prometheus",
      "fill": 1,
      "gridPos": {
        "h": 6,
        "w": 12,
        "x": 12,
        "y": 35
      },
      "id": 91,
      "legend": {
        "avg": false,
        "current": false,
        "hideEmpty": true,
        "hideZero": false,
        "max": false,
        "min": false,
        "show": true,
        "total": false,
        "values": false
      },
      "lines": true,
      "linewidth": 1,
      "links": [],
      "nullPointMode": "null",
      "percentage": false,
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "expr": "sum(rate(istio_requests_total{reporter=\"destination\", connection_security_policy=\"mutual_tls\", destination_service=~\"$service\",response_code!~\"5.*\", destination_workload=~\"$dstwl\", destination_workload_namespace=~\"$dstns\"}[30s])) by (destination_workload, destination_workload_namespace) / sum(rate(istio_requests_total{reporter=\"destination\", connection_security_policy=\"mutual_tls\", destination_service=~\"$service\", destination_workload=~\"$dstwl\", destination_workload_namespace=~\"$dstns\"}[30s])) by (destination_workload, destination_workload_namespace)",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 1,
          "legendFormat": "{{ destination_workload }}.{{ destination_workload_namespace }} (🔐mTLS)",
          "refId": "A",
          "step": 2
        },
        {
          "expr": "sum(rate(istio_requests_total{reporter=\"destination\", connection_security_policy!=\"mutual_tls\", destination_service=~\"$service\",response_code!~\"5.*\", destination_workload=~\"$dstwl\", destination_workload_namespace=~\"$dstns\"}[30s])) by (destination_workload, destination_workload_namespace) / sum(rate(istio_requests_total{reporter=\"destination\", connection_security_policy!=\"mutual_tls\", destination_service=~\"$service\", destination_workload=~\"$dstwl\", destination_workload_namespace=~\"$dstns\"}[30s])) by (destination_workload, destination_workload_namespace)",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 1,
          "legendFormat": "{{ destination_workload }}.{{ destination_workload_namespace }}",
          "refId": "B",
          "step": 2
        }
      ],
      "thresholds": [],
      "timeFrom": null,
      "timeShift": null,
      "title": "Incoming Success Rate (non-5xx responses) By Source",
      "tooltip": {
        "shared": true,
        "sort": 0,
        "value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
        "buckets": null,
        "mode": "time",
        "name": null,
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "percentunit",
          "label": null,
          "logBase": 1,
          "max": "1.01",
          "min": "0",
          "show": true
        },
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": false
        }
      ]
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": "Prometheus",
      "description": "",
      "fill": 1,
      "gridPos": {
        "h": 6,
        "w": 8,
        "x": 0,
        "y": 41
      },
      "id": 94,
      "legend": {
        "alignAsTable": false,
        "avg": false,
        "current": false,
        "hideEmpty": true,
        "hideZero": false,
        "max": false,
        "min": false,
        "rightSide": false,
        "show": true,
        "total": false,
        "values": false
      },
      "lines": true,
      "linewidth": 1,
      "links": [],
      "nullPointMode": "null",
      "percentage": false,
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "expr": "histogram_quantile(0.50, sum(irate(istio_request_duration_seconds_bucket{reporter=\"destination\", connection_security_policy=\"mutual_tls\", destination_service=~\"$service\", destination_workload=~\"$dstwl\", destination_workload_namespace=~\"$dstns\"}[1m])) by (destination_workload, destination_workload_namespace, le))",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 1,
          "legendFormat": "{{ destination_workload }}.{{ destination_workload_namespace }} P50 (🔐mTLS)",
          "refId": "D",
          "step": 2
        },
        {
          "expr": "histogram_quantile(0.90, sum(irate(istio_request_duration_seconds_bucket{reporter=\"destination\", connection_security_policy=\"mutual_tls\", destination_service=~\"$service\", destination_workload=~\"$dstwl\", destination_workload_namespace=~\"$dstns\"}[1m])) by (destination_workload, destination_workload_namespace, le))",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 1,
          "legendFormat": "{{ destination_workload }}.{{ destination_workload_namespace }} P90 (🔐mTLS)",
          "refId": "A",
          "step": 2
        },
        {
          "expr": "histogram_quantile(0.95, sum(irate(istio_request_duration_seconds_bucket{reporter=\"destination\", connection_security_policy=\"mutual_tls\", destination_service=~\"$service\", destination_workload=~\"$dstwl\", destination_workload_namespace=~\"$dstns\"}[1m])) by (destination_workload, destination_workload_namespace, le))",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 1,
          "legendFormat": "{{ destination_workload }}.{{ destination_workload_namespace }} P95 (🔐mTLS)",
          "refId": "B",
          "step": 2
        },
        {
          "expr": "histogram_quantile(0.99, sum(irate(istio_request_duration_seconds_bucket{reporter=\"destination\", connection_security_policy=\"mutual_tls\", destination_service=~\"$service\", destination_workload=~\"$dstwl\", destination_workload_namespace=~\"$dstns\"}[1m])) by (destination_workload, destination_workload_namespace, le))",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 1,
          "legendFormat": "{{ destination_workload }}.{{ destination_workload_namespace }} P99 (🔐mTLS)",
          "refId": "C",
          "step": 2
        },
        {
          "expr": "histogram_quantile(0.50, sum(irate(istio_request_duration_seconds_bucket{reporter=\"destination\", connection_security_policy!=\"mutual_tls\", destination_service=~\"$service\", destination_workload=~\"$dstwl\", destination_workload_namespace=~\"$dstns\"}[1m])) by (destination_workload, destination_workload_namespace, le))",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 1,
          "legendFormat": "{{ destination_workload }}.{{ destination_workload_namespace }} P50",
          "refId": "E",
          "step": 2
        },
        {
          "expr": "histogram_quantile(0.90, sum(irate(istio_request_duration_seconds_bucket{reporter=\"destination\", connection_security_policy!=\"mutual_tls\", destination_service=~\"$service\", destination_workload=~\"$dstwl\", destination_workload_namespace=~\"$dstns\"}[1m])) by (destination_workload, destination_workload_namespace, le))",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 1,
          "legendFormat": "{{ destination_workload }}.{{ destination_workload_namespace }} P90",
          "refId": "F",
          "step": 2
        },
        {
          "expr": "histogram_quantile(0.95, sum(irate(istio_request_duration_seconds_bucket{reporter=\"destination\", connection_security_policy!=\"mutual_tls\", destination_service=~\"$service\", destination_workload=~\"$dstwl\", destination_workload_namespace=~\"$dstns\"}[1m])) by (destination_workload, destination_workload_namespace, le))",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 1,
          "legendFormat": "{{ destination_workload }}.{{ destination_workload_namespace }} P95",
          "refId": "G",
          "step": 2
        },
        {
          "expr": "histogram_quantile(0.99, sum(irate(istio_request_duration_seconds_bucket{reporter=\"destination\", connection_security_policy!=\"mutual_tls\", destination_service=~\"$service\", destination_workload=~\"$dstwl\", destination_workload_namespace=~\"$dstns\"}[1m])) by (destination_workload, destination_workload_namespace, le))",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 1,
          "legendFormat": "{{ destination_workload }}.{{ destination_workload_namespace }} P99",
          "refId": "H",
          "step": 2
        }
      ],
      "thresholds": [],
      "timeFrom": null,
      "timeShift": null,
      "title": "Incoming Request Duration by Source",
      "tooltip": {
        "shared": true,
        "sort": 0,
        "value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
        "buckets": null,
        "mode": "time",
        "name": null,
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "s",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": "0",
          "show": true
        },
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": false
        }
      ]
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": "Prometheus",
      "fill": 1,
      "gridPos": {
        "h": 6,
        "w": 8,
        "x": 8,
        "y": 41
      },
      "id": 95,
      "legend": {
        "alignAsTable": false,
        "avg": false,
        "current": false,
        "hideEmpty": true,
        "max": false,
        "min": false,
        "rightSide": false,
        "show": true,
        "total": false,
        "values": false
      },
      "lines": true,
      "linewidth": 1,
      "links": [],
      "nullPointMode": "null",
      "percentage": false,
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "expr": "histogram_quantile(0.50, sum(irate(istio_request_bytes_bucket{reporter=\"destination\", connection_security_policy=\"mutual_tls\", destination_service=~\"$service\", destination_workload=~\"$dstwl\", destination_workload_namespace=~\"$dstns\"}[1m])) by (destination_workload, destination_workload_namespace, le))",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 1,
          "legendFormat": "{{ destination_workload }}.{{ destination_workload_namespace }} P50 (🔐mTLS)",
          "refId": "D",
          "step": 2
        },
        {
          "expr": "histogram_quantile(0.90, sum(irate(istio_request_bytes_bucket{reporter=\"destination\", connection_security_policy=\"mutual_tls\", destination_service=~\"$service\", destination_workload=~\"$dstwl\", destination_workload_namespace=~\"$dstns\"}[1m])) by (destination_workload, destination_workload_namespace, le))",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 1,
          "legendFormat": "{{ destination_workload }}.{{ destination_workload_namespace }}  P90 (🔐mTLS)",
          "refId": "A",
          "step": 2
        },
        {
          "expr": "histogram_quantile(0.95, sum(irate(istio_request_bytes_bucket{reporter=\"destination\", connection_security_policy=\"mutual_tls\", destination_service=~\"$service\", destination_workload=~\"$dstwl\", destination_workload_namespace=~\"$dstns\"}[1m])) by (destination_workload, destination_workload_namespace, le))",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 1,
          "legendFormat": "{{ destination_workload }}.{{ destination_workload_namespace }} P95 (🔐mTLS)",
          "refId": "B",
          "step": 2
        },
        {
          "expr": "histogram_quantile(0.99, sum(irate(istio_request_bytes_bucket{reporter=\"destination\", connection_security_policy=\"mutual_tls\", destination_service=~\"$service\", destination_workload=~\"$dstwl\", destination_workload_namespace=~\"$dstns\"}[1m])) by (destination_workload, destination_workload_namespace, le))",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 1,
          "legendFormat": "{{ destination_workload }}.{{ destination_workload_namespace }}  P99 (🔐mTLS)",
          "refId": "C",
          "step": 2
        },
        {
          "expr": "histogram_quantile(0.50, sum(irate(istio_request_bytes_bucket{reporter=\"destination\", connection_security_policy!=\"mutual_tls\", destination_service=~\"$service\", destination_workload=~\"$dstwl\", destination_workload_namespace=~\"$dstns\"}[1m])) by (destination_workload, destination_workload_namespace, le))",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 1,
          "legendFormat": "{{ destination_workload }}.{{ destination_workload_namespace }} P50",
          "refId": "E",
          "step": 2
        },
        {
          "expr": "histogram_quantile(0.90, sum(irate(istio_request_bytes_bucket{reporter=\"destination\", connection_security_policy!=\"mutual_tls\", destination_service=~\"$service\", destination_workload=~\"$dstwl\", destination_workload_namespace=~\"$dstns\"}[1m])) by (destination_workload, destination_workload_namespace, le))",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 1,
          "legendFormat": "{{ destination_workload }}.{{ destination_workload_namespace }} P90",
          "refId": "F",
          "step": 2
        },
        {
          "expr": "histogram_quantile(0.95, sum(irate(istio_request_bytes_bucket{reporter=\"destination\", connection_security_policy!=\"mutual_tls\", destination_service=~\"$service\", destination_workload=~\"$dstwl\", destination_workload_namespace=~\"$dstns\"}[1m])) by (destination_workload, destination_workload_namespace, le))",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 1,
          "legendFormat": "{{ destination_workload }}.{{ destination_workload_namespace }} P95",
          "refId": "G",
          "step": 2
        },
        {
          "expr": "histogram_quantile(0.99, sum(irate(istio_request_bytes_bucket{reporter=\"destination\", connection_security_policy!=\"mutual_tls\", destination_service=~\"$service\", destination_workload=~\"$dstwl\", destination_workload_namespace=~\"$dstns\"}[1m])) by (destination_workload, destination_workload_namespace, le))",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 1,
          "legendFormat": "{{ destination_workload }}.{{ destination_workload_namespace }} P99",
          "refId": "H",
          "step": 2
        }
      ],
      "thresholds": [],
      "timeFrom": null,
      "timeShift": null,
      "title": "Incoming Request Size By Source",
      "tooltip": {
        "shared": true,
        "sort": 0,
        "value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
        "buckets": null,
        "mode": "time",
        "name": null,
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "decbytes",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": "0",
          "show": true
        },
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": false
        }
      ]
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": "Prometheus",
      "fill": 1,
      "gridPos": {
        "h": 6,
        "w": 8,
        "x": 16,
        "y": 41
      },
      "id": 96,
      "legend": {
        "alignAsTable": false,
        "avg": false,
        "current": false,
        "hideEmpty": true,
        "max": false,
        "min": false,
        "rightSide": false,
        "show": true,
        "total": false,
        "values": false
      },
      "lines": true,
      "linewidth": 1,
      "links": [],
      "nullPointMode": "null",
      "percentage": false,
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "expr": "histogram_quantile(0.50, sum(irate(istio_response_bytes_bucket{reporter=\"destination\", connection_security_policy=\"mutual_tls\", destination_service=~\"$service\", destination_workload=~\"$dstwl\", destination_workload_namespace=~\"$dstns\"}[1m])) by (destination_workload, destination_workload_namespace, le))",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 1,
          "legendFormat": "{{ destination_workload }}.{{ destination_workload_namespace }} P50 (🔐mTLS)",
          "refId": "D",
          "step": 2
        },
        {
          "expr": "histogram_quantile(0.90, sum(irate(istio_response_bytes_bucket{reporter=\"destination\", connection_security_policy=\"mutual_tls\", destination_service=~\"$service\", destination_workload=~\"$dstwl\", destination_workload_namespace=~\"$dstns\"}[1m])) by (destination_workload, destination_workload_namespace, le))",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 1,
          "legendFormat": "{{ destination_workload }}.{{ destination_workload_namespace }}  P90 (🔐mTLS)",
          "refId": "A",
          "step": 2
        },
        {
          "expr": "histogram_quantile(0.95, sum(irate(istio_response_bytes_bucket{reporter=\"destination\", connection_security_policy=\"mutual_tls\", destination_service=~\"$service\", destination_workload=~\"$dstwl\", destination_workload_namespace=~\"$dstns\"}[1m])) by (destination_workload, destination_workload_namespace, le))",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 1,
          "legendFormat": "{{ destination_workload }}.{{ destination_workload_namespace }} P95 (🔐mTLS)",
          "refId": "B",
          "step": 2
        },
        {
          "expr": "histogram_quantile(0.99, sum(irate(istio_response_bytes_bucket{reporter=\"destination\", connection_security_policy=\"mutual_tls\", destination_service=~\"$service\", destination_workload=~\"$dstwl\", destination_workload_namespace=~\"$dstns\"}[1m])) by (destination_workload, destination_workload_namespace, le))",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 1,
          "legendFormat": "{{ destination_workload }}.{{ destination_workload_namespace }}  P99 (🔐mTLS)",
          "refId": "C",
          "step": 2
        },
        {
          "expr": "histogram_quantile(0.50, sum(irate(istio_response_bytes_bucket{reporter=\"destination\", connection_security_policy!=\"mutual_tls\", destination_service=~\"$service\", destination_workload=~\"$dstwl\", destination_workload_namespace=~\"$dstns\"}[1m])) by (destination_workload, destination_workload_namespace, le))",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 1,
          "legendFormat": "{{ destination_workload }}.{{ destination_workload_namespace }} P50",
          "refId": "E",
          "step": 2
        },
        {
          "expr": "histogram_quantile(0.90, sum(irate(istio_response_bytes_bucket{reporter=\"destination\", connection_security_policy!=\"mutual_tls\", destination_service=~\"$service\", destination_workload=~\"$dstwl\", destination_workload_namespace=~\"$dstns\"}[1m])) by (destination_workload, destination_workload_namespace, le))",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 1,
          "legendFormat": "{{ destination_workload }}.{{ destination_workload_namespace }} P90",
          "refId": "F",
          "step": 2
        },
        {
          "expr": "histogram_quantile(0.95, sum(irate(istio_response_bytes_bucket{reporter=\"destination\", connection_security_policy!=\"mutual_tls\", destination_service=~\"$service\", destination_workload=~\"$dstwl\", destination_workload_namespace=~\"$dstns\"}[1m])) by (destination_workload, destination_workload_namespace, le))",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 1,
          "legendFormat": "{{ destination_workload }}.{{ destination_workload_namespace }} P95",
          "refId": "G",
          "step": 2
        },
        {
          "expr": "histogram_quantile(0.99, sum(irate(istio_response_bytes_bucket{reporter=\"destination\", connection_security_policy!=\"mutual_tls\", destination_service=~\"$service\", destination_workload=~\"$dstwl\", destination_workload_namespace=~\"$dstns\"}[1m])) by (destination_workload, destination_workload_namespace, le))",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 1,
          "legendFormat": "{{ destination_workload }}.{{ destination_workload_namespace }} P99",
          "refId": "H",
          "step": 2
        }
      ],
      "thresholds": [],
      "timeFrom": null,
      "timeShift": null,
      "title": "Response Size By Source",
      "tooltip": {
        "shared": true,
        "sort": 0,
        "value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
        "buckets": null,
        "mode": "time",
        "name": null,
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "decbytes",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": "0",
          "show": true
        },
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": false
        }
      ]
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": "Prometheus",
      "fill": 1,
      "gridPos": {
        "h": 6,
        "w": 12,
        "x": 0,
        "y": 47
      },
      "id": 92,
      "legend": {
        "avg": false,
        "current": false,
        "max": false,
        "min": false,
        "show": true,
        "total": false,
        "values": false
      },
      "lines": true,
      "linewidth": 1,
      "links": [],
      "nullPointMode": "null",
      "percentage": false,
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "expr": "round(sum(irate(istio_tcp_received_bytes_total{reporter=\"destination\", connection_security_policy=\"mutual_tls\", destination_service=~\"$service\", destination_workload=~\"$dstwl\", destination_workload_namespace=~\"$dstns\"}[1m])) by (destination_workload, destination_workload_namespace), 0.001)",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 1,
          "legendFormat": "{{ destination_workload }}.{{ destination_workload_namespace}} (🔐mTLS)",
          "refId": "A",
          "step": 2
        },
        {
          "expr": "round(sum(irate(istio_tcp_received_bytes_total{reporter=\"destination\", connection_security_policy!=\"mutual_tls\", destination_service=~\"$service\", destination_workload=~\"$dstwl\", destination_workload_namespace=~\"$dstns\"}[1m])) by (destination_workload, destination_workload_namespace), 0.001)",
          "format": "time_series",
          "intervalFactor": 1,
          "legendFormat": "{{ destination_workload }}.{{ destination_workload_namespace}}",
          "refId": "B",
          "step": 2
        }
      ],
      "thresholds": [],
      "timeFrom": null,
      "timeShift": null,
      "title": "Bytes Received from Incoming TCP Connection",
      "tooltip": {
        "shared": true,
        "sort": 0,
        "value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
        "buckets": null,
        "mode": "time",
        "name": null,
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "Bps",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": "0",
          "show": true
        },
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        }
      ]
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": "Prometheus",
      "fill": 1,
      "gridPos": {
        "h": 6,
        "w": 12,
        "x": 12,
        "y": 47
      },
      "id": 93,
      "legend": {
        "avg": false,
        "current": false,
        "max": false,
        "min": false,
        "show": true,
        "total": false,
        "values": false
      },
      "lines": true,
      "linewidth": 1,
      "links": [],
      "nullPointMode": "null",
      "percentage": false,
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "expr": "round(sum(irate(istio_tcp_sent_bytes_total{connection_security_policy=\"mutual_tls\", reporter=\"destination\", destination_service=~\"$service\", destination_workload=~\"$dstwl\", destination_workload_namespace=~\"$dstns\"}[1m])) by (destination_workload, destination_workload_namespace), 0.001)",
          "format": "time_series",
          "intervalFactor": 1,
          "legendFormat": "{{ destination_workload }}.{{destination_workload_namespace }} (🔐mTLS)",
          "refId": "A",
          "step": 2
        },
        {
          "expr": "round(sum(irate(istio_tcp_sent_bytes_total{connection_security_policy!=\"mutual_tls\", reporter=\"destination\", destination_service=~\"$service\", destination_workload=~\"$dstwl\", destination_workload_namespace=~\"$dstns\"}[1m])) by (destination_workload, destination_workload_namespace), 0.001)",
          "format": "time_series",
          "intervalFactor": 1,
          "legendFormat": "{{ destination_workload }}.{{destination_workload_namespace }}",
          "refId": "B",
          "step": 2
        }
      ],
      "thresholds": [],
      "timeFrom": null,
      "timeShift": null,
      "title": "Bytes Sent to Incoming TCP Connection",
      "tooltip": {
        "shared": true,
        "sort": 0,
        "value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
        "buckets": null,
        "mode": "time",
        "name": null,
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "Bps",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": "0",
          "show": true
        },
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        }
      ]
    }
  ],
  "refresh": "10s",
  "schemaVersion": 16,
  "style": "dark",
  "tags": [],
  "templating": {
    "list": [
      {
        "allValue": null,
        "current": {},
        "datasource": "Prometheus",
        "hide": 0,
        "includeAll": false,
        "label": "Service",
        "multi": false,
        "name": "service",
        "options": [],
        "query": "label_values(destination_service)",
        "refresh": 1,
        "regex": "",
        "sort": 0,
        "tagValuesQuery": "",
        "tags": [],
        "tagsQuery": "",
        "type": "query",
        "useTags": false
      },
      {
        "allValue": null,
        "current": {},
        "datasource": "Prometheus",
        "hide": 0,
        "includeAll": true,
        "label": "Client Workload Namespace",
        "multi": true,
        "name": "srcns",
        "options": [],
        "query": "query_result( sum(istio_requests_total{reporter=\"destination\", destination_service=\"$service\"}) by (source_workload_namespace) or sum(istio_tcp_sent_bytes_total{reporter=\"destination\", destination_service=~\"$service\"}) by (source_workload_namespace))",
        "refresh": 1,
        "regex": "/.*namespace=\"([^\"]*).*/",
        "sort": 2,
        "tagValuesQuery": "",
        "tags": [],
        "tagsQuery": "",
        "type": "query",
        "useTags": false
      },
      {
        "allValue": null,
        "current": {},
        "datasource": "Prometheus",
        "hide": 0,
        "includeAll": true,
        "label": "Client Workload",
        "multi": true,
        "name": "srcwl",
        "options": [],
        "query": "query_result( sum(istio_requests_total{reporter=\"destination\", destination_service=~\"$service\", source_workload_namespace=~\"$srcns\"}) by (source_workload) or sum(istio_tcp_sent_bytes_total{reporter=\"destination\", destination_service=~\"$service\", source_workload_namespace=~\"$srcns\"}) by (source_workload))",
        "refresh": 1,
        "regex": "/.*workload=\"([^\"]*).*/",
        "sort": 3,
        "tagValuesQuery": "",
        "tags": [],
        "tagsQuery": "",
        "type": "query",
        "useTags": false
      },
      {
        "allValue": null,
        "current": {},
        "datasource": "Prometheus",
        "hide": 0,
        "includeAll": true,
        "label": "Service Workload Namespace",
        "multi": true,
        "name": "dstns",
        "options": [],
        "query": "query_result( sum(istio_requests_total{reporter=\"destination\", destination_service=\"$service\"}) by (destination_workload_namespace) or sum(istio_tcp_sent_bytes_total{reporter=\"destination\", destination_service=~\"$service\"}) by (destination_workload_namespace))",
        "refresh": 1,
        "regex": "/.*namespace=\"([^\"]*).*/",
        "sort": 2,
        "tagValuesQuery": "",
        "tags": [],
        "tagsQuery": "",
        "type": "query",
        "useTags": false
      },
      {
        "allValue": null,
        "current": {},
        "datasource": "Prometheus",
        "hide": 0,
        "includeAll": true,
        "label": "Service Workload",
        "multi": true,
        "name": "dstwl",
        "options": [],
        "query": "query_result( sum(istio_requests_total{reporter=\"destination\", destination_service=~\"$service\", destination_workload_namespace=~\"$dstns\"}) by (destination_workload) or sum(istio_tcp_sent_bytes_total{reporter=\"destination\", destination_service=~\"$service\", destination_workload_namespace=~\"$dstns\"}) by (destination_workload))",
        "refresh": 1,
        "regex": "/.*workload=\"([^\"]*).*/",
        "sort": 3,
        "tagValuesQuery": "",
        "tags": [],
        "tagsQuery": "",
        "type": "query",
        "useTags": false
      }
    ]
  },
  "time": {
    "from": "now-5m",
    "to": "now"
  },
  "timepicker": {
    "refresh_intervals": [
      "5s",
      "10s",
      "30s",
      "1m",
      "5m",
      "15m",
      "30m",
      "1h",
      "2h",
      "1d"
    ],
    "time_options": [
      "5m",
      "15m",
      "1h",
      "6h",
      "12h",
      "24h",
      "2d",
      "7d",
      "30d"
    ]
  },
  "timezone": "",
  "title": "Istio Service Dashboard",
  "uid": "LJ_uJAvmk",
  "version": 10
}
'
  
  istio-workload-dashboard.json: '{
  "__inputs": [
    {
      "name": "DS_PROMETHEUS",
      "label": "Prometheus",
      "description": "",
      "type": "datasource",
      "pluginId": "prometheus",
      "pluginName": "Prometheus"
    }
  ],
  "__requires": [
    {
      "type": "grafana",
      "id": "grafana",
      "name": "Grafana",
      "version": "5.0.4"
    },
    {
      "type": "panel",
      "id": "graph",
      "name": "Graph",
      "version": "5.0.0"
    },
    {
      "type": "datasource",
      "id": "prometheus",
      "name": "Prometheus",
      "version": "5.0.0"
    },
    {
      "type": "panel",
      "id": "singlestat",
      "name": "Singlestat",
      "version": "5.0.0"
    },
    {
      "type": "panel",
      "id": "text",
      "name": "Text",
      "version": "5.0.0"
    }
  ],
  "annotations": {
    "list": [
      {
        "builtIn": 1,
        "datasource": "-- Grafana --",
        "enable": true,
        "hide": true,
        "iconColor": "rgba(0, 211, 255, 1)",
        "name": "Annotations & Alerts",
        "type": "dashboard"
      }
    ]
  },
  "editable": false,
  "gnetId": null,
  "graphTooltip": 0,
  "id": null,
  "iteration": 1531345461465,
  "links": [],
  "panels": [
    {
      "content": "<div class=\"dashboard-header text-center\">\n<span>WORKLOAD: $workload.$namespace</span>\n</div>",
      "gridPos": {
        "h": 3,
        "w": 24,
        "x": 0,
        "y": 0
      },
      "id": 89,
      "links": [],
      "mode": "html",
      "title": "",
      "transparent": true,
      "type": "text"
    },
    {
      "cacheTimeout": null,
      "colorBackground": false,
      "colorValue": false,
      "colors": [
        "rgba(245, 54, 54, 0.9)",
        "rgba(237, 129, 40, 0.89)",
        "rgba(50, 172, 45, 0.97)"
      ],
      "datasource": "Prometheus",
      "format": "ops",
      "gauge": {
        "maxValue": 100,
        "minValue": 0,
        "show": false,
        "thresholdLabels": false,
        "thresholdMarkers": true
      },
      "gridPos": {
        "h": 4,
        "w": 8,
        "x": 0,
        "y": 3
      },
      "id": 12,
      "interval": null,
      "links": [],
      "mappingType": 1,
      "mappingTypes": [
        {
          "name": "value to text",
          "value": 1
        },
        {
          "name": "range to text",
          "value": 2
        }
      ],
      "maxDataPoints": 100,
      "nullPointMode": "connected",
      "nullText": null,
      "postfix": "",
      "postfixFontSize": "50%",
      "prefix": "",
      "prefixFontSize": "50%",
      "rangeMaps": [
        {
          "from": "null",
          "text": "N/A",
          "to": "null"
        }
      ],
      "sparkline": {
        "fillColor": "rgba(31, 118, 189, 0.18)",
        "full": true,
        "lineColor": "rgb(31, 120, 193)",
        "show": true
      },
      "tableColumn": "",
      "targets": [
        {
          "expr": "round(sum(rate(istio_requests_total{reporter=\"destination\",destination_workload_namespace=~\"$namespace\",destination_workload=~\"$workload\"}[30s])), 0.001)",
          "format": "time_series",
          "intervalFactor": 1,
          "refId": "A",
          "step": 4
        }
      ],
      "thresholds": "",
      "title": "Incoming Request Volume",
      "transparent": false,
      "type": "singlestat",
      "valueFontSize": "80%",
      "valueMaps": [
        {
          "op": "=",
          "text": "N/A",
          "value": "null"
        }
      ],
      "valueName": "current"
    },
    {
      "cacheTimeout": null,
      "colorBackground": false,
      "colorValue": false,
      "colors": [
        "rgba(50, 172, 45, 0.97)",
        "rgba(237, 129, 40, 0.89)",
        "rgba(245, 54, 54, 0.9)"
      ],
      "datasource": "Prometheus",
      "decimals": null,
      "format": "percentunit",
      "gauge": {
        "maxValue": 100,
        "minValue": 80,
        "show": false,
        "thresholdLabels": false,
        "thresholdMarkers": false
      },
      "gridPos": {
        "h": 4,
        "w": 8,
        "x": 8,
        "y": 3
      },
      "id": 14,
      "interval": null,
      "links": [],
      "mappingType": 1,
      "mappingTypes": [
        {
          "name": "value to text",
          "value": 1
        },
        {
          "name": "range to text",
          "value": 2
        }
      ],
      "maxDataPoints": 100,
      "nullPointMode": "connected",
      "nullText": null,
      "postfix": "",
      "postfixFontSize": "50%",
      "prefix": "",
      "prefixFontSize": "50%",
      "rangeMaps": [
        {
          "from": "null",
          "text": "N/A",
          "to": "null"
        }
      ],
      "sparkline": {
        "fillColor": "rgba(31, 118, 189, 0.18)",
        "full": true,
        "lineColor": "rgb(31, 120, 193)",
        "show": true
      },
      "tableColumn": "",
      "targets": [
        {
          "expr": "sum(irate(istio_requests_total{reporter=\"destination\",destination_workload_namespace=~\"$namespace\",destination_workload=~\"$workload\",response_code!~\"5.*\"}[30s])) / sum(irate(istio_requests_total{reporter=\"destination\",destination_workload_namespace=~\"$namespace\",destination_workload=~\"$workload\"}[30s]))",
          "format": "time_series",
          "intervalFactor": 1,
          "refId": "B"
        }
      ],
      "thresholds": "95, 99, 99.5",
      "title": "Incoming Success Rate (non-5xx responses)",
      "transparent": false,
      "type": "singlestat",
      "valueFontSize": "80%",
      "valueMaps": [
        {
          "op": "=",
          "text": "N/A",
          "value": "null"
        }
      ],
      "valueName": "avg"
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": "Prometheus",
      "fill": 1,
      "gridPos": {
        "h": 4,
        "w": 8,
        "x": 16,
        "y": 3
      },
      "id": 87,
      "legend": {
        "alignAsTable": false,
        "avg": false,
        "current": false,
        "hideEmpty": false,
        "hideZero": false,
        "max": false,
        "min": false,
        "rightSide": true,
        "show": true,
        "total": false,
        "values": false
      },
      "lines": true,
      "linewidth": 1,
      "links": [],
      "nullPointMode": "null",
      "percentage": false,
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "expr": "histogram_quantile(0.50, sum(irate(istio_request_duration_seconds_bucket{reporter=\"destination\",destination_workload=~\"$workload\", destination_workload_namespace=~\"$namespace\"}[1m])) by (le))",
          "format": "time_series",
          "interval": "",
          "intervalFactor": 1,
          "legendFormat": "P50",
          "refId": "A"
        },
        {
          "expr": "histogram_quantile(0.90, sum(irate(istio_request_duration_seconds_bucket{reporter=\"destination\",destination_workload=~\"$workload\", destination_workload_namespace=~\"$namespace\"}[1m])) by (le))",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 1,
          "legendFormat": "P90",
          "refId": "B"
        },
        {
          "expr": "histogram_quantile(0.99, sum(irate(istio_request_duration_seconds_bucket{reporter=\"destination\",destination_workload=~\"$workload\", destination_workload_namespace=~\"$namespace\"}[1m])) by (le))",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 1,
          "legendFormat": "P99",
          "refId": "C"
        }
      ],
      "thresholds": [],
      "timeFrom": null,
      "timeShift": null,
      "title": "Request Duration",
      "tooltip": {
        "shared": true,
        "sort": 0,
        "value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
        "buckets": null,
        "mode": "time",
        "name": null,
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "s",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        },
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": false
        }
      ]
    },
    {
      "cacheTimeout": null,
      "colorBackground": false,
      "colorValue": false,
      "colors": [
        "#299c46",
        "rgba(237, 129, 40, 0.89)",
        "#d44a3a"
      ],
      "datasource": "Prometheus",
      "format": "Bps",
      "gauge": {
        "maxValue": 100,
        "minValue": 0,
        "show": false,
        "thresholdLabels": false,
        "thresholdMarkers": true
      },
      "gridPos": {
        "h": 4,
        "w": 12,
        "x": 0,
        "y": 7
      },
      "id": 84,
      "interval": null,
      "links": [],
      "mappingType": 1,
      "mappingTypes": [
        {
          "name": "value to text",
          "value": 1
        },
        {
          "name": "range to text",
          "value": 2
        }
      ],
      "maxDataPoints": 100,
      "nullPointMode": "connected",
      "nullText": null,
      "postfix": "",
      "postfixFontSize": "50%",
      "prefix": "",
      "prefixFontSize": "50%",
      "rangeMaps": [
        {
          "from": "null",
          "text": "N/A",
          "to": "null"
        }
      ],
      "sparkline": {
        "fillColor": "rgba(31, 118, 189, 0.18)",
        "full": true,
        "lineColor": "rgb(31, 120, 193)",
        "show": true
      },
      "tableColumn": "",
      "targets": [
        {
          "expr": "sum(irate(istio_tcp_sent_bytes_total{reporter=\"destination\", destination_workload_namespace=~\"$namespace\", destination_workload=~\"$workload\"}[1m])) + sum(irate(istio_tcp_received_bytes_total{reporter=\"destination\", destination_workload_namespace=~\"$namespace\", destination_workload=~\"$workload\"}[1m]))",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 1,
          "legendFormat": "",
          "refId": "A"
        }
      ],
      "thresholds": "",
      "title": "TCP Server Traffic",
      "transparent": false,
      "type": "singlestat",
      "valueFontSize": "80%",
      "valueMaps": [
        {
          "op": "=",
          "text": "N/A",
          "value": "null"
        }
      ],
      "valueName": "avg"
    },
    {
      "cacheTimeout": null,
      "colorBackground": false,
      "colorValue": false,
      "colors": [
        "#299c46",
        "rgba(237, 129, 40, 0.89)",
        "#d44a3a"
      ],
      "datasource": "Prometheus",
      "format": "Bps",
      "gauge": {
        "maxValue": 100,
        "minValue": 0,
        "show": false,
        "thresholdLabels": false,
        "thresholdMarkers": true
      },
      "gridPos": {
        "h": 4,
        "w": 12,
        "x": 12,
        "y": 7
      },
      "id": 85,
      "interval": null,
      "links": [],
      "mappingType": 1,
      "mappingTypes": [
        {
          "name": "value to text",
          "value": 1
        },
        {
          "name": "range to text",
          "value": 2
        }
      ],
      "maxDataPoints": 100,
      "nullPointMode": "connected",
      "nullText": null,
      "postfix": "",
      "postfixFontSize": "50%",
      "prefix": "",
      "prefixFontSize": "50%",
      "rangeMaps": [
        {
          "from": "null",
          "text": "N/A",
          "to": "null"
        }
      ],
      "sparkline": {
        "fillColor": "rgba(31, 118, 189, 0.18)",
        "full": true,
        "lineColor": "rgb(31, 120, 193)",
        "show": true
      },
      "tableColumn": "",
      "targets": [
        {
          "expr": "sum(irate(istio_tcp_sent_bytes_total{reporter=\"source\", source_workload_namespace=~\"$namespace\", source_workload=~\"$workload\"}[1m])) + sum(irate(istio_tcp_received_bytes_total{reporter=\"source\", source_workload_namespace=~\"$namespace\", source_workload=~\"$workload\"}[1m]))",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 1,
          "legendFormat": "",
          "refId": "A"
        }
      ],
      "thresholds": "",
      "title": "TCP Client Traffic",
      "transparent": false,
      "type": "singlestat",
      "valueFontSize": "80%",
      "valueMaps": [
        {
          "op": "=",
          "text": "N/A",
          "value": "null"
        }
      ],
      "valueName": "avg"
    },
    {
      "content": "<div class=\"dashboard-header text-center\">\n<span>INBOUND WORKLOADS</span>\n</div>",
      "gridPos": {
        "h": 3,
        "w": 24,
        "x": 0,
        "y": 11
      },
      "id": 45,
      "links": [],
      "mode": "html",
      "title": "",
      "transparent": true,
      "type": "text"
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": "Prometheus",
      "fill": 0,
      "gridPos": {
        "h": 6,
        "w": 12,
        "x": 0,
        "y": 14
      },
      "id": 25,
      "legend": {
        "avg": false,
        "current": false,
        "hideEmpty": true,
        "max": false,
        "min": false,
        "show": true,
        "total": false,
        "values": false
      },
      "lines": true,
      "linewidth": 1,
      "links": [],
      "nullPointMode": "null as zero",
      "percentage": false,
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "expr": "round(sum(irate(istio_requests_total{connection_security_policy=\"mutual_tls\", destination_workload_namespace=~\"$namespace\", destination_workload=~\"$workload\", reporter=\"destination\", source_workload=~\"$srcwl\", source_workload_namespace=~\"$srcns\"}[30s])) by (source_workload, source_workload_namespace, response_code), 0.001)",
          "format": "time_series",
          "intervalFactor": 1,
          "legendFormat": "{{ source_workload }}.{{ source_workload_namespace }} : {{ response_code }} (🔐mTLS)",
          "refId": "B",
          "step": 2
        },
        {
          "expr": "round(sum(irate(istio_requests_total{connection_security_policy!=\"mutual_tls\", destination_workload_namespace=~\"$namespace\", destination_workload=~\"$workload\", reporter=\"destination\", source_workload=~\"$srcwl\", source_workload_namespace=~\"$srcns\"}[30s])) by (source_workload, source_workload_namespace, response_code), 0.001)",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 1,
          "legendFormat": "{{ source_workload }}.{{ source_workload_namespace }} : {{ response_code }}",
          "refId": "A",
          "step": 2
        }
      ],
      "thresholds": [],
      "timeFrom": null,
      "timeShift": null,
      "title": "Incoming Requests by Source And Response Code",
      "tooltip": {
        "shared": false,
        "sort": 0,
        "value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
        "buckets": null,
        "mode": "time",
        "name": null,
        "show": true,
        "values": [
          "total"
        ]
      },
      "yaxes": [
        {
          "format": "ops",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": "0",
          "show": true
        },
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": false
        }
      ]
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": "Prometheus",
      "fill": 1,
      "gridPos": {
        "h": 6,
        "w": 12,
        "x": 12,
        "y": 14
      },
      "id": 26,
      "legend": {
        "avg": false,
        "current": false,
        "hideEmpty": true,
        "hideZero": false,
        "max": false,
        "min": false,
        "show": true,
        "total": false,
        "values": false
      },
      "lines": true,
      "linewidth": 1,
      "links": [],
      "nullPointMode": "null",
      "percentage": false,
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "expr": "sum(rate(istio_requests_total{reporter=\"destination\", connection_security_policy=\"mutual_tls\", destination_workload_namespace=~\"$namespace\", destination_workload=~\"$workload\",response_code!~\"5.*\", source_workload=~\"$srcwl\", source_workload_namespace=~\"$srcns\"}[30s])) by (source_workload, source_workload_namespace) / sum(rate(istio_requests_total{reporter=\"destination\", connection_security_policy=\"mutual_tls\", destination_workload_namespace=~\"$namespace\", destination_workload=~\"$workload\", source_workload=~\"$srcwl\", source_workload_namespace=~\"$srcns\"}[30s])) by (source_workload, source_workload_namespace)",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 1,
          "legendFormat": "{{ source_workload }}.{{ source_workload_namespace }} (🔐mTLS)",
          "refId": "A",
          "step": 2
        },
        {
          "expr": "sum(rate(istio_requests_total{reporter=\"destination\", connection_security_policy!=\"mutual_tls\", destination_workload_namespace=~\"$namespace\", destination_workload=~\"$workload\",response_code!~\"5.*\", source_workload=~\"$srcwl\", source_workload_namespace=~\"$srcns\"}[30s])) by (source_workload, source_workload_namespace) / sum(rate(istio_requests_total{reporter=\"destination\", connection_security_policy!=\"mutual_tls\", destination_workload_namespace=~\"$namespace\", destination_workload=~\"$workload\", source_workload=~\"$srcwl\", source_workload_namespace=~\"$srcns\"}[30s])) by (source_workload, source_workload_namespace)",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 1,
          "legendFormat": "{{ source_workload }}.{{ source_workload_namespace }}",
          "refId": "B",
          "step": 2
        }
      ],
      "thresholds": [],
      "timeFrom": null,
      "timeShift": null,
      "title": "Incoming Success Rate (non-5xx responses) By Source",
      "tooltip": {
        "shared": true,
        "sort": 0,
        "value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
        "buckets": null,
        "mode": "time",
        "name": null,
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "percentunit",
          "label": null,
          "logBase": 1,
          "max": "1.01",
          "min": "0",
          "show": true
        },
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": false
        }
      ]
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": "Prometheus",
      "description": "",
      "fill": 1,
      "gridPos": {
        "h": 6,
        "w": 8,
        "x": 0,
        "y": 20
      },
      "id": 27,
      "legend": {
        "alignAsTable": false,
        "avg": false,
        "current": false,
        "hideEmpty": true,
        "hideZero": false,
        "max": false,
        "min": false,
        "rightSide": false,
        "show": true,
        "total": false,
        "values": false
      },
      "lines": true,
      "linewidth": 1,
      "links": [],
      "nullPointMode": "null",
      "percentage": false,
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "expr": "histogram_quantile(0.50, sum(irate(istio_request_duration_seconds_bucket{reporter=\"destination\", connection_security_policy=\"mutual_tls\", destination_workload=~\"$workload\", destination_workload_namespace=~\"$namespace\", source_workload=~\"$srcwl\", source_workload_namespace=~\"$srcns\"}[1m])) by (source_workload, source_workload_namespace, le))",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 1,
          "legendFormat": "{{source_workload}}.{{source_workload_namespace}} P50 (🔐mTLS)",
          "refId": "D",
          "step": 2
        },
        {
          "expr": "histogram_quantile(0.90, sum(irate(istio_request_duration_seconds_bucket{reporter=\"destination\", connection_security_policy=\"mutual_tls\", destination_workload=~\"$workload\", destination_workload_namespace=~\"$namespace\", source_workload=~\"$srcwl\", source_workload_namespace=~\"$srcns\"}[1m])) by (source_workload, source_workload_namespace, le))",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 1,
          "legendFormat": "{{source_workload}}.{{source_workload_namespace}} P90 (🔐mTLS)",
          "refId": "A",
          "step": 2
        },
        {
          "expr": "histogram_quantile(0.95, sum(irate(istio_request_duration_seconds_bucket{reporter=\"destination\", connection_security_policy=\"mutual_tls\", destination_workload=~\"$workload\", destination_workload_namespace=~\"$namespace\", source_workload=~\"$srcwl\", source_workload_namespace=~\"$srcns\"}[1m])) by (source_workload, source_workload_namespace, le))",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 1,
          "legendFormat": "{{source_workload}}.{{source_workload_namespace}} P95 (🔐mTLS)",
          "refId": "B",
          "step": 2
        },
        {
          "expr": "histogram_quantile(0.99, sum(irate(istio_request_duration_seconds_bucket{reporter=\"destination\", connection_security_policy=\"mutual_tls\", destination_workload=~\"$workload\", destination_workload_namespace=~\"$namespace\", source_workload=~\"$srcwl\", source_workload_namespace=~\"$srcns\"}[1m])) by (source_workload, source_workload_namespace, le))",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 1,
          "legendFormat": "{{source_workload}}.{{source_workload_namespace}} P99 (🔐mTLS)",
          "refId": "C",
          "step": 2
        },
        {
          "expr": "histogram_quantile(0.50, sum(irate(istio_request_duration_seconds_bucket{reporter=\"destination\", connection_security_policy!=\"mutual_tls\", destination_workload=~\"$workload\", destination_workload_namespace=~\"$namespace\", source_workload=~\"$srcwl\", source_workload_namespace=~\"$srcns\"}[1m])) by (source_workload, source_workload_namespace, le))",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 1,
          "legendFormat": "{{source_workload}}.{{source_workload_namespace}} P50",
          "refId": "E",
          "step": 2
        },
        {
          "expr": "histogram_quantile(0.90, sum(irate(istio_request_duration_seconds_bucket{reporter=\"destination\", connection_security_policy!=\"mutual_tls\", destination_workload=~\"$workload\", destination_workload_namespace=~\"$namespace\", source_workload=~\"$srcwl\", source_workload_namespace=~\"$srcns\"}[1m])) by (source_workload, source_workload_namespace, le))",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 1,
          "legendFormat": "{{source_workload}}.{{source_workload_namespace}} P90",
          "refId": "F",
          "step": 2
        },
        {
          "expr": "histogram_quantile(0.95, sum(irate(istio_request_duration_seconds_bucket{reporter=\"destination\", connection_security_policy!=\"mutual_tls\", destination_workload=~\"$workload\", destination_workload_namespace=~\"$namespace\", source_workload=~\"$srcwl\", source_workload_namespace=~\"$srcns\"}[1m])) by (source_workload, source_workload_namespace, le))",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 1,
          "legendFormat": "{{source_workload}}.{{source_workload_namespace}} P95",
          "refId": "G",
          "step": 2
        },
        {
          "expr": "histogram_quantile(0.99, sum(irate(istio_request_duration_seconds_bucket{reporter=\"destination\", connection_security_policy!=\"mutual_tls\", destination_workload=~\"$workload\", destination_workload_namespace=~\"$namespace\", source_workload=~\"$srcwl\", source_workload_namespace=~\"$srcns\"}[1m])) by (source_workload, source_workload_namespace, le))",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 1,
          "legendFormat": "{{source_workload}}.{{source_workload_namespace}} P99",
          "refId": "H",
          "step": 2
        }
      ],
      "thresholds": [],
      "timeFrom": null,
      "timeShift": null,
      "title": "Incoming Request Duration by Source",
      "tooltip": {
        "shared": true,
        "sort": 0,
        "value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
        "buckets": null,
        "mode": "time",
        "name": null,
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "s",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": "0",
          "show": true
        },
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": false
        }
      ]
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": "Prometheus",
      "fill": 1,
      "gridPos": {
        "h": 6,
        "w": 8,
        "x": 8,
        "y": 20
      },
      "id": 28,
      "legend": {
        "alignAsTable": false,
        "avg": false,
        "current": false,
        "hideEmpty": true,
        "max": false,
        "min": false,
        "rightSide": false,
        "show": true,
        "total": false,
        "values": false
      },
      "lines": true,
      "linewidth": 1,
      "links": [],
      "nullPointMode": "null",
      "percentage": false,
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "expr": "histogram_quantile(0.50, sum(irate(istio_request_bytes_bucket{reporter=\"destination\", connection_security_policy=\"mutual_tls\", destination_workload=~\"$workload\", destination_workload_namespace=~\"$namespace\", source_workload=~\"$srcwl\", source_workload_namespace=~\"$srcns\"}[1m])) by (source_workload, source_workload_namespace, le))",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 1,
          "legendFormat": "{{source_workload}}.{{source_workload_namespace}} P50 (🔐mTLS)",
          "refId": "D",
          "step": 2
        },
        {
          "expr": "histogram_quantile(0.90, sum(irate(istio_request_bytes_bucket{reporter=\"destination\", connection_security_policy=\"mutual_tls\", destination_workload=~\"$workload\", destination_workload_namespace=~\"$namespace\", source_workload=~\"$srcwl\", source_workload_namespace=~\"$srcns\"}[1m])) by (source_workload, source_workload_namespace, le))",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 1,
          "legendFormat": "{{source_workload}}.{{source_workload_namespace}}  P90 (🔐mTLS)",
          "refId": "A",
          "step": 2
        },
        {
          "expr": "histogram_quantile(0.95, sum(irate(istio_request_bytes_bucket{reporter=\"destination\", connection_security_policy=\"mutual_tls\", destination_workload=~\"$workload\", destination_workload_namespace=~\"$namespace\", source_workload=~\"$srcwl\", source_workload_namespace=~\"$srcns\"}[1m])) by (source_workload, source_workload_namespace, le))",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 1,
          "legendFormat": "{{source_workload}}.{{source_workload_namespace}} P95 (🔐mTLS)",
          "refId": "B",
          "step": 2
        },
        {
          "expr": "histogram_quantile(0.99, sum(irate(istio_request_bytes_bucket{reporter=\"destination\", connection_security_policy=\"mutual_tls\", destination_workload=~\"$workload\", destination_workload_namespace=~\"$namespace\", source_workload=~\"$srcwl\", source_workload_namespace=~\"$srcns\"}[1m])) by (source_workload, source_workload_namespace, le))",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 1,
          "legendFormat": "{{source_workload}}.{{source_workload_namespace}}  P99 (🔐mTLS)",
          "refId": "C",
          "step": 2
        },
        {
          "expr": "histogram_quantile(0.50, sum(irate(istio_request_bytes_bucket{reporter=\"destination\", connection_security_policy!=\"mutual_tls\", destination_workload=~\"$workload\", destination_workload_namespace=~\"$namespace\", source_workload=~\"$srcwl\", source_workload_namespace=~\"$srcns\"}[1m])) by (source_workload, source_workload_namespace, le))",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 1,
          "legendFormat": "{{source_workload}}.{{source_workload_namespace}} P50",
          "refId": "E",
          "step": 2
        },
        {
          "expr": "histogram_quantile(0.90, sum(irate(istio_request_bytes_bucket{reporter=\"destination\", connection_security_policy!=\"mutual_tls\", destination_workload=~\"$workload\", destination_workload_namespace=~\"$namespace\", source_workload=~\"$srcwl\", source_workload_namespace=~\"$srcns\"}[1m])) by (source_workload, source_workload_namespace, le))",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 1,
          "legendFormat": "{{source_workload}}.{{source_workload_namespace}} P90",
          "refId": "F",
          "step": 2
        },
        {
          "expr": "histogram_quantile(0.95, sum(irate(istio_request_bytes_bucket{reporter=\"destination\", connection_security_policy!=\"mutual_tls\", destination_workload=~\"$workload\", destination_workload_namespace=~\"$namespace\", source_workload=~\"$srcwl\", source_workload_namespace=~\"$srcns\"}[1m])) by (source_workload, source_workload_namespace, le))",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 1,
          "legendFormat": "{{source_workload}}.{{source_workload_namespace}} P95",
          "refId": "G",
          "step": 2
        },
        {
          "expr": "histogram_quantile(0.99, sum(irate(istio_request_bytes_bucket{reporter=\"destination\", connection_security_policy!=\"mutual_tls\", destination_workload=~\"$workload\", destination_workload_namespace=~\"$namespace\", source_workload=~\"$srcwl\", source_workload_namespace=~\"$srcns\"}[1m])) by (source_workload, source_workload_namespace, le))",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 1,
          "legendFormat": "{{source_workload}}.{{source_workload_namespace}} P99",
          "refId": "H",
          "step": 2
        }
      ],
      "thresholds": [],
      "timeFrom": null,
      "timeShift": null,
      "title": "Incoming Request Size By Source",
      "tooltip": {
        "shared": true,
        "sort": 0,
        "value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
        "buckets": null,
        "mode": "time",
        "name": null,
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "decbytes",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": "0",
          "show": true
        },
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": false
        }
      ]
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": "Prometheus",
      "fill": 1,
      "gridPos": {
        "h": 6,
        "w": 8,
        "x": 16,
        "y": 20
      },
      "id": 68,
      "legend": {
        "alignAsTable": false,
        "avg": false,
        "current": false,
        "hideEmpty": true,
        "max": false,
        "min": false,
        "rightSide": false,
        "show": true,
        "total": false,
        "values": false
      },
      "lines": true,
      "linewidth": 1,
      "links": [],
      "nullPointMode": "null",
      "percentage": false,
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "expr": "histogram_quantile(0.50, sum(irate(istio_response_bytes_bucket{reporter=\"destination\", connection_security_policy=\"mutual_tls\", destination_workload=~\"$workload\", destination_workload_namespace=~\"$namespace\", source_workload=~\"$srcwl\", source_workload_namespace=~\"$srcns\"}[1m])) by (source_workload, source_workload_namespace, le))",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 1,
          "legendFormat": "{{source_workload}}.{{source_workload_namespace}} P50 (🔐mTLS)",
          "refId": "D",
          "step": 2
        },
        {
          "expr": "histogram_quantile(0.90, sum(irate(istio_response_bytes_bucket{reporter=\"destination\", connection_security_policy=\"mutual_tls\", destination_workload=~\"$workload\", destination_workload_namespace=~\"$namespace\", source_workload=~\"$srcwl\", source_workload_namespace=~\"$srcns\"}[1m])) by (source_workload, source_workload_namespace, le))",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 1,
          "legendFormat": "{{source_workload}}.{{source_workload_namespace}}  P90 (🔐mTLS)",
          "refId": "A",
          "step": 2
        },
        {
          "expr": "histogram_quantile(0.95, sum(irate(istio_response_bytes_bucket{reporter=\"destination\", connection_security_policy=\"mutual_tls\", destination_workload=~\"$workload\", destination_workload_namespace=~\"$namespace\", source_workload=~\"$srcwl\", source_workload_namespace=~\"$srcns\"}[1m])) by (source_workload, source_workload_namespace, le))",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 1,
          "legendFormat": "{{source_workload}}.{{source_workload_namespace}} P95 (🔐mTLS)",
          "refId": "B",
          "step": 2
        },
        {
          "expr": "histogram_quantile(0.99, sum(irate(istio_response_bytes_bucket{reporter=\"destination\", connection_security_policy=\"mutual_tls\", destination_workload=~\"$workload\", destination_workload_namespace=~\"$namespace\", source_workload=~\"$srcwl\", source_workload_namespace=~\"$srcns\"}[1m])) by (source_workload, source_workload_namespace, le))",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 1,
          "legendFormat": "{{source_workload}}.{{source_workload_namespace}}  P99 (🔐mTLS)",
          "refId": "C",
          "step": 2
        },
        {
          "expr": "histogram_quantile(0.50, sum(irate(istio_response_bytes_bucket{reporter=\"destination\", connection_security_policy!=\"mutual_tls\", destination_workload=~\"$workload\", destination_workload_namespace=~\"$namespace\", source_workload=~\"$srcwl\", source_workload_namespace=~\"$srcns\"}[1m])) by (source_workload, source_workload_namespace, le))",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 1,
          "legendFormat": "{{source_workload}}.{{source_workload_namespace}} P50",
          "refId": "E",
          "step": 2
        },
        {
          "expr": "histogram_quantile(0.90, sum(irate(istio_response_bytes_bucket{reporter=\"destination\", connection_security_policy!=\"mutual_tls\", destination_workload=~\"$workload\", destination_workload_namespace=~\"$namespace\", source_workload=~\"$srcwl\", source_workload_namespace=~\"$srcns\"}[1m])) by (source_workload, source_workload_namespace, le))",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 1,
          "legendFormat": "{{source_workload}}.{{source_workload_namespace}} P90",
          "refId": "F",
          "step": 2
        },
        {
          "expr": "histogram_quantile(0.95, sum(irate(istio_response_bytes_bucket{reporter=\"destination\", connection_security_policy!=\"mutual_tls\", destination_workload=~\"$workload\", destination_workload_namespace=~\"$namespace\", source_workload=~\"$srcwl\", source_workload_namespace=~\"$srcns\"}[1m])) by (source_workload, source_workload_namespace, le))",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 1,
          "legendFormat": "{{source_workload}}.{{source_workload_namespace}} P95",
          "refId": "G",
          "step": 2
        },
        {
          "expr": "histogram_quantile(0.99, sum(irate(istio_response_bytes_bucket{reporter=\"destination\", connection_security_policy!=\"mutual_tls\", destination_workload=~\"$workload\", destination_workload_namespace=~\"$namespace\", source_workload=~\"$srcwl\", source_workload_namespace=~\"$srcns\"}[1m])) by (source_workload, source_workload_namespace, le))",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 1,
          "legendFormat": "{{source_workload}}.{{source_workload_namespace}} P99",
          "refId": "H",
          "step": 2
        }
      ],
      "thresholds": [],
      "timeFrom": null,
      "timeShift": null,
      "title": "Response Size By Source",
      "tooltip": {
        "shared": true,
        "sort": 0,
        "value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
        "buckets": null,
        "mode": "time",
        "name": null,
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "decbytes",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": "0",
          "show": true
        },
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": false
        }
      ]
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": "Prometheus",
      "fill": 1,
      "gridPos": {
        "h": 6,
        "w": 12,
        "x": 0,
        "y": 26
      },
      "id": 80,
      "legend": {
        "avg": false,
        "current": false,
        "max": false,
        "min": false,
        "show": true,
        "total": false,
        "values": false
      },
      "lines": true,
      "linewidth": 1,
      "links": [],
      "nullPointMode": "null",
      "percentage": false,
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "expr": "round(sum(irate(istio_tcp_received_bytes_total{reporter=\"destination\", connection_security_policy=\"mutual_tls\", destination_workload_namespace=~\"$namespace\", destination_workload=~\"$workload\", source_workload=~\"$srcwl\", source_workload_namespace=~\"$srcns\"}[1m])) by (source_workload, source_workload_namespace), 0.001)",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 1,
          "legendFormat": "{{ source_workload }}.{{ source_workload_namespace}} (🔐mTLS)",
          "refId": "A",
          "step": 2
        },
        {
          "expr": "round(sum(irate(istio_tcp_received_bytes_total{reporter=\"destination\", connection_security_policy!=\"mutual_tls\", destination_workload_namespace=~\"$namespace\", destination_workload=~\"$workload\", source_workload=~\"$srcwl\", source_workload_namespace=~\"$srcns\"}[1m])) by (source_workload, source_workload_namespace), 0.001)",
          "format": "time_series",
          "intervalFactor": 1,
          "legendFormat": "{{ source_workload }}.{{ source_workload_namespace}}",
          "refId": "B",
          "step": 2
        }
      ],
      "thresholds": [],
      "timeFrom": null,
      "timeShift": null,
      "title": "Bytes Received from Incoming TCP Connection",
      "tooltip": {
        "shared": true,
        "sort": 0,
        "value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
        "buckets": null,
        "mode": "time",
        "name": null,
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "Bps",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": "0",
          "show": true
        },
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        }
      ]
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": "Prometheus",
      "fill": 1,
      "gridPos": {
        "h": 6,
        "w": 12,
        "x": 12,
        "y": 26
      },
      "id": 82,
      "legend": {
        "avg": false,
        "current": false,
        "max": false,
        "min": false,
        "show": true,
        "total": false,
        "values": false
      },
      "lines": true,
      "linewidth": 1,
      "links": [],
      "nullPointMode": "null",
      "percentage": false,
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "expr": "round(sum(irate(istio_tcp_sent_bytes_total{connection_security_policy=\"mutual_tls\", reporter=\"destination\", destination_workload_namespace=~\"$namespace\", destination_workload=~\"$workload\", source_workload=~\"$srcwl\", source_workload_namespace=~\"$srcns\"}[1m])) by (source_workload, source_workload_namespace), 0.001)",
          "format": "time_series",
          "intervalFactor": 1,
          "legendFormat": "{{ source_workload }}.{{ source_workload_namespace}} (🔐mTLS)",
          "refId": "A",
          "step": 2
        },
        {
          "expr": "round(sum(irate(istio_tcp_sent_bytes_total{connection_security_policy!=\"mutual_tls\", reporter=\"destination\", destination_workload_namespace=~\"$namespace\", destination_workload=~\"$workload\", source_workload=~\"$srcwl\", source_workload_namespace=~\"$srcns\"}[1m])) by (source_workload, source_workload_namespace), 0.001)",
          "format": "time_series",
          "intervalFactor": 1,
          "legendFormat": "{{ source_workload }}.{{ source_workload_namespace}}",
          "refId": "B",
          "step": 2
        }
      ],
      "thresholds": [],
      "timeFrom": null,
      "timeShift": null,
      "title": "Bytes Sent to Incoming TCP Connection",
      "tooltip": {
        "shared": true,
        "sort": 0,
        "value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
        "buckets": null,
        "mode": "time",
        "name": null,
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "Bps",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": "0",
          "show": true
        },
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        }
      ]
    },
    {
      "content": "<div class=\"dashboard-header text-center\">\n<span>OUTBOUND SERVICES</span>\n</div>",
      "gridPos": {
        "h": 3,
        "w": 24,
        "x": 0,
        "y": 32
      },
      "id": 69,
      "links": [],
      "mode": "html",
      "title": "",
      "transparent": true,
      "type": "text"
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": "Prometheus",
      "fill": 0,
      "gridPos": {
        "h": 6,
        "w": 12,
        "x": 0,
        "y": 35
      },
      "id": 70,
      "legend": {
        "avg": false,
        "current": false,
        "hideEmpty": true,
        "max": false,
        "min": false,
        "show": true,
        "total": false,
        "values": false
      },
      "lines": true,
      "linewidth": 1,
      "links": [],
      "nullPointMode": "null as zero",
      "percentage": false,
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "expr": "round(sum(irate(istio_requests_total{connection_security_policy=\"mutual_tls\", source_workload_namespace=~\"$namespace\", source_workload=~\"$workload\", reporter=\"source\", destination_service=~\"$dstsvc\"}[30s])) by (destination_service, response_code), 0.001)",
          "format": "time_series",
          "intervalFactor": 1,
          "legendFormat": "{{ destination_service }} : {{ response_code }} (🔐mTLS)",
          "refId": "B",
          "step": 2
        },
        {
          "expr": "round(sum(irate(istio_requests_total{connection_security_policy!=\"mutual_tls\", source_workload_namespace=~\"$namespace\", source_workload=~\"$workload\", reporter=\"source\", destination_service=~\"$dstsvc\"}[30s])) by (destination_service, response_code), 0.001)",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 1,
          "legendFormat": "{{ destination_service }} : {{ response_code }}",
          "refId": "A",
          "step": 2
        }
      ],
      "thresholds": [],
      "timeFrom": null,
      "timeShift": null,
      "title": "Outgoing Requests by Destination And Response Code",
      "tooltip": {
        "shared": false,
        "sort": 0,
        "value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
        "buckets": null,
        "mode": "time",
        "name": null,
        "show": true,
        "values": [
          "total"
        ]
      },
      "yaxes": [
        {
          "format": "ops",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": "0",
          "show": true
        },
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": false
        }
      ]
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": "Prometheus",
      "fill": 1,
      "gridPos": {
        "h": 6,
        "w": 12,
        "x": 12,
        "y": 35
      },
      "id": 71,
      "legend": {
        "avg": false,
        "current": false,
        "hideEmpty": true,
        "hideZero": false,
        "max": false,
        "min": false,
        "show": true,
        "total": false,
        "values": false
      },
      "lines": true,
      "linewidth": 1,
      "links": [],
      "nullPointMode": "null",
      "percentage": false,
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "expr": "sum(rate(istio_requests_total{reporter=\"source\", connection_security_policy=\"mutual_tls\", source_workload_namespace=~\"$namespace\", source_workload=~\"$workload\",response_code!~\"5.*\", destination_service=~\"$dstsvc\"}[30s])) by (destination_service) / sum(rate(istio_requests_total{reporter=\"source\", connection_security_policy=\"mutual_tls\", source_workload_namespace=~\"$namespace\", source_workload=~\"$workload\", destination_service=~\"$dstsvc\"}[30s])) by (destination_service)",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 1,
          "legendFormat": "{{ destination_service }} (🔐mTLS)",
          "refId": "A",
          "step": 2
        },
        {
          "expr": "sum(rate(istio_requests_total{reporter=\"source\", connection_security_policy!=\"mutual_tls\", source_workload_namespace=~\"$namespace\", source_workload=~\"$workload\",response_code!~\"5.*\", destination_service=~\"$dstsvc\"}[30s])) by (destination_service) / sum(rate(istio_requests_total{reporter=\"source\", connection_security_policy!=\"mutual_tls\", source_workload_namespace=~\"$namespace\", source_workload=~\"$workload\", destination_service=~\"$dstsvc\"}[30s])) by (destination_service)",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 1,
          "legendFormat": "{{destination_service }}",
          "refId": "B",
          "step": 2
        }
      ],
      "thresholds": [],
      "timeFrom": null,
      "timeShift": null,
      "title": "Outgoing Success Rate (non-5xx responses) By Destination",
      "tooltip": {
        "shared": true,
        "sort": 0,
        "value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
        "buckets": null,
        "mode": "time",
        "name": null,
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "percentunit",
          "label": null,
          "logBase": 1,
          "max": "1.01",
          "min": "0",
          "show": true
        },
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": false
        }
      ]
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": "Prometheus",
      "description": "",
      "fill": 1,
      "gridPos": {
        "h": 6,
        "w": 8,
        "x": 0,
        "y": 41
      },
      "id": 72,
      "legend": {
        "alignAsTable": false,
        "avg": false,
        "current": false,
        "hideEmpty": true,
        "hideZero": false,
        "max": false,
        "min": false,
        "rightSide": false,
        "show": true,
        "total": false,
        "values": false
      },
      "lines": true,
      "linewidth": 1,
      "links": [],
      "nullPointMode": "null",
      "percentage": false,
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "expr": "histogram_quantile(0.50, sum(irate(istio_request_duration_seconds_bucket{reporter=\"source\", connection_security_policy=\"mutual_tls\", source_workload=~\"$workload\", source_workload_namespace=~\"$namespace\", destination_service=~\"$dstsvc\"}[1m])) by (destination_service, le))",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 1,
          "legendFormat": "{{ destination_service }} P50 (🔐mTLS)",
          "refId": "D",
          "step": 2
        },
        {
          "expr": "histogram_quantile(0.90, sum(irate(istio_request_duration_seconds_bucket{reporter=\"source\", connection_security_policy=\"mutual_tls\", source_workload=~\"$workload\", source_workload_namespace=~\"$namespace\", destination_service=~\"$dstsvc\"}[1m])) by (destination_service, le))",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 1,
          "legendFormat": "{{ destination_service }} P90 (🔐mTLS)",
          "refId": "A",
          "step": 2
        },
        {
          "expr": "histogram_quantile(0.95, sum(irate(istio_request_duration_seconds_bucket{reporter=\"source\", connection_security_policy=\"mutual_tls\", source_workload=~\"$workload\", source_workload_namespace=~\"$namespace\", destination_service=~\"$dstsvc\"}[1m])) by (destination_service, le))",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 1,
          "legendFormat": "{{ destination_service }} P95 (🔐mTLS)",
          "refId": "B",
          "step": 2
        },
        {
          "expr": "histogram_quantile(0.99, sum(irate(istio_request_duration_seconds_bucket{reporter=\"source\", connection_security_policy=\"mutual_tls\", source_workload=~\"$workload\", source_workload_namespace=~\"$namespace\", destination_service=~\"$dstsvc\"}[1m])) by (destination_service, le))",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 1,
          "legendFormat": "{{ destination_service }} P99 (🔐mTLS)",
          "refId": "C",
          "step": 2
        },
        {
          "expr": "histogram_quantile(0.50, sum(irate(istio_request_duration_seconds_bucket{reporter=\"source\", connection_security_policy!=\"mutual_tls\", source_workload=~\"$workload\", source_workload_namespace=~\"$namespace\", destination_service=~\"$dstsvc\"}[1m])) by (destination_service, le))",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 1,
          "legendFormat": "{{ destination_service }} P50",
          "refId": "E",
          "step": 2
        },
        {
          "expr": "histogram_quantile(0.90, sum(irate(istio_request_duration_seconds_bucket{reporter=\"source\", connection_security_policy!=\"mutual_tls\", source_workload=~\"$workload\", source_workload_namespace=~\"$namespace\", destination_service=~\"$dstsvc\"}[1m])) by (destination_service, le))",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 1,
          "legendFormat": "{{ destination_service }} P90",
          "refId": "F",
          "step": 2
        },
        {
          "expr": "histogram_quantile(0.95, sum(irate(istio_request_duration_seconds_bucket{reporter=\"source\", connection_security_policy!=\"mutual_tls\", source_workload=~\"$workload\", source_workload_namespace=~\"$namespace\", destination_service=~\"$dstsvc\"}[1m])) by (destination_service, le))",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 1,
          "legendFormat": "{{ destination_service }} P95",
          "refId": "G",
          "step": 2
        },
        {
          "expr": "histogram_quantile(0.99, sum(irate(istio_request_duration_seconds_bucket{reporter=\"source\", connection_security_policy!=\"mutual_tls\", source_workload=~\"$workload\", source_workload_namespace=~\"$namespace\", destination_service=~\"$dstsvc\"}[1m])) by (destination_service, le))",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 1,
          "legendFormat": "{{ destination_service }} P99",
          "refId": "H",
          "step": 2
        }
      ],
      "thresholds": [],
      "timeFrom": null,
      "timeShift": null,
      "title": "Outgoing Request Duration by Destination",
      "tooltip": {
        "shared": true,
        "sort": 0,
        "value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
        "buckets": null,
        "mode": "time",
        "name": null,
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "s",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": "0",
          "show": true
        },
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": false
        }
      ]
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": "Prometheus",
      "fill": 1,
      "gridPos": {
        "h": 6,
        "w": 8,
        "x": 8,
        "y": 41
      },
      "id": 73,
      "legend": {
        "alignAsTable": false,
        "avg": false,
        "current": false,
        "hideEmpty": true,
        "max": false,
        "min": false,
        "rightSide": false,
        "show": true,
        "total": false,
        "values": false
      },
      "lines": true,
      "linewidth": 1,
      "links": [],
      "nullPointMode": "null",
      "percentage": false,
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "expr": "histogram_quantile(0.50, sum(irate(istio_request_bytes_bucket{reporter=\"source\", connection_security_policy=\"mutual_tls\", source_workload=~\"$workload\", source_workload_namespace=~\"$namespace\", destination_service=~\"$dstsvc\"}[1m])) by (destination_service, le))",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 1,
          "legendFormat": "{{ destination_service }} P50 (🔐mTLS)",
          "refId": "D",
          "step": 2
        },
        {
          "expr": "histogram_quantile(0.90, sum(irate(istio_request_bytes_bucket{reporter=\"source\", connection_security_policy=\"mutual_tls\", source_workload=~\"$workload\", source_workload_namespace=~\"$namespace\", destination_service=~\"$dstsvc\"}[1m])) by (destination_service, le))",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 1,
          "legendFormat": "{{ destination_service }} P90 (🔐mTLS)",
          "refId": "A",
          "step": 2
        },
        {
          "expr": "histogram_quantile(0.95, sum(irate(istio_request_bytes_bucket{reporter=\"source\", connection_security_policy=\"mutual_tls\", source_workload=~\"$workload\", source_workload_namespace=~\"$namespace\", destination_service=~\"$dstsvc\"}[1m])) by (destination_service, le))",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 1,
          "legendFormat": "{{ destination_service }} P95 (🔐mTLS)",
          "refId": "B",
          "step": 2
        },
        {
          "expr": "histogram_quantile(0.99, sum(irate(istio_request_bytes_bucket{reporter=\"source\", connection_security_policy=\"mutual_tls\", source_workload=~\"$workload\", source_workload_namespace=~\"$namespace\", destination_service=~\"$dstsvc\"}[1m])) by (destination_service, le))",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 1,
          "legendFormat": "{{ destination_service }} P99 (🔐mTLS)",
          "refId": "C",
          "step": 2
        },
        {
          "expr": "histogram_quantile(0.50, sum(irate(istio_request_bytes_bucket{reporter=\"source\", connection_security_policy!=\"mutual_tls\", source_workload=~\"$workload\", source_workload_namespace=~\"$namespace\", destination_service=~\"$dstsvc\"}[1m])) by (destination_service, le))",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 1,
          "legendFormat": "{{ destination_service }} P50",
          "refId": "E",
          "step": 2
        },
        {
          "expr": "histogram_quantile(0.90, sum(irate(istio_request_bytes_bucket{reporter=\"source\", connection_security_policy!=\"mutual_tls\", source_workload=~\"$workload\", source_workload_namespace=~\"$namespace\", destination_service=~\"$dstsvc\"}[1m])) by (destination_service, le))",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 1,
          "legendFormat": "{{ destination_service }} P90",
          "refId": "F",
          "step": 2
        },
        {
          "expr": "histogram_quantile(0.95, sum(irate(istio_request_bytes_bucket{reporter=\"source\", connection_security_policy!=\"mutual_tls\", source_workload=~\"$workload\", source_workload_namespace=~\"$namespace\", destination_service=~\"$dstsvc\"}[1m])) by (destination_service, le))",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 1,
          "legendFormat": "{{ destination_service }} P95",
          "refId": "G",
          "step": 2
        },
        {
          "expr": "histogram_quantile(0.99, sum(irate(istio_request_bytes_bucket{reporter=\"source\", connection_security_policy!=\"mutual_tls\", source_workload=~\"$workload\", source_workload_namespace=~\"$namespace\", destination_service=~\"$dstsvc\"}[1m])) by (destination_service, le))",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 1,
          "legendFormat": "{{ destination_service }} P99",
          "refId": "H",
          "step": 2
        }
      ],
      "thresholds": [],
      "timeFrom": null,
      "timeShift": null,
      "title": "Outgoing Request Size By Destination",
      "tooltip": {
        "shared": true,
        "sort": 0,
        "value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
        "buckets": null,
        "mode": "time",
        "name": null,
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "decbytes",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": "0",
          "show": true
        },
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": false
        }
      ]
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": "Prometheus",
      "fill": 1,
      "gridPos": {
        "h": 6,
        "w": 8,
        "x": 16,
        "y": 41
      },
      "id": 74,
      "legend": {
        "alignAsTable": false,
        "avg": false,
        "current": false,
        "hideEmpty": true,
        "max": false,
        "min": false,
        "rightSide": false,
        "show": true,
        "total": false,
        "values": false
      },
      "lines": true,
      "linewidth": 1,
      "links": [],
      "nullPointMode": "null",
      "percentage": false,
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "expr": "histogram_quantile(0.50, sum(irate(istio_response_bytes_bucket{reporter=\"source\", connection_security_policy=\"mutual_tls\", source_workload=~\"$workload\", source_workload_namespace=~\"$namespace\", destination_service=~\"$dstsvc\"}[1m])) by (destination_service, le))",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 1,
          "legendFormat": "{{ destination_service }} P50 (🔐mTLS)",
          "refId": "D",
          "step": 2
        },
        {
          "expr": "histogram_quantile(0.90, sum(irate(istio_response_bytes_bucket{reporter=\"source\", connection_security_policy=\"mutual_tls\", source_workload=~\"$workload\", source_workload_namespace=~\"$namespace\", destination_service=~\"$dstsvc\"}[1m])) by (destination_service, le))",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 1,
          "legendFormat": "{{ destination_service }} P90 (🔐mTLS)",
          "refId": "A",
          "step": 2
        },
        {
          "expr": "histogram_quantile(0.95, sum(irate(istio_response_bytes_bucket{reporter=\"source\", connection_security_policy=\"mutual_tls\", source_workload=~\"$workload\", source_workload_namespace=~\"$namespace\", destination_service=~\"$dstsvc\"}[1m])) by (destination_service, le))",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 1,
          "legendFormat": "{{ destination_service }} P95 (🔐mTLS)",
          "refId": "B",
          "step": 2
        },
        {
          "expr": "histogram_quantile(0.99, sum(irate(istio_response_bytes_bucket{reporter=\"source\", connection_security_policy=\"mutual_tls\", source_workload=~\"$workload\", source_workload_namespace=~\"$namespace\", destination_service=~\"$dstsvc\"}[1m])) by (destination_service, le))",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 1,
          "legendFormat": "{{ destination_service }}  P99 (🔐mTLS)",
          "refId": "C",
          "step": 2
        },
        {
          "expr": "histogram_quantile(0.50, sum(irate(istio_response_bytes_bucket{reporter=\"source\", connection_security_policy!=\"mutual_tls\", source_workload=~\"$workload\", source_workload_namespace=~\"$namespace\", destination_service=~\"$dstsvc\"}[1m])) by (destination_service, le))",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 1,
          "legendFormat": "{{ destination_service }} P50",
          "refId": "E",
          "step": 2
        },
        {
          "expr": "histogram_quantile(0.90, sum(irate(istio_response_bytes_bucket{reporter=\"source\", connection_security_policy!=\"mutual_tls\", source_workload=~\"$workload\", source_workload_namespace=~\"$namespace\", destination_service=~\"$dstsvc\"}[1m])) by (destination_service, le))",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 1,
          "legendFormat": "{{ destination_service }} P90",
          "refId": "F",
          "step": 2
        },
        {
          "expr": "histogram_quantile(0.95, sum(irate(istio_response_bytes_bucket{reporter=\"source\", connection_security_policy!=\"mutual_tls\", source_workload=~\"$workload\", source_workload_namespace=~\"$namespace\", destination_service=~\"$dstsvc\"}[1m])) by (destination_service, le))",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 1,
          "legendFormat": "{{ destination_service }} P95",
          "refId": "G",
          "step": 2
        },
        {
          "expr": "histogram_quantile(0.99, sum(irate(istio_response_bytes_bucket{reporter=\"source\", connection_security_policy!=\"mutual_tls\", source_workload=~\"$workload\", source_workload_namespace=~\"$namespace\", destination_service=~\"$dstsvc\"}[1m])) by (destination_service, le))",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 1,
          "legendFormat": "{{ destination_service }} P99",
          "refId": "H",
          "step": 2
        }
      ],
      "thresholds": [],
      "timeFrom": null,
      "timeShift": null,
      "title": "Response Size By Destination",
      "tooltip": {
        "shared": true,
        "sort": 0,
        "value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
        "buckets": null,
        "mode": "time",
        "name": null,
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "decbytes",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": "0",
          "show": true
        },
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": false
        }
      ]
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": "Prometheus",
      "fill": 1,
      "gridPos": {
        "h": 6,
        "w": 12,
        "x": 0,
        "y": 47
      },
      "id": 76,
      "legend": {
        "avg": false,
        "current": false,
        "max": false,
        "min": false,
        "show": true,
        "total": false,
        "values": false
      },
      "lines": true,
      "linewidth": 1,
      "links": [],
      "nullPointMode": "null",
      "percentage": false,
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "expr": "round(sum(irate(istio_tcp_sent_bytes_total{connection_security_policy=\"mutual_tls\", reporter=\"source\", source_workload_namespace=~\"$namespace\", source_workload=~\"$workload\", destination_service=~\"$dstsvc\"}[1m])) by (destination_service), 0.001)",
          "format": "time_series",
          "intervalFactor": 1,
          "legendFormat": "{{ destination_service }} (🔐mTLS)",
          "refId": "A",
          "step": 2
        },
        {
          "expr": "round(sum(irate(istio_tcp_sent_bytes_total{connection_security_policy!=\"mutual_tls\", reporter=\"source\", source_workload_namespace=~\"$namespace\", source_workload=~\"$workload\", destination_service=~\"$dstsvc\"}[1m])) by (destination_service), 0.001)",
          "format": "time_series",
          "intervalFactor": 1,
          "legendFormat": "{{ destination_service }}",
          "refId": "B",
          "step": 2
        }
      ],
      "thresholds": [],
      "timeFrom": null,
      "timeShift": null,
      "title": "Bytes Sent on Outgoing TCP Connection",
      "tooltip": {
        "shared": true,
        "sort": 0,
        "value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
        "buckets": null,
        "mode": "time",
        "name": null,
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "Bps",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": "0",
          "show": true
        },
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        }
      ]
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": "Prometheus",
      "fill": 1,
      "gridPos": {
        "h": 6,
        "w": 12,
        "x": 12,
        "y": 47
      },
      "id": 78,
      "legend": {
        "avg": false,
        "current": false,
        "max": false,
        "min": false,
        "show": true,
        "total": false,
        "values": false
      },
      "lines": true,
      "linewidth": 1,
      "links": [],
      "nullPointMode": "null",
      "percentage": false,
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "expr": "round(sum(irate(istio_tcp_received_bytes_total{reporter=\"source\", connection_security_policy=\"mutual_tls\", source_workload_namespace=~\"$namespace\", source_workload=~\"$workload\", destination_service=~\"$dstsvc\"}[1m])) by (destination_service), 0.001)",
          "format": "time_series",
          "intervalFactor": 1,
          "legendFormat": "{{ destination_service }} (🔐mTLS)",
          "refId": "A",
          "step": 2
        },
        {
          "expr": "round(sum(irate(istio_tcp_received_bytes_total{reporter=\"source\", connection_security_policy!=\"mutual_tls\", source_workload_namespace=~\"$namespace\", source_workload=~\"$workload\", destination_service=~\"$dstsvc\"}[1m])) by (destination_service), 0.001)",
          "format": "time_series",
          "intervalFactor": 1,
          "legendFormat": "{{ destination_service }}",
          "refId": "B",
          "step": 2
        }
      ],
      "thresholds": [],
      "timeFrom": null,
      "timeShift": null,
      "title": "Bytes Received from Outgoing TCP Connection",
      "tooltip": {
        "shared": true,
        "sort": 0,
        "value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
        "buckets": null,
        "mode": "time",
        "name": null,
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "Bps",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": "0",
          "show": true
        },
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        }
      ]
    }
  ],
  "refresh": "10s",
  "schemaVersion": 16,
  "style": "dark",
  "tags": [],
  "templating": {
    "list": [
      {
        "allValue": null,
        "current": {},
        "datasource": "Prometheus",
        "hide": 0,
        "includeAll": false,
        "label": "Namespace",
        "multi": false,
        "name": "namespace",
        "options": [],
        "query": "query_result(sum(istio_requests_total) by (destination_workload_namespace) or sum(istio_tcp_sent_bytes_total) by (destination_workload_namespace))",
        "refresh": 1,
        "regex": "/.*_namespace=\"([^\"]*).*/",
        "sort": 0,
        "tagValuesQuery": "",
        "tags": [],
        "tagsQuery": "",
        "type": "query",
        "useTags": false
      },
      {
        "allValue": null,
        "current": {},
        "datasource": "Prometheus",
        "hide": 0,
        "includeAll": false,
        "label": "Workload",
        "multi": false,
        "name": "workload",
        "options": [],
        "query": "query_result((sum(istio_requests_total{destination_workload_namespace=~\"$namespace\"}) by (destination_workload) or sum(istio_requests_total{source_workload_namespace=~\"$namespace\"}) by (source_workload)) or (sum(istio_tcp_sent_bytes_total{destination_workload_namespace=~\"$namespace\"}) by (destination_workload) or sum(istio_tcp_sent_bytes_total{source_workload_namespace=~\"$namespace\"}) by (source_workload)))",
        "refresh": 1,
        "regex": "/.*workload=\"([^\"]*).*/",
        "sort": 1,
        "tagValuesQuery": "",
        "tags": [],
        "tagsQuery": "",
        "type": "query",
        "useTags": false
      },
      {
        "allValue": null,
        "current": {},
        "datasource": "Prometheus",
        "hide": 0,
        "includeAll": true,
        "label": "Inbound Workload Namespace",
        "multi": true,
        "name": "srcns",
        "options": [],
        "query": "query_result( sum(istio_requests_total{reporter=\"destination\", destination_workload=\"$workload\", destination_workload_namespace=~\"$namespace\"}) by (source_workload_namespace) or sum(istio_tcp_sent_bytes_total{reporter=\"destination\", destination_workload=\"$workload\", destination_workload_namespace=~\"$namespace\"}) by (source_workload_namespace))",
        "refresh": 1,
        "regex": "/.*namespace=\"([^\"]*).*/",
        "sort": 2,
        "tagValuesQuery": "",
        "tags": [],
        "tagsQuery": "",
        "type": "query",
        "useTags": false
      },
      {
        "allValue": null,
        "current": {},
        "datasource": "Prometheus",
        "hide": 0,
        "includeAll": true,
        "label": "Inbound Workload",
        "multi": true,
        "name": "srcwl",
        "options": [],
        "query": "query_result( sum(istio_requests_total{reporter=\"destination\", destination_workload=\"$workload\", destination_workload_namespace=~\"$namespace\", source_workload_namespace=~\"$srcns\"}) by (source_workload) or sum(istio_tcp_sent_bytes_total{reporter=\"destination\", destination_workload=\"$workload\", destination_workload_namespace=~\"$namespace\", source_workload_namespace=~\"$srcns\"}) by (source_workload))",
        "refresh": 1,
        "regex": "/.*workload=\"([^\"]*).*/",
        "sort": 3,
        "tagValuesQuery": "",
        "tags": [],
        "tagsQuery": "",
        "type": "query",
        "useTags": false
      },
      {
        "allValue": null,
        "current": {},
        "datasource": "Prometheus",
        "hide": 0,
        "includeAll": true,
        "label": "Destination Service",
        "multi": true,
        "name": "dstsvc",
        "options": [],
        "query": "query_result( sum(istio_requests_total{reporter=\"source\", source_workload=~\"$workload\", source_workload_namespace=~\"$namespace\"}) by (destination_service) or sum(istio_tcp_sent_bytes_total{reporter=\"source\", source_workload=~\"$workload\", source_workload_namespace=~\"$namespace\"}) by (destination_service))",
        "refresh": 1,
        "regex": "/.*destination_service=\"([^\"]*).*/",
        "sort": 4,
        "tagValuesQuery": "",
        "tags": [],
        "tagsQuery": "",
        "type": "query",
        "useTags": false
      }
    ]
  },
  "time": {
    "from": "now-5m",
    "to": "now"
  },
  "timepicker": {
    "refresh_intervals": [
      "5s",
      "10s",
      "30s",
      "1m",
      "5m",
      "15m",
      "30m",
      "1h",
      "2h",
      "1d"
    ],
    "time_options": [
      "5m",
      "15m",
      "1h",
      "6h",
      "12h",
      "24h",
      "2d",
      "7d",
      "30d"
    ]
  },
  "timezone": "",
  "title": "Istio Workload Dashboard",
  "uid": "UbsSZTDik",
  "version": 1
}
'
  
  mixer-dashboard.json: '{
  "__inputs": [
    {
      "name": "DS_PROMETHEUS",
      "label": "Prometheus",
      "description": "",
      "type": "datasource",
      "pluginId": "prometheus",
      "pluginName": "Prometheus"
    }
  ],
  "__requires": [
    {
      "type": "grafana",
      "id": "grafana",
      "name": "Grafana",
      "version": "5.2.2"
    },
    {
      "type": "panel",
      "id": "graph",
      "name": "Graph",
      "version": "5.0.0"
    },
    {
      "type": "datasource",
      "id": "prometheus",
      "name": "Prometheus",
      "version": "5.0.0"
    },
    {
      "type": "panel",
      "id": "text",
      "name": "Text",
      "version": "5.0.0"
    }
  ],
  "annotations": {
    "list": [
      {
        "builtIn": 1,
        "datasource": "-- Grafana --",
        "enable": true,
        "hide": true,
        "iconColor": "rgba(0, 211, 255, 1)",
        "name": "Annotations & Alerts",
        "type": "dashboard"
      }
    ]
  },
  "editable": false,
  "gnetId": null,
  "graphTooltip": 1,
  "id": null,
  "iteration": 1535646398209,
  "links": [],
  "panels": [
    {
      "content": "<center><h2>Resource Usage</h2></center>",
      "gridPos": {
        "h": 3,
        "w": 24,
        "x": 0,
        "y": 0
      },
      "height": "40",
      "id": 29,
      "links": [],
      "mode": "html",
      "title": "",
      "transparent": true,
      "type": "text"
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": "Prometheus",
      "fill": 1,
      "gridPos": {
        "h": 7,
        "w": 6,
        "x": 0,
        "y": 3
      },
      "id": 5,
      "legend": {
        "avg": false,
        "current": false,
        "max": false,
        "min": false,
        "show": true,
        "total": false,
        "values": false
      },
      "lines": true,
      "linewidth": 1,
      "links": [],
      "nullPointMode": "null",
      "percentage": false,
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "expr": "sum(process_virtual_memory_bytes{job=~\"istio-telemetry|istio-policy\"}) by (job)",
          "format": "time_series",
          "instant": false,
          "intervalFactor": 2,
          "legendFormat": "Virtual Memory ({{ job }})",
          "refId": "I"
        },
        {
          "expr": "sum(process_resident_memory_bytes{job=~\"istio-telemetry|istio-policy\"}) by (job)",
          "format": "time_series",
          "intervalFactor": 2,
          "legendFormat": "Resident Memory ({{ job }})",
          "refId": "H"
        },
        {
          "expr": "sum(go_memstats_heap_sys_bytes{job=~\"istio-telemetry|istio-policy\"}) by (job)",
          "format": "time_series",
          "hide": true,
          "intervalFactor": 2,
          "legendFormat": "heap sys ({{ job }})",
          "refId": "A"
        },
        {
          "expr": "sum(go_memstats_heap_alloc_bytes{job=~\"istio-telemetry|istio-policy\"}) by (job)",
          "format": "time_series",
          "hide": true,
          "intervalFactor": 2,
          "legendFormat": "heap alloc ({{ job }})",
          "refId": "D"
        },
        {
          "expr": "sum(go_memstats_alloc_bytes{job=~\"istio-telemetry|istio-policy\"}) by (job)",
          "format": "time_series",
          "intervalFactor": 2,
          "legendFormat": "Alloc ({{ job }})",
          "refId": "F"
        },
        {
          "expr": "sum(go_memstats_heap_inuse_bytes{job=~\"istio-telemetry|istio-policy\"}) by (job)",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 2,
          "legendFormat": "Heap in-use ({{ job }})",
          "refId": "E"
        },
        {
          "expr": "sum(go_memstats_stack_inuse_bytes{job=~\"istio-telemetry|istio-policy\"}) by (job)",
          "format": "time_series",
          "intervalFactor": 2,
          "legendFormat": "Stack in-use ({{ job }})",
          "refId": "G"
        },
        {
          "expr": "sum(label_replace(container_memory_usage_bytes{container_name=~\"mixer|istio-proxy\", pod_name=~\"istio-telemetry-.*|istio-policy-.*\"}, \"service\", \"$1\" , \"pod_name\", \"(istio-telemetry|istio-policy)-.*\")) by (service)",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 2,
          "legendFormat": "{{ service }} total (k8s)",
          "refId": "C"
        },
        {
          "expr": "sum(label_replace(container_memory_usage_bytes{container_name=~\"mixer|istio-proxy\", pod_name=~\"istio-telemetry-.*|istio-policy-.*\"}, \"service\", \"$1\" , \"pod_name\", \"(istio-telemetry|istio-policy)-.*\")) by (container_name, service)",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 2,
          "legendFormat": "{{ service }} - {{ container_name }} (k8s)",
          "refId": "B"
        }
      ],
      "thresholds": [],
      "timeFrom": null,
      "timeShift": null,
      "title": "Memory",
      "tooltip": {
        "shared": true,
        "sort": 0,
        "value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
        "buckets": null,
        "mode": "time",
        "name": null,
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "bytes",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        },
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": false
        }
      ],
      "yaxis": {
        "align": false,
        "alignLevel": null
      }
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": "Prometheus",
      "fill": 1,
      "gridPos": {
        "h": 7,
        "w": 6,
        "x": 6,
        "y": 3
      },
      "id": 6,
      "legend": {
        "avg": false,
        "current": false,
        "max": false,
        "min": false,
        "show": true,
        "total": false,
        "values": false
      },
      "lines": true,
      "linewidth": 1,
      "links": [],
      "nullPointMode": "null",
      "percentage": false,
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "expr": "label_replace(sum(rate(container_cpu_usage_seconds_total{container_name=~\"mixer|istio-proxy\", pod_name=~\"istio-telemetry-.*|istio-policy-.*\"}[1m])) by (pod_name), \"service\", \"$1\" , \"pod_name\", \"(istio-telemetry|istio-policy)-.*\")",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 2,
          "legendFormat": "{{ service }} total (k8s)",
          "refId": "A"
        },
        {
          "expr": "label_replace(sum(rate(container_cpu_usage_seconds_total{container_name=~\"mixer|istio-proxy\", pod_name=~\"istio-telemetry-.*|istio-policy-.*\"}[1m])) by (container_name, pod_name), \"service\", \"$1\" , \"pod_name\", \"(istio-telemetry|istio-policy)-.*\")",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 2,
          "legendFormat": "{{ service }} - {{ container_name }} (k8s)",
          "refId": "B"
        },
        {
          "expr": "sum(irate(process_cpu_seconds_total{job=~\"istio-telemetry|istio-policy\"}[1m])) by (job)",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 2,
          "legendFormat": "{{ job }} (self-reported)",
          "refId": "C"
        }
      ],
      "thresholds": [],
      "timeFrom": null,
      "timeShift": null,
      "title": "CPU",
      "tooltip": {
        "shared": true,
        "sort": 0,
        "value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
        "buckets": null,
        "mode": "time",
        "name": null,
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        },
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        }
      ],
      "yaxis": {
        "align": false,
        "alignLevel": null
      }
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": "Prometheus",
      "fill": 1,
      "gridPos": {
        "h": 7,
        "w": 6,
        "x": 12,
        "y": 3
      },
      "id": 7,
      "legend": {
        "avg": false,
        "current": false,
        "max": false,
        "min": false,
        "show": true,
        "total": false,
        "values": false
      },
      "lines": true,
      "linewidth": 1,
      "links": [],
      "nullPointMode": "null",
      "percentage": false,
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "expr": "sum(process_open_fds{job=~\"istio-telemetry|istio-policy\"}) by (job)",
          "format": "time_series",
          "hide": true,
          "instant": false,
          "interval": "",
          "intervalFactor": 2,
          "legendFormat": "Open FDs ({{ job }})",
          "refId": "A"
        },
        {
          "expr": "sum(label_replace(container_fs_usage_bytes{container_name=~\"mixer|istio-proxy\", pod_name=~\"istio-telemetry-.*|istio-policy-.*\"}, \"service\", \"$1\" , \"pod_name\", \"(istio-telemetry|istio-policy)-.*\")) by (container_name, service)",
          "format": "time_series",
          "intervalFactor": 2,
          "legendFormat": "{{ service }} - {{ container_name }}",
          "refId": "B"
        }
      ],
      "thresholds": [],
      "timeFrom": null,
      "timeShift": null,
      "title": "Disk",
      "tooltip": {
        "shared": true,
        "sort": 0,
        "value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
        "buckets": null,
        "mode": "time",
        "name": null,
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "bytes",
          "label": "",
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        },
        {
          "decimals": null,
          "format": "none",
          "label": "",
          "logBase": 1024,
          "max": null,
          "min": null,
          "show": false
        }
      ],
      "yaxis": {
        "align": false,
        "alignLevel": null
      }
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": "Prometheus",
      "fill": 1,
      "gridPos": {
        "h": 7,
        "w": 6,
        "x": 18,
        "y": 3
      },
      "id": 4,
      "legend": {
        "avg": false,
        "current": false,
        "max": false,
        "min": false,
        "show": false,
        "total": false,
        "values": false
      },
      "lines": true,
      "linewidth": 1,
      "links": [],
      "nullPointMode": "null",
      "percentage": false,
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "expr": "sum(go_goroutines{job=~\"istio-telemetry|istio-policy\"}) by (job)",
          "format": "time_series",
          "intervalFactor": 2,
          "legendFormat": "Number of Goroutines ({{ job }})",
          "refId": "A"
        }
      ],
      "thresholds": [],
      "timeFrom": null,
      "timeShift": null,
      "title": "Goroutines",
      "tooltip": {
        "shared": true,
        "sort": 0,
        "value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
        "buckets": null,
        "mode": "time",
        "name": null,
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "short",
          "label": "",
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        },
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        }
      ],
      "yaxis": {
        "align": false,
        "alignLevel": null
      }
    },
    {
      "content": "<center><h2>Mixer Overview</h2></center>",
      "gridPos": {
        "h": 3,
        "w": 24,
        "x": 0,
        "y": 10
      },
      "height": "40px",
      "id": 30,
      "links": [],
      "mode": "html",
      "title": "",
      "transparent": true,
      "type": "text"
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": "Prometheus",
      "fill": 1,
      "gridPos": {
        "h": 6,
        "w": 6,
        "x": 0,
        "y": 13
      },
      "id": 9,
      "legend": {
        "avg": false,
        "current": false,
        "max": false,
        "min": false,
        "show": true,
        "total": false,
        "values": false
      },
      "lines": true,
      "linewidth": 1,
      "links": [],
      "nullPointMode": "null",
      "percentage": false,
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "expr": "sum(rate(grpc_server_handled_total[1m]))",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 2,
          "legendFormat": "mixer (Total)",
          "refId": "B"
        },
        {
          "expr": "sum(rate(grpc_server_handled_total[1m])) by (grpc_method)",
          "format": "time_series",
          "intervalFactor": 2,
          "legendFormat": "mixer ({{ grpc_method }})",
          "refId": "C"
        }
      ],
      "thresholds": [],
      "timeFrom": null,
      "timeShift": null,
      "title": "Incoming Requests",
      "tooltip": {
        "shared": true,
        "sort": 0,
        "value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
        "buckets": null,
        "mode": "time",
        "name": null,
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "ops",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        },
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": false
        }
      ],
      "yaxis": {
        "align": false,
        "alignLevel": null
      }
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": "Prometheus",
      "fill": 1,
      "gridPos": {
        "h": 6,
        "w": 6,
        "x": 6,
        "y": 13
      },
      "id": 8,
      "legend": {
        "avg": false,
        "current": false,
        "max": false,
        "min": false,
        "show": true,
        "total": false,
        "values": false
      },
      "lines": true,
      "linewidth": 1,
      "links": [],
      "nullPointMode": "null",
      "percentage": false,
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [
        {
          "alias": "{}",
          "yaxis": 1
        }
      ],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "expr": "histogram_quantile(0.5, sum(rate(grpc_server_handling_seconds_bucket{}[1m])) by (grpc_method, le)) * 1000",
          "format": "time_series",
          "intervalFactor": 2,
          "legendFormat": "{{ grpc_method }} 0.5",
          "refId": "B"
        },
        {
          "expr": "histogram_quantile(0.9, sum(rate(grpc_server_handling_seconds_bucket{}[1m])) by (grpc_method, le)) * 1000",
          "format": "time_series",
          "intervalFactor": 2,
          "legendFormat": "{{ grpc_method }} 0.9",
          "refId": "C"
        },
        {
          "expr": "histogram_quantile(0.99, sum(rate(grpc_server_handling_seconds_bucket{}[1m])) by (grpc_method, le)) * 1000",
          "format": "time_series",
          "intervalFactor": 2,
          "legendFormat": "{{ grpc_method }} 0.99",
          "refId": "D"
        }
      ],
      "thresholds": [],
      "timeFrom": null,
      "timeShift": null,
      "title": "Response Durations",
      "tooltip": {
        "shared": true,
        "sort": 0,
        "value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
        "buckets": null,
        "mode": "time",
        "name": null,
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "ms",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        },
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": false
        }
      ],
      "yaxis": {
        "align": false,
        "alignLevel": null
      }
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": "Prometheus",
      "fill": 1,
      "gridPos": {
        "h": 6,
        "w": 6,
        "x": 12,
        "y": 13
      },
      "id": 11,
      "legend": {
        "avg": false,
        "current": false,
        "max": false,
        "min": false,
        "show": true,
        "total": false,
        "values": false
      },
      "lines": true,
      "linewidth": 1,
      "links": [],
      "nullPointMode": "null",
      "percentage": false,
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "expr": "sum(rate(grpc_server_handled_total{grpc_code=~\"Unknown|Unimplemented|Internal|DataLoss\"}[1m])) by (grpc_method)",
          "format": "time_series",
          "intervalFactor": 2,
          "legendFormat": "Mixer {{ grpc_method }}",
          "refId": "B"
        }
      ],
      "thresholds": [],
      "timeFrom": null,
      "timeShift": null,
      "title": "Server Error Rate (5xx responses)",
      "tooltip": {
        "shared": true,
        "sort": 0,
        "value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
        "buckets": null,
        "mode": "time",
        "name": null,
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        },
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        }
      ],
      "yaxis": {
        "align": false,
        "alignLevel": null
      }
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": "Prometheus",
      "fill": 1,
      "gridPos": {
        "h": 6,
        "w": 6,
        "x": 18,
        "y": 13
      },
      "id": 12,
      "legend": {
        "avg": false,
        "current": false,
        "max": false,
        "min": false,
        "show": true,
        "total": false,
        "values": false
      },
      "lines": true,
      "linewidth": 1,
      "links": [],
      "nullPointMode": "null",
      "percentage": false,
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "expr": "sum(irate(grpc_server_handled_total{grpc_code!=\"OK\",grpc_service=~\".*Mixer\"}[1m])) by (grpc_method)",
          "format": "time_series",
          "intervalFactor": 2,
          "legendFormat": "Mixer {{ grpc_method }}",
          "refId": "B"
        }
      ],
      "thresholds": [],
      "timeFrom": null,
      "timeShift": null,
      "title": "Non-successes (4xxs)",
      "tooltip": {
        "shared": true,
        "sort": 0,
        "value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
        "buckets": null,
        "mode": "time",
        "name": null,
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        },
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        }
      ],
      "yaxis": {
        "align": false,
        "alignLevel": null
      }
    },
    {
      "content": "<center><h2>Adapters and Config</h2></center>",
      "gridPos": {
        "h": 3,
        "w": 24,
        "x": 0,
        "y": 19
      },
      "id": 28,
      "links": [],
      "mode": "html",
      "title": "",
      "transparent": true,
      "type": "text"
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": "Prometheus",
      "fill": 1,
      "gridPos": {
        "h": 7,
        "w": 12,
        "x": 0,
        "y": 22
      },
      "id": 13,
      "legend": {
        "avg": false,
        "current": false,
        "max": false,
        "min": false,
        "show": true,
        "total": false,
        "values": false
      },
      "lines": true,
      "linewidth": 1,
      "links": [],
      "nullPointMode": "null",
      "percentage": false,
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "expr": "sum(irate(mixer_runtime_dispatch_count{adapter=~\"$adapter\"}[1m])) by (adapter)",
          "format": "time_series",
          "intervalFactor": 2,
          "legendFormat": "{{ adapter }}",
          "refId": "A"
        }
      ],
      "thresholds": [],
      "timeFrom": null,
      "timeShift": null,
      "title": "Adapter Dispatch Count",
      "tooltip": {
        "shared": true,
        "sort": 0,
        "value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
        "buckets": null,
        "mode": "time",
        "name": null,
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        },
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": false
        }
      ],
      "yaxis": {
        "align": false,
        "alignLevel": null
      }
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": "Prometheus",
      "fill": 1,
      "gridPos": {
        "h": 7,
        "w": 12,
        "x": 12,
        "y": 22
      },
      "id": 14,
      "legend": {
        "avg": false,
        "current": false,
        "max": false,
        "min": false,
        "show": true,
        "total": false,
        "values": false
      },
      "lines": true,
      "linewidth": 1,
      "links": [],
      "nullPointMode": "null",
      "percentage": false,
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "expr": "histogram_quantile(0.5, sum(irate(mixer_runtime_dispatch_duration_bucket{adapter=~\"$adapter\"}[1m])) by (adapter, le))",
          "format": "time_series",
          "intervalFactor": 2,
          "legendFormat": "{{ adapter }} - p50",
          "refId": "A"
        },
        {
          "expr": "histogram_quantile(0.9, sum(irate(mixer_runtime_dispatch_duration_bucket{adapter=~\"$adapter\"}[1m])) by (adapter, le))",
          "format": "time_series",
          "intervalFactor": 2,
          "legendFormat": "{{ adapter }} - p90 ",
          "refId": "B"
        },
        {
          "expr": "histogram_quantile(0.99, sum(irate(mixer_runtime_dispatch_duration_bucket{adapter=~\"$adapter\"}[1m])) by (adapter, le))",
          "format": "time_series",
          "intervalFactor": 2,
          "legendFormat": "{{ adapter }} - p99",
          "refId": "C"
        }
      ],
      "thresholds": [],
      "timeFrom": null,
      "timeShift": null,
      "title": "Adapter Dispatch Duration",
      "tooltip": {
        "shared": true,
        "sort": 1,
        "value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
        "buckets": null,
        "mode": "time",
        "name": null,
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "s",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        },
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": false
        }
      ],
      "yaxis": {
        "align": false,
        "alignLevel": null
      }
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": "Prometheus",
      "fill": 1,
      "gridPos": {
        "h": 7,
        "w": 6,
        "x": 0,
        "y": 29
      },
      "id": 60,
      "legend": {
        "avg": false,
        "current": false,
        "max": false,
        "min": false,
        "show": true,
        "total": false,
        "values": false
      },
      "lines": true,
      "linewidth": 1,
      "links": [],
      "nullPointMode": "null",
      "percentage": false,
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "expr": "scalar(topk(1, max(mixer_config_rule_config_count) by (configID)))",
          "format": "time_series",
          "intervalFactor": 1,
          "legendFormat": "Rules",
          "refId": "A"
        },
        {
          "expr": "scalar(topk(1, max(mixer_config_rule_config_error_count) by (configID)))",
          "format": "time_series",
          "intervalFactor": 1,
          "legendFormat": "Config Errors",
          "refId": "B"
        },
        {
          "expr": "scalar(topk(1, max(mixer_config_rule_config_match_error_count) by (configID)))",
          "format": "time_series",
          "intervalFactor": 1,
          "legendFormat": "Match Errors",
          "refId": "C"
        },
        {
          "expr": "scalar(topk(1, max(mixer_config_unsatisfied_action_handler_count) by (configID)))",
          "format": "time_series",
          "intervalFactor": 1,
          "legendFormat": "Unsatisfied Actions",
          "refId": "D"
        }
      ],
      "thresholds": [],
      "timeFrom": null,
      "timeShift": null,
      "title": "Rules",
      "tooltip": {
        "shared": true,
        "sort": 0,
        "value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
        "buckets": null,
        "mode": "time",
        "name": null,
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        },
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        }
      ],
      "yaxis": {
        "align": false,
        "alignLevel": null
      }
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": "Prometheus",
      "fill": 1,
      "gridPos": {
        "h": 7,
        "w": 6,
        "x": 6,
        "y": 29
      },
      "id": 56,
      "legend": {
        "avg": false,
        "current": false,
        "max": false,
        "min": false,
        "show": true,
        "total": false,
        "values": false
      },
      "lines": true,
      "linewidth": 1,
      "links": [],
      "nullPointMode": "null",
      "percentage": false,
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "expr": "scalar(topk(1, max(mixer_config_instance_config_count) by (configID)))",
          "format": "time_series",
          "intervalFactor": 1,
          "legendFormat": "Instances",
          "refId": "A"
        }
      ],
      "thresholds": [],
      "timeFrom": null,
      "timeShift": null,
      "title": "Instances in Latest Config",
      "tooltip": {
        "shared": true,
        "sort": 0,
        "value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
        "buckets": null,
        "mode": "time",
        "name": null,
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        },
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        }
      ],
      "yaxis": {
        "align": false,
        "alignLevel": null
      }
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": "Prometheus",
      "fill": 1,
      "gridPos": {
        "h": 7,
        "w": 6,
        "x": 12,
        "y": 29
      },
      "id": 54,
      "legend": {
        "avg": false,
        "current": false,
        "max": false,
        "min": false,
        "show": true,
        "total": false,
        "values": false
      },
      "lines": true,
      "linewidth": 1,
      "links": [],
      "nullPointMode": "null",
      "percentage": false,
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "expr": "scalar(topk(1, max(mixer_config_handler_config_count) by (configID)))",
          "format": "time_series",
          "intervalFactor": 1,
          "legendFormat": "Handlers",
          "refId": "A"
        }
      ],
      "thresholds": [],
      "timeFrom": null,
      "timeShift": null,
      "title": "Handlers in Latest Config",
      "tooltip": {
        "shared": true,
        "sort": 0,
        "value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
        "buckets": null,
        "mode": "time",
        "name": null,
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        },
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        }
      ],
      "yaxis": {
        "align": false,
        "alignLevel": null
      }
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": "Prometheus",
      "fill": 1,
      "gridPos": {
        "h": 7,
        "w": 6,
        "x": 18,
        "y": 29
      },
      "id": 58,
      "legend": {
        "avg": false,
        "current": false,
        "max": false,
        "min": false,
        "show": true,
        "total": false,
        "values": false
      },
      "lines": true,
      "linewidth": 1,
      "links": [],
      "nullPointMode": "null",
      "percentage": false,
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "expr": "scalar(topk(1, max(mixer_config_attribute_count) by (configID)))",
          "format": "time_series",
          "instant": false,
          "intervalFactor": 1,
          "legendFormat": "Attributes",
          "refId": "A"
        }
      ],
      "thresholds": [],
      "timeFrom": null,
      "timeShift": null,
      "title": "Attributes in Latest Config",
      "tooltip": {
        "shared": true,
        "sort": 0,
        "value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
        "buckets": null,
        "mode": "time",
        "name": null,
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        },
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        }
      ],
      "yaxis": {
        "align": false,
        "alignLevel": null
      }
    },
    {
      "content": "<center><h2>Individual Adapters</h2></center>",
      "gridPos": {
        "h": 3,
        "w": 24,
        "x": 0,
        "y": 36
      },
      "id": 23,
      "links": [],
      "mode": "html",
      "title": "",
      "transparent": true,
      "type": "text"
    },
    {
      "collapsed": false,
      "gridPos": {
        "h": 1,
        "w": 24,
        "x": 0,
        "y": 39
      },
      "id": 46,
      "panels": [],
      "repeat": "adapter",
      "title": "$adapter Adapter",
      "type": "row"
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": "Prometheus",
      "fill": 1,
      "gridPos": {
        "h": 7,
        "w": 12,
        "x": 0,
        "y": 40
      },
      "id": 17,
      "legend": {
        "avg": false,
        "current": false,
        "max": false,
        "min": false,
        "show": true,
        "total": false,
        "values": false
      },
      "lines": true,
      "linewidth": 1,
      "links": [],
      "nullPointMode": "null",
      "percentage": false,
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "expr": "label_replace(irate(mixer_runtime_dispatch_count{adapter=\"$adapter\"}[1m]),\"handler\", \"$1 ($3)\", \"handler\", \"(.*)\\\\.(.*)\\\\.(.*)\")",
          "format": "time_series",
          "intervalFactor": 2,
          "legendFormat": "{{ handler }} (error: {{  error }})",
          "refId": "A"
        }
      ],
      "thresholds": [],
      "timeFrom": null,
      "timeShift": null,
      "title": "Dispatch Count By Handler",
      "tooltip": {
        "shared": true,
        "sort": 0,
        "value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
        "buckets": null,
        "mode": "time",
        "name": null,
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        },
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": false
        }
      ],
      "yaxis": {
        "align": false,
        "alignLevel": null
      }
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": "Prometheus",
      "fill": 1,
      "gridPos": {
        "h": 7,
        "w": 12,
        "x": 12,
        "y": 40
      },
      "id": 18,
      "legend": {
        "avg": false,
        "current": false,
        "max": false,
        "min": false,
        "show": true,
        "total": false,
        "values": false
      },
      "lines": true,
      "linewidth": 1,
      "links": [],
      "nullPointMode": "null",
      "percentage": false,
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "expr": "label_replace(histogram_quantile(0.5, sum(rate(mixer_runtime_dispatch_duration_bucket{adapter=\"$adapter\"}[1m])) by (handler, error, le)),  \"handler_short\", \"$1 ($3)\", \"handler\", \"(.*)\\\\.(.*)\\\\.(.*)\")",
          "format": "time_series",
          "intervalFactor": 2,
          "legendFormat": "p50 - {{ handler_short }} (error: {{ error }})",
          "refId": "A"
        },
        {
          "expr": "label_replace(histogram_quantile(0.9, sum(irate(mixer_runtime_dispatch_duration_bucket{adapter=\"$adapter\"}[1m])) by (handler, error, le)),  \"handler_short\", \"$1 ($3)\", \"handler\", \"(.*)\\\\.(.*)\\\\.(.*)\")",
          "format": "time_series",
          "intervalFactor": 2,
          "legendFormat": "p90 - {{ handler_short }} (error: {{ error }})",
          "refId": "D"
        },
        {
          "expr": "label_replace(histogram_quantile(0.99, sum(irate(mixer_runtime_dispatch_duration_bucket{adapter=\"$adapter\"}[1m])) by (handler, error, le)),  \"handler_short\", \"$1 ($3)\", \"handler\", \"(.*)\\\\.(.*)\\\\.(.*)\")",
          "format": "time_series",
          "intervalFactor": 2,
          "legendFormat": "p99 - {{ handler_short }} (error: {{ error }})",
          "refId": "E"
        }
      ],
      "thresholds": [],
      "timeFrom": null,
      "timeShift": null,
      "title": "Dispatch Duration By Handler",
      "tooltip": {
        "shared": true,
        "sort": 0,
        "value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
        "buckets": null,
        "mode": "time",
        "name": null,
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "s",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        },
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        }
      ],
      "yaxis": {
        "align": false,
        "alignLevel": null
      }
    }
  ],
  "refresh": "5s",
  "schemaVersion": 16,
  "style": "dark",
  "tags": [],
  "templating": {
    "list": [
      {
        "allValue": null,
        "current": {},
        "datasource": "Prometheus",
        "hide": 0,
        "includeAll": true,
        "label": "Adapter",
        "multi": true,
        "name": "adapter",
        "options": [],
        "query": "label_values(adapter)",
        "refresh": 2,
        "regex": "",
        "sort": 1,
        "tagValuesQuery": "",
        "tags": [],
        "tagsQuery": "",
        "type": "query",
        "useTags": false
      }
    ]
  },
  "time": {
    "from": "now-5m",
    "to": "now"
  },
  "timepicker": {
    "refresh_intervals": [
      "5s",
      "10s",
      "30s",
      "1m",
      "5m",
      "15m",
      "30m",
      "1h",
      "2h",
      "1d"
    ],
    "time_options": [
      "5m",
      "15m",
      "1h",
      "6h",
      "12h",
      "24h",
      "2d",
      "7d",
      "30d"
    ]
  },
  "timezone": "",
  "title": "Mixer Dashboard",
  "uid": "2",
  "version": 2
}
'
  
  pilot-dashboard.json: '{
  "annotations": {
    "list": [
      {
        "builtIn": 1,
        "datasource": "-- Grafana --",
        "enable": true,
        "hide": true,
        "iconColor": "rgba(0, 211, 255, 1)",
        "name": "Annotations & Alerts",
        "type": "dashboard"
      }
    ]
  },
  "editable": false,
  "gnetId": null,
  "graphTooltip": 1,
  "links": [],
  "panels": [
    {
      "content": "<center><h2>Resource Usage</h2></center>",
      "gridPos": {
        "h": 3,
        "w": 24,
        "x": 0,
        "y": 0
      },
      "height": "40",
      "id": 29,
      "links": [],
      "mode": "html",
      "title": "",
      "transparent": true,
      "type": "text"
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": "Prometheus",
      "fill": 1,
      "gridPos": {
        "h": 7,
        "w": 6,
        "x": 0,
        "y": 3
      },
      "id": 5,
      "legend": {
        "avg": false,
        "current": false,
        "max": false,
        "min": false,
        "show": true,
        "total": false,
        "values": false
      },
      "lines": true,
      "linewidth": 1,
      "links": [],
      "nullPointMode": "null",
      "percentage": false,
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "expr": "process_virtual_memory_bytes{job=\"pilot\"}",
          "format": "time_series",
          "instant": false,
          "intervalFactor": 2,
          "legendFormat": "Virtual Memory",
          "refId": "I",
          "step": 2
        },
        {
          "expr": "process_resident_memory_bytes{job=\"pilot\"}",
          "format": "time_series",
          "intervalFactor": 2,
          "legendFormat": "Resident Memory",
          "refId": "H",
          "step": 2
        },
        {
          "expr": "go_memstats_heap_sys_bytes{job=\"pilot\"}",
          "format": "time_series",
          "hide": true,
          "intervalFactor": 2,
          "legendFormat": "heap sys",
          "refId": "A"
        },
        {
          "expr": "go_memstats_heap_alloc_bytes{job=\"pilot\"}",
          "format": "time_series",
          "hide": true,
          "intervalFactor": 2,
          "legendFormat": "heap alloc",
          "refId": "D"
        },
        {
          "expr": "go_memstats_alloc_bytes{job=\"pilot\"}",
          "format": "time_series",
          "intervalFactor": 2,
          "legendFormat": "Alloc",
          "refId": "F",
          "step": 2
        },
        {
          "expr": "go_memstats_heap_inuse_bytes{job=\"pilot\"}",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 2,
          "legendFormat": "Heap in-use",
          "refId": "E",
          "step": 2
        },
        {
          "expr": "go_memstats_stack_inuse_bytes{job=\"pilot\"}",
          "format": "time_series",
          "intervalFactor": 2,
          "legendFormat": "Stack in-use",
          "refId": "G",
          "step": 2
        },
        {
          "expr": "sum(container_memory_usage_bytes{container_name=~\"discovery|istio-proxy\", pod_name=~\"istio-pilot-.*\"})",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 2,
          "legendFormat": "Total (k8s)",
          "refId": "C",
          "step": 2
        },
        {
          "expr": "container_memory_usage_bytes{container_name=~\"discovery|istio-proxy\", pod_name=~\"istio-pilot-.*\"}",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 2,
          "legendFormat": "{{ container_name }} (k8s)",
          "refId": "B",
          "step": 2
        }
      ],
      "thresholds": [],
      "timeFrom": null,
      "timeShift": null,
      "title": "Memory",
      "tooltip": {
        "shared": true,
        "sort": 0,
        "value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
        "buckets": null,
        "mode": "time",
        "name": null,
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "bytes",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        },
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": false
        }
      ],
      "yaxis": {
        "align": false,
        "alignLevel": null
      }
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": "Prometheus",
      "fill": 1,
      "gridPos": {
        "h": 7,
        "w": 6,
        "x": 6,
        "y": 3
      },
      "id": 6,
      "legend": {
        "avg": false,
        "current": false,
        "max": false,
        "min": false,
        "show": true,
        "total": false,
        "values": false
      },
      "lines": true,
      "linewidth": 1,
      "links": [],
      "nullPointMode": "null",
      "percentage": false,
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "expr": "sum(rate(container_cpu_usage_seconds_total{container_name=~\"discovery|istio-proxy\", pod_name=~\"istio-pilot-.*\"}[1m]))",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 2,
          "legendFormat": "Total (k8s)",
          "refId": "A",
          "step": 2
        },
        {
          "expr": "sum(rate(container_cpu_usage_seconds_total{container_name=~\"discovery|istio-proxy\", pod_name=~\"istio-pilot-.*\"}[1m])) by (container_name)",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 2,
          "legendFormat": "{{ container_name }} (k8s)",
          "refId": "B",
          "step": 2
        },
        {
          "expr": "irate(process_cpu_seconds_total{job=\"pilot\"}[1m])",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 2,
          "legendFormat": "pilot (self-reported)",
          "refId": "C",
          "step": 2
        }
      ],
      "thresholds": [],
      "timeFrom": null,
      "timeShift": null,
      "title": "CPU",
      "tooltip": {
        "shared": true,
        "sort": 0,
        "value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
        "buckets": null,
        "mode": "time",
        "name": null,
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        },
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        }
      ],
      "yaxis": {
        "align": false,
        "alignLevel": null
      }
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": "Prometheus",
      "fill": 1,
      "gridPos": {
        "h": 7,
        "w": 6,
        "x": 12,
        "y": 3
      },
      "id": 7,
      "legend": {
        "avg": false,
        "current": false,
        "max": false,
        "min": false,
        "show": true,
        "total": false,
        "values": false
      },
      "lines": true,
      "linewidth": 1,
      "links": [],
      "nullPointMode": "null",
      "percentage": false,
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "expr": "process_open_fds{job=\"pilot\"}",
          "format": "time_series",
          "hide": true,
          "instant": false,
          "interval": "",
          "intervalFactor": 2,
          "legendFormat": "Open FDs (pilot)",
          "refId": "A"
        },
        {
          "expr": "container_fs_usage_bytes{container_name=~\"discovery|istio-proxy\", pod_name=~\"istio-pilot-.*\"}",
          "format": "time_series",
          "intervalFactor": 2,
          "legendFormat": "{{ container_name }}",
          "refId": "B",
          "step": 2
        }
      ],
      "thresholds": [],
      "timeFrom": null,
      "timeShift": null,
      "title": "Disk",
      "tooltip": {
        "shared": true,
        "sort": 0,
        "value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
        "buckets": null,
        "mode": "time",
        "name": null,
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "bytes",
          "label": "",
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        },
        {
          "decimals": null,
          "format": "none",
          "label": "",
          "logBase": 1024,
          "max": null,
          "min": null,
          "show": false
        }
      ],
      "yaxis": {
        "align": false,
        "alignLevel": null
      }
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": "Prometheus",
      "fill": 1,
      "gridPos": {
        "h": 7,
        "w": 6,
        "x": 18,
        "y": 3
      },
      "id": 4,
      "legend": {
        "avg": false,
        "current": false,
        "max": false,
        "min": false,
        "show": false,
        "total": false,
        "values": false
      },
      "lines": true,
      "linewidth": 1,
      "links": [],
      "nullPointMode": "null",
      "percentage": false,
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "expr": "go_goroutines{job=\"pilot\"}",
          "format": "time_series",
          "intervalFactor": 2,
          "legendFormat": "Number of Goroutines",
          "refId": "A",
          "step": 2
        }
      ],
      "thresholds": [],
      "timeFrom": null,
      "timeShift": null,
      "title": "Goroutines",
      "tooltip": {
        "shared": true,
        "sort": 0,
        "value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
        "buckets": null,
        "mode": "time",
        "name": null,
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "short",
          "label": "",
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        },
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        }
      ],
      "yaxis": {
        "align": false,
        "alignLevel": null
      }
    },
    {
      "content": "<center><h2>xDS</h2></center>",
      "gridPos": {
        "h": 3,
        "w": 24,
        "x": 0,
        "y": 10
      },
      "id": 28,
      "links": [],
      "mode": "html",
      "title": "",
      "transparent": true,
      "type": "text"
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": "Prometheus",
      "fill": 1,
      "gridPos": {
        "h": 6,
        "w": 8,
        "x": 0,
        "y": 13
      },
      "id": 40,
      "legend": {
        "avg": false,
        "current": false,
        "max": false,
        "min": false,
        "show": true,
        "total": false,
        "values": false
      },
      "lines": true,
      "linewidth": 1,
      "links": [],
      "nullPointMode": "null",
      "percentage": false,
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "expr": "sum(irate(envoy_cluster_update_success{cluster_name=\"xds-grpc\"}[1m]))",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 1,
          "legendFormat": "XDS GRPC Successes",
          "refId": "C"
        }
      ],
      "thresholds": [],
      "timeFrom": null,
      "timeShift": null,
      "title": "Updates",
      "tooltip": {
        "shared": true,
        "sort": 0,
        "value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
        "buckets": null,
        "mode": "time",
        "name": null,
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "ops",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        },
        {
          "format": "ops",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": false
        }
      ],
      "yaxis": {
        "align": false,
        "alignLevel": null
      }
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": "Prometheus",
      "fill": 1,
      "gridPos": {
        "h": 6,
        "w": 8,
        "x": 8,
        "y": 13
      },
      "id": 42,
      "legend": {
        "avg": false,
        "current": false,
        "max": false,
        "min": false,
        "show": true,
        "total": false,
        "values": false
      },
      "lines": true,
      "linewidth": 1,
      "links": [],
      "nullPointMode": "null",
      "percentage": false,
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "expr": "round(sum(rate(envoy_cluster_update_attempt{cluster_name=\"xds-grpc\"}[1m])) - sum(rate(envoy_cluster_update_success{cluster_name=\"xds-grpc\"}[1m])))",
          "format": "time_series",
          "intervalFactor": 2,
          "legendFormat": "XDS GRPC ",
          "refId": "A",
          "step": 2
        }
      ],
      "thresholds": [],
      "timeFrom": null,
      "timeShift": null,
      "title": "Failures",
      "tooltip": {
        "shared": true,
        "sort": 0,
        "value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
        "buckets": null,
        "mode": "time",
        "name": null,
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "ops",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        },
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": false
        }
      ],
      "yaxis": {
        "align": false,
        "alignLevel": null
      }
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": "Prometheus",
      "fill": 1,
      "gridPos": {
        "h": 6,
        "w": 8,
        "x": 16,
        "y": 13
      },
      "id": 41,
      "legend": {
        "avg": false,
        "current": false,
        "max": false,
        "min": false,
        "show": true,
        "total": false,
        "values": false
      },
      "lines": true,
      "linewidth": 1,
      "links": [],
      "nullPointMode": "null",
      "percentage": false,
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "expr": "sum(envoy_cluster_upstream_cx_active{cluster_name=\"xds-grpc\"})",
          "format": "time_series",
          "intervalFactor": 2,
          "legendFormat": "Pilot (XDS GRPC)",
          "refId": "C",
          "step": 2
        }
      ],
      "thresholds": [],
      "timeFrom": null,
      "timeShift": null,
      "title": "Active Connections",
      "tooltip": {
        "shared": true,
        "sort": 0,
        "value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
        "buckets": null,
        "mode": "time",
        "name": null,
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        },
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        }
      ],
      "yaxis": {
        "align": false,
        "alignLevel": null
      }
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": "Prometheus",
      "fill": 1,
      "gridPos": {
        "h": 8,
        "w": 8,
        "x": 0,
        "y": 19
      },
      "id": 45,
      "legend": {
        "avg": false,
        "current": false,
        "max": false,
        "min": false,
        "show": true,
        "total": false,
        "values": false
      },
      "lines": true,
      "linewidth": 1,
      "links": [],
      "nullPointMode": "null",
      "percentage": false,
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "expr": "pilot_conflict_inbound_listener{job=\"pilot\"}",
          "format": "time_series",
          "intervalFactor": 1,
          "legendFormat": "Inbound Listeners",
          "refId": "B"
        },
        {
          "expr": "pilot_conflict_outbound_listener_http_over_current_tcp{job=\"pilot\"}",
          "format": "time_series",
          "intervalFactor": 1,
          "legendFormat": "Outbound Listeners (http over current tcp)",
          "refId": "A"
        },
        {
          "expr": "pilot_conflict_outbound_listener_tcp_over_current_tcp{job=\"pilot\"}",
          "format": "time_series",
          "intervalFactor": 1,
          "legendFormat": "Outbound Listeners (tcp over current tcp)",
          "refId": "C"
        },
        {
          "expr": "pilot_conflict_outbound_listener_tcp_over_current_http{job=\"pilot\"}",
          "format": "time_series",
          "intervalFactor": 1,
          "legendFormat": "Outbound Listeners (tcp over current http)",
          "refId": "D"
        },
        {
          "expr": "pilot_conf_filter_chains{job=\"pilot\"}",
          "format": "time_series",
          "intervalFactor": 1,
          "legendFormat": "Filter Chains",
          "refId": "E"
        }
      ],
      "thresholds": [],
      "timeFrom": null,
      "timeShift": null,
      "title": "Conflicts",
      "tooltip": {
        "shared": true,
        "sort": 0,
        "value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
        "buckets": null,
        "mode": "time",
        "name": null,
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        },
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        }
      ],
      "yaxis": {
        "align": false,
        "alignLevel": null
      }
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": "Prometheus",
      "fill": 1,
      "gridPos": {
        "h": 8,
        "w": 8,
        "x": 8,
        "y": 19
      },
      "id": 47,
      "legend": {
        "avg": false,
        "current": false,
        "max": false,
        "min": false,
        "show": true,
        "total": false,
        "values": false
      },
      "lines": true,
      "linewidth": 1,
      "links": [],
      "nullPointMode": "null",
      "percentage": false,
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "expr": "pilot_virt_services{job=\"pilot\"}",
          "format": "time_series",
          "intervalFactor": 1,
          "legendFormat": "Virtual Services",
          "refId": "A"
        },
        {
          "expr": "pilot_services{job=\"pilot\"}",
          "format": "time_series",
          "intervalFactor": 1,
          "legendFormat": "Services",
          "refId": "B"
        },
        {
          "expr": "label_replace(sum(pilot_xds_cds_reject{job=\"pilot\"}) by (node, err), \"node\", \"$1\", \"node\", \".*~.*~(.*)~.*\")",
          "format": "time_series",
          "hide": true,
          "intervalFactor": 1,
          "legendFormat": "Rejected CDS Configs - {{ node }}: {{ err }}",
          "refId": "C"
        },
        {
          "expr": "pilot_xds_eds_reject{job=\"pilot\"}",
          "format": "time_series",
          "hide": true,
          "intervalFactor": 1,
          "legendFormat": "Rejected EDS Configs",
          "refId": "D"
        },
        {
          "expr": "pilot_xds{job=\"pilot\"}",
          "format": "time_series",
          "intervalFactor": 1,
          "legendFormat": "Connected Endpoints",
          "refId": "E"
        },
        {
          "expr": "rate(pilot_xds_write_timeout{job=\"pilot\"}[1m])",
          "format": "time_series",
          "intervalFactor": 1,
          "legendFormat": "Write Timeouts",
          "refId": "F"
        },
        {
          "expr": "rate(pilot_xds_push_timeout{job=\"pilot\"}[1m])",
          "format": "time_series",
          "intervalFactor": 1,
          "legendFormat": "Push Timeouts",
          "refId": "G"
        },
        {
          "expr": "rate(pilot_xds_pushes{job=\"pilot\"}[1m])",
          "format": "time_series",
          "intervalFactor": 1,
          "legendFormat": "Pushes ({{ type }})",
          "refId": "H"
        },
        {
          "expr": "rate(pilot_xds_push_errors{job=\"pilot\"}[1m])",
          "format": "time_series",
          "intervalFactor": 1,
          "legendFormat": "Push Errors ({{ type }})",
          "refId": "I"
        }
      ],
      "thresholds": [],
      "timeFrom": null,
      "timeShift": null,
      "title": "ADS Monitoring",
      "tooltip": {
        "shared": true,
        "sort": 0,
        "value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
        "buckets": null,
        "mode": "time",
        "name": null,
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        },
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        }
      ],
      "yaxis": {
        "align": false,
        "alignLevel": null
      }
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": "Prometheus",
      "fill": 1,
      "gridPos": {
        "h": 8,
        "w": 8,
        "x": 16,
        "y": 19
      },
      "id": 49,
      "legend": {
        "avg": false,
        "current": false,
        "max": false,
        "min": false,
        "show": true,
        "total": false,
        "values": false
      },
      "lines": true,
      "linewidth": 1,
      "links": [],
      "nullPointMode": "null",
      "percentage": false,
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "expr": "label_replace(sum(pilot_xds_cds_reject{job=\"pilot\"}) by (node, err), \"node\", \"$1\", \"node\", \".*~.*~(.*)~.*\")",
          "format": "time_series",
          "intervalFactor": 1,
          "legendFormat": "{{ node }}  ({{ err }})",
          "refId": "A"
        }
      ],
      "thresholds": [],
      "timeFrom": null,
      "timeShift": null,
      "title": "Rejected CDS Configs",
      "tooltip": {
        "shared": true,
        "sort": 0,
        "value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
        "buckets": null,
        "mode": "time",
        "name": null,
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        },
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        }
      ],
      "yaxis": {
        "align": false,
        "alignLevel": null
      }
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": "Prometheus",
      "fill": 1,
      "gridPos": {
        "h": 7,
        "w": 8,
        "x": 0,
        "y": 27
      },
      "id": 52,
      "legend": {
        "avg": false,
        "current": false,
        "max": false,
        "min": false,
        "show": true,
        "total": false,
        "values": false
      },
      "lines": true,
      "linewidth": 1,
      "links": [],
      "nullPointMode": "null",
      "percentage": false,
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "expr": "label_replace(sum(pilot_xds_eds_reject{job=\"pilot\"}) by (node, err), \"node\", \"$1\", \"node\", \".*~.*~(.*)~.*\")",
          "format": "time_series",
          "intervalFactor": 1,
          "legendFormat": "{{ node }} ({{err}})",
          "refId": "A"
        }
      ],
      "thresholds": [],
      "timeFrom": null,
      "timeShift": null,
      "title": "Rejected EDS Configs",
      "tooltip": {
        "shared": true,
        "sort": 0,
        "value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
        "buckets": null,
        "mode": "time",
        "name": null,
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        },
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        }
      ],
      "yaxis": {
        "align": false,
        "alignLevel": null
      }
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": "Prometheus",
      "fill": 1,
      "gridPos": {
        "h": 7,
        "w": 8,
        "x": 8,
        "y": 27
      },
      "id": 54,
      "legend": {
        "avg": false,
        "current": false,
        "max": false,
        "min": false,
        "show": true,
        "total": false,
        "values": false
      },
      "lines": true,
      "linewidth": 1,
      "links": [],
      "nullPointMode": "null",
      "percentage": false,
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "expr": "label_replace(sum(pilot_xds_lds_reject{job=\"pilot\"}) by (node, err), \"node\", \"$1\", \"node\", \".*~.*~(.*)~.*\")",
          "format": "time_series",
          "intervalFactor": 1,
          "legendFormat": "{{ node }} ({{err}})",
          "refId": "A"
        }
      ],
      "thresholds": [],
      "timeFrom": null,
      "timeShift": null,
      "title": "Rejected LDS Configs",
      "tooltip": {
        "shared": true,
        "sort": 0,
        "value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
        "buckets": null,
        "mode": "time",
        "name": null,
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        },
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        }
      ],
      "yaxis": {
        "align": false,
        "alignLevel": null
      }
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": "Prometheus",
      "fill": 1,
      "gridPos": {
        "h": 7,
        "w": 8,
        "x": 16,
        "y": 27
      },
      "id": 53,
      "legend": {
        "avg": false,
        "current": false,
        "max": false,
        "min": false,
        "show": true,
        "total": false,
        "values": false
      },
      "lines": true,
      "linewidth": 1,
      "links": [],
      "nullPointMode": "null",
      "percentage": false,
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "expr": "label_replace(sum(pilot_xds_rds_reject{job=\"pilot\"}) by (node, err), \"node\", \"$1\", \"node\", \".*~.*~(.*)~.*\")",
          "format": "time_series",
          "intervalFactor": 1,
          "legendFormat": "{{ node }} ({{err}})",
          "refId": "A"
        }
      ],
      "thresholds": [],
      "timeFrom": null,
      "timeShift": null,
      "title": "Rejected RDS Configs",
      "tooltip": {
        "shared": true,
        "sort": 0,
        "value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
        "buckets": null,
        "mode": "time",
        "name": null,
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        },
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        }
      ],
      "yaxis": {
        "align": false,
        "alignLevel": null
      }
    },
    {
      "aliasColors": {
        "outbound|80||default-http-backend.kube-system.svc.cluster.local": "rgba(255, 255, 255, 0.97)"
      },
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": "Prometheus",
      "fill": 1,
      "gridPos": {
        "h": 7,
        "w": 8,
        "x": 0,
        "y": 34
      },
      "id": 51,
      "legend": {
        "avg": false,
        "current": false,
        "max": false,
        "min": false,
        "show": true,
        "total": false,
        "values": false
      },
      "lines": true,
      "linewidth": 1,
      "links": [],
      "nullPointMode": "null",
      "percentage": false,
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [
        {
          "alias": "outbound|80||default-http-backend.kube-system.svc.cluster.local",
          "yaxis": 1
        }
      ],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "expr": "sum(pilot_xds_eds_instances{job=\"pilot\"}) by (cluster)",
          "format": "time_series",
          "intervalFactor": 1,
          "legendFormat": "{{ cluster }}",
          "refId": "A"
        }
      ],
      "thresholds": [],
      "timeFrom": null,
      "timeShift": null,
      "title": "EDS Instances",
      "tooltip": {
        "shared": true,
        "sort": 0,
        "value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
        "buckets": null,
        "mode": "time",
        "name": null,
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        },
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        }
      ],
      "yaxis": {
        "align": false,
        "alignLevel": null
      }
    }
  ],
  "refresh": "5s",
  "schemaVersion": 16,
  "style": "dark",
  "tags": [],
  "templating": {
    "list": []
  },
  "time": {
    "from": "now-5m",
    "to": "now"
  },
  "timepicker": {
    "refresh_intervals": [
      "5s",
      "10s",
      "30s",
      "1m",
      "5m",
      "15m",
      "30m",
      "1h",
      "2h",
      "1d"
    ],
    "time_options": [
      "5m",
      "15m",
      "1h",
      "6h",
      "12h",
      "24h",
      "2d",
      "7d",
      "30d"
    ]
  },
  "timezone": "browser",
  "title": "Pilot Dashboard",
  "uid": "3",
  "version": 1
}
'
---
# Source: istio/charts/grafana/templates/configmap.yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: istio-grafana
  namespace: istio-system
  labels:
    app: istio-grafana
    chart: grafana-1.0.3
    release: istio
    heritage: Tiller
    istio: grafana
data:
  datasources.yaml: |
    apiVersion: 1
    datasources:
    - access: proxy
      editable: true
      isDefault: true
      jsonData:
        timeInterval: 5s
      name: Prometheus
      orgId: 1
      type: prometheus
      url: http://prometheus:9090
    
  dashboardproviders.yaml: |
    apiVersion: 1
    providers:
    - disableDeletion: false
      folder: istio
      name: istio
      options:
        path: /var/lib/grafana/dashboards/istio
      orgId: 1
      type: file
---
# Source: istio/charts/mixer/templates/configmap.yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: istio-statsd-prom-bridge
  namespace: istio-system
  labels:
    app: istio-statsd-prom-bridge
    chart: mixer-1.0.3
    release: istio
    heritage: Tiller
    istio: mixer
data:
  mapping.conf: |-
---
# Source: istio/charts/prometheus/templates/configmap.yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: prometheus
  namespace: istio-system
  labels:
    app: prometheus
    chart: prometheus-1.0.3
    release: istio
    heritage: Tiller
data:
  prometheus.yml: |-
    global:
      scrape_interval: 15s
    scrape_configs:

    - job_name: 'istio-mesh'
      # Override the global default and scrape targets from this job every 5 seconds.
      scrape_interval: 5s

      kubernetes_sd_configs:
      - role: endpoints
        namespaces:
          names:
          - istio-system

      relabel_configs:
      - source_labels: [__meta_kubernetes_service_name, __meta_kubernetes_endpoint_port_name]
        action: keep
        regex: istio-telemetry;prometheus


    # Scrape config for envoy stats
    - job_name: 'envoy-stats'
      metrics_path: /stats/prometheus
      kubernetes_sd_configs:
      - role: pod

      relabel_configs:
      - source_labels: [__meta_kubernetes_pod_container_port_name]
        action: keep
        regex: '.*-envoy-prom'
      - source_labels: [__address__, __meta_kubernetes_pod_annotation_prometheus_io_port]
        action: replace
        regex: ([^:]+)(?::\d+)?;(\d+)
        replacement: $1:15090
        target_label: __address__
      - action: labelmap
        regex: __meta_kubernetes_pod_label_(.+)
      - source_labels: [__meta_kubernetes_namespace]
        action: replace
        target_label: namespace
      - source_labels: [__meta_kubernetes_pod_name]
        action: replace
        target_label: pod_name

      metric_relabel_configs:
      # Exclude some of the envoy metrics that have massive cardinality
      # This list may need to be pruned further moving forward, as informed
      # by performance and scalability testing.
      - source_labels: [ cluster_name ]
        regex: '(outbound|inbound|prometheus_stats).*'
        action: drop
      - source_labels: [ tcp_prefix ]
        regex: '(outbound|inbound|prometheus_stats).*'
        action: drop
      - source_labels: [ listener_address ]
        regex: '(.+)'
        action: drop
      - source_labels: [ http_conn_manager_listener_prefix ]
        regex: '(.+)'
        action: drop
      - source_labels: [ http_conn_manager_prefix ]
        regex: '(.+)'
        action: drop
      - source_labels: [ __name__ ]
        regex: 'envoy_tls.*'
        action: drop
      - source_labels: [ __name__ ]
        regex: 'envoy_tcp_downstream.*'
        action: drop
      - source_labels: [ __name__ ]
        regex: 'envoy_http_(stats|admin).*'
        action: drop
      - source_labels: [ __name__ ]
        regex: 'envoy_cluster_(lb|retry|bind|internal|max|original).*'
        action: drop


    - job_name: 'istio-policy'
      # Override the global default and scrape targets from this job every 5 seconds.
      scrape_interval: 5s
      # metrics_path defaults to '/metrics'
      # scheme defaults to 'http'.

      kubernetes_sd_configs:
      - role: endpoints
        namespaces:
          names:
          - istio-system


      relabel_configs:
      - source_labels: [__meta_kubernetes_service_name, __meta_kubernetes_endpoint_port_name]
        action: keep
        regex: istio-policy;http-monitoring

    - job_name: 'istio-telemetry'
      # Override the global default and scrape targets from this job every 5 seconds.
      scrape_interval: 5s
      # metrics_path defaults to '/metrics'
      # scheme defaults to 'http'.

      kubernetes_sd_configs:
      - role: endpoints
        namespaces:
          names:
          - istio-system

      relabel_configs:
      - source_labels: [__meta_kubernetes_service_name, __meta_kubernetes_endpoint_port_name]
        action: keep
        regex: istio-telemetry;http-monitoring

    - job_name: 'pilot'
      # Override the global default and scrape targets from this job every 5 seconds.
      scrape_interval: 5s
      # metrics_path defaults to '/metrics'
      # scheme defaults to 'http'.

      kubernetes_sd_configs:
      - role: endpoints
        namespaces:
          names:
          - istio-system

      relabel_configs:
      - source_labels: [__meta_kubernetes_service_name, __meta_kubernetes_endpoint_port_name]
        action: keep
        regex: istio-pilot;http-monitoring

    - job_name: 'galley'
      # Override the global default and scrape targets from this job every 5 seconds.
      scrape_interval: 5s
      # metrics_path defaults to '/metrics'
      # scheme defaults to 'http'.

      kubernetes_sd_configs:
      - role: endpoints
        namespaces:
          names:
          - istio-system

      relabel_configs:
      - source_labels: [__meta_kubernetes_service_name, __meta_kubernetes_endpoint_port_name]
        action: keep
        regex: istio-galley;http-monitoring

    # scrape config for API servers
    - job_name: 'kubernetes-apiservers'
      kubernetes_sd_configs:
      - role: endpoints
        namespaces:
          names:
          - default
      scheme: https
      tls_config:
        ca_file: /var/run/secrets/kubernetes.io/serviceaccount/ca.crt
      bearer_token_file: /var/run/secrets/kubernetes.io/serviceaccount/token
      relabel_configs:
      - source_labels: [__meta_kubernetes_service_name, __meta_kubernetes_endpoint_port_name]
        action: keep
        regex: kubernetes;https

    # scrape config for nodes (kubelet)
    - job_name: 'kubernetes-nodes'
      scheme: https
      tls_config:
        ca_file: /var/run/secrets/kubernetes.io/serviceaccount/ca.crt
      bearer_token_file: /var/run/secrets/kubernetes.io/serviceaccount/token
      kubernetes_sd_configs:
      - role: node
      relabel_configs:
      - action: labelmap
        regex: __meta_kubernetes_node_label_(.+)
      - target_label: __address__
        replacement: kubernetes.default.svc:443
      - source_labels: [__meta_kubernetes_node_name]
        regex: (.+)
        target_label: __metrics_path__
        replacement: /api/v1/nodes/${1}/proxy/metrics

    # Scrape config for Kubelet cAdvisor.
    #
    # This is required for Kubernetes 1.7.3 and later, where cAdvisor metrics
    # (those whose names begin with 'container_') have been removed from the
    # Kubelet metrics endpoint.  This job scrapes the cAdvisor endpoint to
    # retrieve those metrics.
    #
    # In Kubernetes 1.7.0-1.7.2, these metrics are only exposed on the cAdvisor
    # HTTP endpoint; use "replacement: /api/v1/nodes/${1}:4194/proxy/metrics"
    # in that case (and ensure cAdvisor's HTTP server hasn't been disabled with
    # the --cadvisor-port=0 Kubelet flag).
    #
    # This job is not necessary and should be removed in Kubernetes 1.6 and
    # earlier versions, or it will cause the metrics to be scraped twice.
    - job_name: 'kubernetes-cadvisor'
      scheme: https
      tls_config:
        ca_file: /var/run/secrets/kubernetes.io/serviceaccount/ca.crt
      bearer_token_file: /var/run/secrets/kubernetes.io/serviceaccount/token
      kubernetes_sd_configs:
      - role: node
      relabel_configs:
      - action: labelmap
        regex: __meta_kubernetes_node_label_(.+)
      - target_label: __address__
        replacement: kubernetes.default.svc:443
      - source_labels: [__meta_kubernetes_node_name]
        regex: (.+)
        target_label: __metrics_path__
        replacement: /api/v1/nodes/${1}/proxy/metrics/cadvisor

    # scrape config for service endpoints.
    - job_name: 'kubernetes-service-endpoints'
      kubernetes_sd_configs:
      - role: endpoints
      relabel_configs:
      - source_labels: [__meta_kubernetes_service_annotation_prometheus_io_scrape]
        action: keep
        regex: true
      - source_labels: [__meta_kubernetes_service_annotation_prometheus_io_scheme]
        action: replace
        target_label: __scheme__
        regex: (https?)
      - source_labels: [__meta_kubernetes_service_annotation_prometheus_io_path]
        action: replace
        target_label: __metrics_path__
        regex: (.+)
      - source_labels: [__address__, __meta_kubernetes_service_annotation_prometheus_io_port]
        action: replace
        target_label: __address__
        regex: ([^:]+)(?::\d+)?;(\d+)
        replacement: $1:$2
      - action: labelmap
        regex: __meta_kubernetes_service_label_(.+)
      - source_labels: [__meta_kubernetes_namespace]
        action: replace
        target_label: kubernetes_namespace
      - source_labels: [__meta_kubernetes_service_name]
        action: replace
        target_label: kubernetes_name

    - job_name: 'kubernetes-pods'
      kubernetes_sd_configs:
      - role: pod
      relabel_configs:  # If first two labels are present, pod should be scraped  by the istio-secure job.
      - source_labels: [__meta_kubernetes_pod_annotation_prometheus_io_scrape]
        action: keep
        regex: true
      - source_labels: [__meta_kubernetes_pod_annotation_sidecar_istio_io_status]
        action: drop
        regex: (.+)
      - source_labels: [__meta_kubernetes_pod_annotation_istio_mtls]
        action: drop
        regex: (true)
      - source_labels: [__meta_kubernetes_pod_annotation_prometheus_io_path]
        action: replace
        target_label: __metrics_path__
        regex: (.+)
      - source_labels: [__address__, __meta_kubernetes_pod_annotation_prometheus_io_port]
        action: replace
        regex: ([^:]+)(?::\d+)?;(\d+)
        replacement: $1:$2
        target_label: __address__
      - action: labelmap
        regex: __meta_kubernetes_pod_label_(.+)
      - source_labels: [__meta_kubernetes_namespace]
        action: replace
        target_label: namespace
      - source_labels: [__meta_kubernetes_pod_name]
        action: replace
        target_label: pod_name

    - job_name: 'kubernetes-pods-istio-secure'
      scheme: https
      tls_config:
        ca_file: /etc/istio-certs/root-cert.pem
        cert_file: /etc/istio-certs/cert-chain.pem
        key_file: /etc/istio-certs/key.pem
        insecure_skip_verify: true  # prometheus does not support secure naming.
      kubernetes_sd_configs:
      - role: pod
      relabel_configs:
      - source_labels: [__meta_kubernetes_pod_annotation_prometheus_io_scrape]
        action: keep
        regex: true
      # sidecar status annotation is added by sidecar injector and
      # istio_workload_mtls_ability can be specifically placed on a pod to indicate its ability to receive mtls traffic.
      - source_labels: [__meta_kubernetes_pod_annotation_sidecar_istio_io_status, __meta_kubernetes_pod_annotation_istio_mtls]
        action: keep
        regex: (([^;]+);([^;]*))|(([^;]*);(true))
      - source_labels: [__meta_kubernetes_pod_annotation_prometheus_io_path]
        action: replace
        target_label: __metrics_path__
        regex: (.+)
      - source_labels: [__address__]  # Only keep address that is host:port
        action: keep    # otherwise an extra target with ':443' is added for https scheme
        regex: ([^:]+):(\d+)
      - source_labels: [__address__, __meta_kubernetes_pod_annotation_prometheus_io_port]
        action: replace
        regex: ([^:]+)(?::\d+)?;(\d+)
        replacement: $1:$2
        target_label: __address__
      - action: labelmap
        regex: __meta_kubernetes_pod_label_(.+)
      - source_labels: [__meta_kubernetes_namespace]
        action: replace
        target_label: namespace
      - source_labels: [__meta_kubernetes_pod_name]
        action: replace
        target_label: pod_name
---
# Source: istio/charts/security/templates/configmap.yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: istio-security-custom-resources
  namespace: istio-system
  labels:
    app: istio-security
    chart: security-1.0.3
    release: istio
    heritage: Tiller
    istio: security
data:
  custom-resources.yaml: |-    
    # Authentication policy to enable permissive mode for all services (that have sidecar) in the mesh.
    apiVersion: "authentication.istio.io/v1alpha1"
    kind: "MeshPolicy"
    metadata:
      name: "default"
      labels:
        app: istio-security
        chart: security-1.0.3
        release: istio
        heritage: Tiller
    spec:
      peers:
      - mtls:
          mode: PERMISSIVE
  run.sh: |-    
    #!/bin/sh
    
    set -x
    
    if [ "$#" -ne "1" ]; then
        echo "first argument should be path to custom resource yaml"
        exit 1
    fi
    
    pathToResourceYAML=${1}
    
    /kubectl get validatingwebhookconfiguration istio-galley 2>/dev/null
    if [ "$?" -eq 0 ]; then
        echo "istio-galley validatingwebhookconfiguration found - waiting for istio-galley deployment to be ready"
        while true; do
            /kubectl -n istio-system get deployment istio-galley 2>/dev/null
            if [ "$?" -eq 0 ]; then
                break
            fi
            sleep 1
        done
        /kubectl -n istio-system rollout status deployment istio-galley
        if [ "$?" -ne 0 ]; then
            echo "istio-galley deployment rollout status check failed"
            exit 1
        fi
        echo "istio-galley deployment ready for configuration validation"
    fi
    sleep 5
    /kubectl apply -f ${pathToResourceYAML}
---
# Source: istio/templates/configmap.yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: istio
  namespace: istio-system
  labels:
    app: istio
    chart: istio-1.0.3
    release: istio
    heritage: Tiller
data:
  mesh: |-
    # Set the following variable to true to disable policy checks by the Mixer.
    # Note that metrics will still be reported to the Mixer.
    disablePolicyChecks: false

    # Set enableTracing to false to disable request tracing.
    enableTracing: true

    # Set accessLogFile to empty string to disable access log.
    accessLogFile: "/dev/stdout"
    #
    # Deprecated: mixer is using EDS
    mixerCheckServer: istio-policy.istio-system.svc.cluster.local:9091
    mixerReportServer: istio-telemetry.istio-system.svc.cluster.local:9091

    # policyCheckFailOpen allows traffic in cases when the mixer policy service cannot be reached.
    # Default is false which means the traffic is denied when the client is unable to connect to Mixer.
    policyCheckFailOpen: false

    # Unix Domain Socket through which envoy communicates with NodeAgent SDS to get
    # key/cert for mTLS. Use secret-mount files instead of SDS if set to empty. 
    sdsUdsPath: ""
    
    # How frequently should Envoy fetch key/cert from NodeAgent.
    sdsRefreshDelay: 15s

    #
    defaultConfig:
      #
      # TCP connection timeout between Envoy & the application, and between Envoys.
      connectTimeout: 10s
      #
      ### ADVANCED SETTINGS #############
      # Where should envoy's configuration be stored in the istio-proxy container
      configPath: "/etc/istio/proxy"
      binaryPath: "/usr/local/bin/envoy"
      # The pseudo service name used for Envoy.
      serviceCluster: istio-proxy
      # These settings that determine how long an old Envoy
      # process should be kept alive after an occasional reload.
      drainDuration: 45s
      parentShutdownDuration: 1m0s
      #
      # The mode used to redirect inbound connections to Envoy. This setting
      # has no effect on outbound traffic: iptables REDIRECT is always used for
      # outbound connections.
      # If "REDIRECT", use iptables REDIRECT to NAT and redirect to Envoy.
      # The "REDIRECT" mode loses source addresses during redirection.
      # If "TPROXY", use iptables TPROXY to redirect to Envoy.
      # The "TPROXY" mode preserves both the source and destination IP
      # addresses and ports, so that they can be used for advanced filtering
      # and manipulation.
      # The "TPROXY" mode also configures the sidecar to run with the
      # CAP_NET_ADMIN capability, which is required to use TPROXY.
      #interceptionMode: REDIRECT
      #
      # Port where Envoy listens (on local host) for admin commands
      # You can exec into the istio-proxy container in a pod and
      # curl the admin port (curl http://localhost:15000/) to obtain
      # diagnostic information from Envoy. See
      # https://lyft.github.io/envoy/docs/operations/admin.html
      # for more details
      proxyAdminPort: 15000
      #
      # Set concurrency to a specific number to control the number of Proxy worker threads.
      # If set to 0 (default), then start worker thread for each CPU thread/core.
      concurrency: 0
      #
      # Zipkin trace collector
      zipkinAddress: zipkin.istio-system:9411
      #
      # Mutual TLS authentication between sidecars and istio control plane.
      controlPlaneAuthPolicy: NONE
      #
      # Address where istio Pilot service is running
      discoveryAddress: istio-pilot.istio-system:15007
---
# Source: istio/templates/sidecar-injector-configmap.yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: istio-sidecar-injector
  namespace: istio-system
  labels:
    app: istio
    chart: istio-1.0.3
    release: istio
    heritage: Tiller
    istio: sidecar-injector
data:
  config: |-
    policy: enabled
    template: |-
      initContainers:
      - name: istio-init
        image: "docker.io/istio/proxy_init:1.0.3"
        args:
        - "-p"
        - [[ .MeshConfig.ProxyListenPort ]]
        - "-u"
        - 1337
        - "-m"
        - [[ annotation .ObjectMeta `sidecar.istio.io/interceptionMode` .ProxyConfig.InterceptionMode ]]
        - "-i"
        - "[[ annotation .ObjectMeta `traffic.sidecar.istio.io/includeOutboundIPRanges`  "*"  ]]"
        - "-x"
        - "[[ annotation .ObjectMeta `traffic.sidecar.istio.io/excludeOutboundIPRanges`  ""  ]]"
        - "-b"
        - "[[ annotation .ObjectMeta `traffic.sidecar.istio.io/includeInboundPorts` (includeInboundPorts .Spec.Containers) ]]"
        - "-d"
        - "[[ excludeInboundPort (annotation .ObjectMeta `status.sidecar.istio.io/port`  0 ) (annotation .ObjectMeta `traffic.sidecar.istio.io/excludeInboundPorts`  "" ) ]]"
        imagePullPolicy: IfNotPresent
        securityContext:
          capabilities:
            add:
            - NET_ADMIN
          privileged: true
        restartPolicy: Always
      containers:
      - name: istio-proxy
        image: [[ annotation .ObjectMeta `sidecar.istio.io/proxyImage`  "docker.io/istio/proxyv2:1.0.3"  ]]

        ports:
        - containerPort: 15090
          protocol: TCP
          name: http-envoy-prom

        args:
        - proxy
        - sidecar
        - --configPath
        - [[ .ProxyConfig.ConfigPath ]]
        - --binaryPath
        - [[ .ProxyConfig.BinaryPath ]]
        - --serviceCluster
        [[ if ne "" (index .ObjectMeta.Labels "app") -]]
        - [[ index .ObjectMeta.Labels "app" ]]
        [[ else -]]
        - "istio-proxy"
        [[ end -]]
        - --drainDuration
        - [[ formatDuration .ProxyConfig.DrainDuration ]]
        - --parentShutdownDuration
        - [[ formatDuration .ProxyConfig.ParentShutdownDuration ]]
        - --discoveryAddress
        - [[ .ProxyConfig.DiscoveryAddress ]]
        - --discoveryRefreshDelay
        - [[ formatDuration .ProxyConfig.DiscoveryRefreshDelay ]]
        - --zipkinAddress
        - [[ .ProxyConfig.ZipkinAddress ]]
        - --connectTimeout
        - [[ formatDuration .ProxyConfig.ConnectTimeout ]]
        - --proxyAdminPort
        - [[ .ProxyConfig.ProxyAdminPort ]]
        [[ if gt .ProxyConfig.Concurrency 0 -]]
        - --concurrency
        - [[ .ProxyConfig.Concurrency ]]
        [[ end -]]
        - --controlPlaneAuthPolicy
        - [[ annotation .ObjectMeta `sidecar.istio.io/controlPlaneAuthPolicy` .ProxyConfig.ControlPlaneAuthPolicy ]]
      [[- if (ne (annotation .ObjectMeta `status.sidecar.istio.io/port`  0 ) "0") ]]
        - --statusPort
        - [[ annotation .ObjectMeta `status.sidecar.istio.io/port`  0  ]]
        - --applicationPorts
        - "[[ annotation .ObjectMeta `readiness.status.sidecar.istio.io/applicationPorts` (applicationPorts .Spec.Containers) ]]"
      [[- end ]]
        env:
        - name: POD_NAME
          valueFrom:
            fieldRef:
              fieldPath: metadata.name
        - name: POD_NAMESPACE
          valueFrom:
            fieldRef:
              fieldPath: metadata.namespace
        - name: INSTANCE_IP
          valueFrom:
            fieldRef:
              fieldPath: status.podIP
        - name: ISTIO_META_POD_NAME
          valueFrom:
            fieldRef:
              fieldPath: metadata.name
        - name: ISTIO_META_INTERCEPTION_MODE
          value: [[ or (index .ObjectMeta.Annotations "sidecar.istio.io/interceptionMode") .ProxyConfig.InterceptionMode.String ]]
        [[ if .ObjectMeta.Annotations ]]
        - name: ISTIO_METAJSON_ANNOTATIONS
          value: |
                 [[ toJson .ObjectMeta.Annotations ]]
        [[ end ]]
        [[ range $k,$v := .ObjectMeta.Labels ]]
        - name: ISTIO_META_[[ $k ]]
          value: "[[ $v ]]"
        [[ end ]]
        imagePullPolicy: IfNotPresent
        [[ if (ne (annotation .ObjectMeta `status.sidecar.istio.io/port`  0 ) "0") ]]
        readinessProbe:
          httpGet:
            path: /healthz/ready
            port: [[ annotation .ObjectMeta `status.sidecar.istio.io/port`  0  ]]
          initialDelaySeconds: [[ annotation .ObjectMeta `readiness.status.sidecar.istio.io/initialDelaySeconds`  1  ]]
          periodSeconds: [[ annotation .ObjectMeta `readiness.status.sidecar.istio.io/periodSeconds`  2  ]]
          failureThreshold: [[ annotation .ObjectMeta `readiness.status.sidecar.istio.io/failureThreshold`  30  ]]
        [[ end -]]securityContext:
          
          readOnlyRootFilesystem: true
          [[ if eq (annotation .ObjectMeta `sidecar.istio.io/interceptionMode` .ProxyConfig.InterceptionMode) "TPROXY" -]]
          capabilities:
            add:
            - NET_ADMIN
          runAsGroup: 1337
          [[ else -]]
          runAsUser: 1337
          [[ end -]]
        restartPolicy: Always
        resources:
          [[ if (isset .ObjectMeta.Annotations `sidecar.istio.io/proxyCPU`) -]]
          requests:
            cpu: "[[ index .ObjectMeta.Annotations `sidecar.istio.io/proxyCPU` ]]"
            memory: "[[ index .ObjectMeta.Annotations `sidecar.istio.io/proxyMemory` ]]"
        [[ else -]]
          requests:
            cpu: 10m
          
        [[ end -]]
        volumeMounts:
        - mountPath: /etc/istio/proxy
          name: istio-envoy
        - mountPath: /etc/certs/
          name: istio-certs
          readOnly: true
      volumes:
      - emptyDir:
          medium: Memory
        name: istio-envoy
      - name: istio-certs
        secret:
          optional: true
          [[ if eq .Spec.ServiceAccountName "" -]]
          secretName: istio.default
          [[ else -]]
          secretName: [[ printf "istio.%s" .Spec.ServiceAccountName ]]
          [[ end -]]
---
# Source: istio/charts/galley/templates/serviceaccount.yaml
apiVersion: v1
kind: ServiceAccount
metadata:
  name: istio-galley-service-account
  namespace: istio-system
  labels:
    app: istio-galley
    chart: galley-1.0.3
    heritage: Tiller
    release: istio
---
# Source: istio/charts/gateways/templates/serviceaccount.yaml
apiVersion: v1
kind: ServiceAccount
metadata:
  name: istio-egressgateway-service-account
  namespace: istio-system
  labels:
    app: egressgateway
    chart: gateways-1.0.3
    heritage: Tiller
    release: istio
---
# Source: istio/charts/gateways/templates/serviceaccount.yaml
apiVersion: v1
kind: ServiceAccount
metadata:
  name: istio-ingressgateway-service-account
  namespace: istio-system
  labels:
    app: ingressgateway
    chart: gateways-1.0.3
    heritage: Tiller
    release: istio
---
# Source: istio/charts/grafana/templates/create-custom-resources-job.yaml
apiVersion: v1
kind: ServiceAccount
metadata:
  name: istio-grafana-post-install-account
  namespace: istio-system
  labels:
    app: istio-grafana
    chart: grafana-1.0.3
    heritage: Tiller
    release: istio
---
# Source: istio/charts/mixer/templates/serviceaccount.yaml
apiVersion: v1
kind: ServiceAccount
metadata:
  name: istio-mixer-service-account
  namespace: istio-system
  labels:
    app: mixer
    chart: mixer-1.0.3
    heritage: Tiller
    release: istio
---
# Source: istio/charts/pilot/templates/serviceaccount.yaml
apiVersion: v1
kind: ServiceAccount
metadata:
  name: istio-pilot-service-account
  namespace: istio-system
  labels:
    app: istio-pilot
    chart: pilot-1.0.3
    heritage: Tiller
    release: istio
---
# Source: istio/charts/prometheus/templates/serviceaccount.yaml
apiVersion: v1
kind: ServiceAccount
metadata:
  name: prometheus
  namespace: istio-system
---
# Source: istio/charts/security/templates/create-custom-resources-job.yaml
apiVersion: v1
kind: ServiceAccount
metadata:
  name: istio-security-post-install-account
  namespace: istio-system
  labels:
    app: istio-security
    chart: security-1.0.3
    heritage: Tiller
    release: istio
---
# Source: istio/charts/security/templates/serviceaccount.yaml
apiVersion: v1
kind: ServiceAccount
metadata:
  name: istio-citadel-service-account
  namespace: istio-system
  labels:
    app: security
    chart: security-1.0.3
    heritage: Tiller
    release: istio
---
# Source: istio/charts/sidecarInjectorWebhook/templates/serviceaccount.yaml
apiVersion: v1
kind: ServiceAccount
metadata:
  name: istio-sidecar-injector-service-account
  namespace: istio-system
  labels:
    app: istio-sidecar-injector
    chart: sidecarInjectorWebhook-1.0.3
    heritage: Tiller
    release: istio
---
# Source: istio/charts/galley/templates/clusterrole.yaml
apiVersion: rbac.authorization.k8s.io/v1beta1
kind: ClusterRole
metadata:
  name: istio-galley-istio-system
  labels:
    app: istio-galley
    chart: galley-1.0.3
    heritage: Tiller
    release: istio
rules:
- apiGroups: ["admissionregistration.k8s.io"]
  resources: ["validatingwebhookconfigurations"]
  verbs: ["*"]
- apiGroups: ["config.istio.io"] # istio mixer CRD watcher
  resources: ["*"]
  verbs: ["get", "list", "watch"]
- apiGroups: ["*"]
  resources: ["deployments"]
  resourceNames: ["istio-galley"]
  verbs: ["get"]
- apiGroups: ["*"]
  resources: ["endpoints"]
  resourceNames: ["istio-galley"]
  verbs: ["get"]
---
# Source: istio/charts/gateways/templates/clusterrole.yaml
apiVersion: rbac.authorization.k8s.io/v1beta1
kind: ClusterRole
metadata:
  labels:
    app: gateways
    chart: gateways-1.0.3
    heritage: Tiller
    release: istio
  name: istio-egressgateway-istio-system
rules:
- apiGroups: ["extensions"]
  resources: ["thirdpartyresources", "virtualservices", "destinationrules", "gateways"]
  verbs: ["get", "watch", "list", "update"]
---
# Source: istio/charts/gateways/templates/clusterrole.yaml
apiVersion: rbac.authorization.k8s.io/v1beta1
kind: ClusterRole
metadata:
  labels:
    app: gateways
    chart: gateways-1.0.3
    heritage: Tiller
    release: istio
  name: istio-ingressgateway-istio-system
rules:
- apiGroups: ["extensions"]
  resources: ["thirdpartyresources", "virtualservices", "destinationrules", "gateways"]
  verbs: ["get", "watch", "list", "update"]
---
# Source: istio/charts/grafana/templates/create-custom-resources-job.yaml
apiVersion: rbac.authorization.k8s.io/v1beta1
kind: ClusterRole
metadata:
  name: istio-grafana-post-install-istio-system
  labels:
    app: istio-grafana
    chart: grafana-1.0.3
    heritage: Tiller
    release: istio
rules:
- apiGroups: ["authentication.istio.io"] # needed to create default authn policy
  resources: ["*"]
  verbs: ["*"]
---
# Source: istio/charts/mixer/templates/clusterrole.yaml
apiVersion: rbac.authorization.k8s.io/v1beta1
kind: ClusterRole
metadata:
  name: istio-mixer-istio-system
  labels:
    app: mixer
    chart: mixer-1.0.3
    heritage: Tiller
    release: istio
rules:
- apiGroups: ["config.istio.io"] # istio CRD watcher
  resources: ["*"]
  verbs: ["create", "get", "list", "watch", "patch"]
- apiGroups: ["rbac.istio.io"] # istio RBAC watcher
  resources: ["*"]
  verbs: ["get", "list", "watch"]
- apiGroups: ["apiextensions.k8s.io"]
  resources: ["customresourcedefinitions"]
  verbs: ["get", "list", "watch"]
- apiGroups: [""]
  resources: ["configmaps", "endpoints", "pods", "services", "namespaces", "secrets", "replicationcontrollers"]
  verbs: ["get", "list", "watch"]
- apiGroups: ["extensions"]
  resources: ["replicasets"]
  verbs: ["get", "list", "watch"]
- apiGroups: ["apps"]
  resources: ["replicasets"]
  verbs: ["get", "list", "watch"]
---
# Source: istio/charts/pilot/templates/clusterrole.yaml
apiVersion: rbac.authorization.k8s.io/v1beta1
kind: ClusterRole
metadata:
  name: istio-pilot-istio-system
  labels:
    app: istio-pilot
    chart: pilot-1.0.3
    heritage: Tiller
    release: istio
rules:
- apiGroups: ["config.istio.io"]
  resources: ["*"]
  verbs: ["*"]
- apiGroups: ["rbac.istio.io"]
  resources: ["*"]
  verbs: ["get", "watch", "list"]
- apiGroups: ["networking.istio.io"]
  resources: ["*"]
  verbs: ["*"]
- apiGroups: ["authentication.istio.io"]
  resources: ["*"]
  verbs: ["*"]
- apiGroups: ["apiextensions.k8s.io"]
  resources: ["customresourcedefinitions"]
  verbs: ["*"]
- apiGroups: ["extensions"]
  resources: ["thirdpartyresources", "thirdpartyresources.extensions", "ingresses", "ingresses/status"]
  verbs: ["*"]
- apiGroups: [""]
  resources: ["configmaps"]
  verbs: ["create", "get", "list", "watch", "update"]
- apiGroups: [""]
  resources: ["endpoints", "pods", "services"]
  verbs: ["get", "list", "watch"]
- apiGroups: [""]
  resources: ["namespaces", "nodes", "secrets"]
  verbs: ["get", "list", "watch"]
---
# Source: istio/charts/prometheus/templates/clusterrole.yaml
apiVersion: rbac.authorization.k8s.io/v1beta1
kind: ClusterRole
metadata:
  name: prometheus-istio-system
rules:
- apiGroups: [""]
  resources:
  - nodes
  - services
  - endpoints
  - pods
  - nodes/proxy
  verbs: ["get", "list", "watch"]
- apiGroups: [""]
  resources:
  - configmaps
  verbs: ["get"]
- nonResourceURLs: ["/metrics"]
  verbs: ["get"]
---
# Source: istio/charts/security/templates/clusterrole.yaml
apiVersion: rbac.authorization.k8s.io/v1beta1
kind: ClusterRole
metadata:
  name: istio-citadel-istio-system
  labels:
    app: security
    chart: security-1.0.3
    heritage: Tiller
    release: istio
rules:
- apiGroups: [""]
  resources: ["secrets"]
  verbs: ["create", "get", "watch", "list", "update", "delete"]
- apiGroups: [""]
  resources: ["serviceaccounts"]
  verbs: ["get", "watch", "list"]
- apiGroups: [""]
  resources: ["services"]
  verbs: ["get", "watch", "list"]
---
# Source: istio/charts/security/templates/create-custom-resources-job.yaml
apiVersion: rbac.authorization.k8s.io/v1beta1
kind: ClusterRole
metadata:
  name: istio-security-post-install-istio-system
  labels:
    app: istio-security
    chart: security-1.0.3
    heritage: Tiller
    release: istio
rules:
- apiGroups: ["authentication.istio.io"] # needed to create default authn policy
  resources: ["*"]
  verbs: ["*"]
- apiGroups: ["networking.istio.io"] # needed to create security destination rules
  resources: ["*"]
  verbs: ["*"]
- apiGroups: ["admissionregistration.k8s.io"]
  resources: ["validatingwebhookconfigurations"]
  verbs: ["get"]
- apiGroups: ["extensions"]
  resources: ["deployments", "replicasets"]
  verbs: ["get", "list", "watch"]
---
# Source: istio/charts/sidecarInjectorWebhook/templates/clusterrole.yaml
apiVersion: rbac.authorization.k8s.io/v1beta1
kind: ClusterRole
metadata:
  name: istio-sidecar-injector-istio-system
  labels:
    app: istio-sidecar-injector
    chart: sidecarInjectorWebhook-1.0.3
    heritage: Tiller
    release: istio
rules:
- apiGroups: ["*"]
  resources: ["configmaps"]
  verbs: ["get", "list", "watch"]
- apiGroups: ["admissionregistration.k8s.io"]
  resources: ["mutatingwebhookconfigurations"]
  verbs: ["get", "list", "watch", "patch"]
---
# Source: istio/charts/galley/templates/clusterrolebinding.yaml
apiVersion: rbac.authorization.k8s.io/v1beta1
kind: ClusterRoleBinding
metadata:
  name: istio-galley-admin-role-binding-istio-system
  labels:
    app: istio-galley
    chart: galley-1.0.3
    heritage: Tiller
    release: istio
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: istio-galley-istio-system
subjects:
  - kind: ServiceAccount
    name: istio-galley-service-account
    namespace: istio-system
---
# Source: istio/charts/gateways/templates/clusterrolebindings.yaml
apiVersion: rbac.authorization.k8s.io/v1beta1
kind: ClusterRoleBinding
metadata:
  name: istio-egressgateway-istio-system
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: istio-egressgateway-istio-system
subjects:
  - kind: ServiceAccount
    name: istio-egressgateway-service-account
    namespace: istio-system
---
# Source: istio/charts/gateways/templates/clusterrolebindings.yaml
apiVersion: rbac.authorization.k8s.io/v1beta1
kind: ClusterRoleBinding
metadata:
  name: istio-ingressgateway-istio-system
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: istio-ingressgateway-istio-system
subjects:
  - kind: ServiceAccount
    name: istio-ingressgateway-service-account
    namespace: istio-system
---
# Source: istio/charts/grafana/templates/create-custom-resources-job.yaml
apiVersion: rbac.authorization.k8s.io/v1beta1
kind: ClusterRoleBinding
metadata:
  name: istio-grafana-post-install-role-binding-istio-system
  labels:
    app: istio-grafana
    chart: grafana-1.0.3
    heritage: Tiller
    release: istio
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: istio-grafana-post-install-istio-system
subjects:
  - kind: ServiceAccount
    name: istio-grafana-post-install-account
    namespace: istio-system
---
# Source: istio/charts/mixer/templates/clusterrolebinding.yaml
apiVersion: rbac.authorization.k8s.io/v1beta1
kind: ClusterRoleBinding
metadata:
  name: istio-mixer-admin-role-binding-istio-system
  labels:
    app: mixer
    chart: mixer-1.0.3
    heritage: Tiller
    release: istio
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: istio-mixer-istio-system
subjects:
  - kind: ServiceAccount
    name: istio-mixer-service-account
    namespace: istio-system
---
# Source: istio/charts/pilot/templates/clusterrolebinding.yaml
apiVersion: rbac.authorization.k8s.io/v1beta1
kind: ClusterRoleBinding
metadata:
  name: istio-pilot-istio-system
  labels:
    app: istio-pilot
    chart: pilot-1.0.3
    heritage: Tiller
    release: istio
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: istio-pilot-istio-system
subjects:
  - kind: ServiceAccount
    name: istio-pilot-service-account
    namespace: istio-system
---
# Source: istio/charts/prometheus/templates/clusterrolebindings.yaml
apiVersion: rbac.authorization.k8s.io/v1beta1
kind: ClusterRoleBinding
metadata:
  name: prometheus-istio-system
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: prometheus-istio-system
subjects:
- kind: ServiceAccount
  name: prometheus
  namespace: istio-system
---
# Source: istio/charts/security/templates/clusterrolebinding.yaml
apiVersion: rbac.authorization.k8s.io/v1beta1
kind: ClusterRoleBinding
metadata:
  name: istio-citadel-istio-system
  labels:
    app: security
    chart: security-1.0.3
    heritage: Tiller
    release: istio
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: istio-citadel-istio-system
subjects:
  - kind: ServiceAccount
    name: istio-citadel-service-account
    namespace: istio-system
---
# Source: istio/charts/security/templates/create-custom-resources-job.yaml
apiVersion: rbac.authorization.k8s.io/v1beta1
kind: ClusterRoleBinding
metadata:
  name: istio-security-post-install-role-binding-istio-system
  labels:
    app: istio-security
    chart: security-1.0.3
    heritage: Tiller
    release: istio
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: istio-security-post-install-istio-system
subjects:
  - kind: ServiceAccount
    name: istio-security-post-install-account
    namespace: istio-system
---
# Source: istio/charts/sidecarInjectorWebhook/templates/clusterrolebinding.yaml
apiVersion: rbac.authorization.k8s.io/v1beta1
kind: ClusterRoleBinding
metadata:
  name: istio-sidecar-injector-admin-role-binding-istio-system
  labels:
    app: istio-sidecar-injector
    chart: sidecarInjectorWebhook-1.0.3
    heritage: Tiller
    release: istio
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: istio-sidecar-injector-istio-system
subjects:
  - kind: ServiceAccount
    name: istio-sidecar-injector-service-account
    namespace: istio-system
---
# Source: istio/charts/galley/templates/service.yaml
apiVersion: v1
kind: Service
metadata:
  name: istio-galley
  namespace: istio-system
  labels:
    istio: galley
spec:
  ports:
  - port: 443
    name: https-validation
  - port: 9093
    name: http-monitoring
  selector:
    istio: galley
---
# Source: istio/charts/gateways/templates/service.yaml
apiVersion: v1
kind: Service
metadata:
  name: istio-ingressgateway
  namespace: istio-system
  annotations:
     service.beta.kubernetes.io/aws-load-balancer-type: "nlb"
#
  labels:
    chart: gateways-1.0.3
    release: istio
    heritage: Tiller
    app: istio-ingressgateway
    istio: ingressgateway
spec:
  type: LoadBalancer
  selector:
    app: istio-ingressgateway
    istio: ingressgateway
  ports:
    -
      name: http2
      nodePort: 31380
      port: 80
      targetPort: 80
    -
      name: https
      nodePort: 31390
      port: 443
    -
      name: tcp
      nodePort: 31400
      port: 31400
    -
      name: tcp-pilot-grpc-tls
      port: 15011
      targetPort: 15011
    -
      name: tcp-citadel-grpc-tls
      port: 8060
      targetPort: 8060
    -
      name: tcp-dns-tls
      port: 853
      targetPort: 853
    -
      name: http2-prometheus
      port: 15030
      targetPort: 15030
    -
      name: http2-grafana
      port: 15031
      targetPort: 15031
---
# Source: istio/charts/gateways/templates/service.yaml
apiVersion: v1
kind: Service
metadata:
  name: istio-egressgateway
  namespace: istio-system
  annotations:
     service.beta.kubernetes.io/aws-load-balancer-type: "nlb"
#
  labels:
    chart: gateways-1.0.3
    release: istio
    heritage: Tiller
    app: istio-egressgateway
    istio: egressgateway
spec:
  type: ClusterIP
  selector:
    app: istio-egressgateway
    istio: egressgateway
  ports:
    -
      name: http2
      port: 80
    -
      name: https
      port: 443
---
# Source: istio/charts/grafana/templates/service.yaml
apiVersion: v1
kind: Service
metadata:
  name: grafana
  namespace: istio-system
  annotations:
  labels:
    app: istio-grafana
    chart: grafana-1.0.3
    release: istio
    heritage: Tiller
spec:
  type: ClusterIP
  ports:
    - port: 3000
      targetPort: 3000
      protocol: TCP
      name: http
  selector:
    app: grafana
---
# Source: istio/charts/mixer/templates/service.yaml
apiVersion: v1
kind: Service
metadata:
  name: istio-policy
  namespace: istio-system
  labels:
    chart: mixer-1.0.3
    release: istio
    istio: mixer
spec:
  ports:
  - name: grpc-mixer
    port: 9091
  - name: grpc-mixer-mtls
    port: 15004
  - name: http-monitoring
    port: 9093
  selector:
    istio: mixer
    istio-mixer-type: policy
---
# Source: istio/charts/mixer/templates/service.yaml
apiVersion: v1
kind: Service
metadata:
  name: istio-telemetry
  namespace: istio-system
  labels:
    chart: mixer-1.0.3
    release: istio
    istio: mixer
spec:
  ports:
  - name: grpc-mixer
    port: 9091
  - name: grpc-mixer-mtls
    port: 15004
  - name: http-monitoring
    port: 9093
  - name: prometheus
    port: 42422
  selector:
    istio: mixer
    istio-mixer-type: telemetry
---
# Source: istio/charts/pilot/templates/service.yaml
apiVersion: v1
kind: Service
metadata:
  name: istio-pilot
  namespace: istio-system
  labels:
    app: istio-pilot
    chart: pilot-1.0.3
    release: istio
    heritage: Tiller
spec:
  ports:
  - port: 15010
    name: grpc-xds # direct
  - port: 15011
    name: https-xds # mTLS
  - port: 8080
    name: http-legacy-discovery # direct
  - port: 9093
    name: http-monitoring
  selector:
    istio: pilot
---
# Source: istio/charts/prometheus/templates/service.yaml
apiVersion: v1
kind: Service
metadata:
  name: prometheus
  namespace: istio-system
  annotations:
    prometheus.io/scrape: 'true'
  labels:
    name: prometheus
spec:
  selector:
    app: prometheus
  ports:
  - name: http-prometheus
    protocol: TCP
    port: 9090
---
# Source: istio/charts/security/templates/service.yaml
apiVersion: v1
kind: Service
metadata:
  # we use the normal name here (e.g. 'prometheus')
  # as grafana is configured to use this as a data source
  name: istio-citadel
  namespace: istio-system
  labels:
    app: istio-citadel
spec:
  ports:
    - name: grpc-citadel
      port: 8060
      targetPort: 8060
      protocol: TCP
    - name: http-monitoring
      port: 9093
  selector:
    istio: citadel
---
# Source: istio/charts/servicegraph/templates/service.yaml
apiVersion: v1
kind: Service
metadata:
  name: servicegraph
  namespace: istio-system
  annotations:
  labels:
    app: servicegraph
    chart: servicegraph-1.0.3
    release: istio
    heritage: Tiller
spec:
  type: ClusterIP
  ports:
    - port: 8088
      targetPort: 8088
      protocol: TCP
      name: http
  selector:
    app: servicegraph
---
# Source: istio/charts/sidecarInjectorWebhook/templates/service.yaml
apiVersion: v1
kind: Service
metadata:
  name: istio-sidecar-injector
  namespace: istio-system
  labels:
    istio: sidecar-injector
spec:
  ports:
  - port: 443
  selector:
    istio: sidecar-injector
---
# Source: istio/charts/galley/templates/deployment.yaml
apiVersion: extensions/v1beta1
kind: Deployment
metadata:
  name: istio-galley
  namespace: istio-system
  labels:
    app: galley
    chart: galley-1.0.3
    release: istio
    heritage: Tiller
    istio: galley
spec:
  replicas: 1
  strategy:
    rollingUpdate:
      maxSurge: 1
      maxUnavailable: 0
  template:
    metadata:
      labels:
        istio: galley
      annotations:
        sidecar.istio.io/inject: "false"
        scheduler.alpha.kubernetes.io/critical-pod: ""
    spec:
      serviceAccountName: istio-galley-service-account
      containers:
        - name: validator
          image: "docker.io/istio/galley:1.0.3"
          imagePullPolicy: IfNotPresent
          ports:
          - containerPort: 443
          - containerPort: 9093
          command:
          - /usr/local/bin/galley
          - validator
          - --deployment-namespace=istio-system
          - --caCertFile=/etc/istio/certs/root-cert.pem
          - --tlsCertFile=/etc/istio/certs/cert-chain.pem
          - --tlsKeyFile=/etc/istio/certs/key.pem
          - --healthCheckInterval=1s
          - --healthCheckFile=/health
          - --webhook-config-file
          - /etc/istio/config/validatingwebhookconfiguration.yaml
          volumeMounts:
          - name: certs
            mountPath: /etc/istio/certs
            readOnly: true
          - name: config
            mountPath: /etc/istio/config
            readOnly: true
          livenessProbe:
            exec:
              command:
                - /usr/local/bin/galley
                - probe
                - --probe-path=/health
                - --interval=10s
            initialDelaySeconds: 5
            periodSeconds: 5
          readinessProbe:
            exec:
              command:
                - /usr/local/bin/galley
                - probe
                - --probe-path=/health
                - --interval=10s
            initialDelaySeconds: 5
            periodSeconds: 5
          resources:
            requests:
              cpu: 10m
            
      volumes:
      - name: certs
        secret:
          secretName: istio.istio-galley-service-account
      - name: config
        configMap:
          name: istio-galley-configuration
      affinity:      
        nodeAffinity:
          requiredDuringSchedulingIgnoredDuringExecution:
            nodeSelectorTerms:
            - matchExpressions:
              - key: beta.kubernetes.io/arch
                operator: In
                values:
                - amd64
                - ppc64le
                - s390x
          preferredDuringSchedulingIgnoredDuringExecution:
          - weight: 2
            preference:
              matchExpressions:
              - key: beta.kubernetes.io/arch
                operator: In
                values:
                - amd64
          - weight: 2
            preference:
              matchExpressions:
              - key: beta.kubernetes.io/arch
                operator: In
                values:
                - ppc64le
          - weight: 2
            preference:
              matchExpressions:
              - key: beta.kubernetes.io/arch
                operator: In
                values:
                - s390x
---
# Source: istio/charts/gateways/templates/deployment.yaml
apiVersion: extensions/v1beta1
kind: Deployment
metadata:
  name: istio-ingressgateway
  namespace: istio-system
  labels:
    chart: gateways-1.0.3
    release: istio
    heritage: Tiller
    app: istio-ingressgateway
    istio: ingressgateway
spec:
  replicas: 1
  template:
    metadata:
      labels:
        app: istio-ingressgateway
        istio: ingressgateway
      annotations:
        sidecar.istio.io/inject: "false"
        scheduler.alpha.kubernetes.io/critical-pod: ""
    spec:
      serviceAccountName: istio-ingressgateway-service-account
      containers:
        - name: istio-proxy
          image: "docker.io/istio/proxyv2:1.0.3"
          imagePullPolicy: IfNotPresent
          ports:
            - containerPort: 80
            - containerPort: 443
            - containerPort: 31400
            - containerPort: 15011
            - containerPort: 8060
            - containerPort: 853
            - containerPort: 15030
            - containerPort: 15031

            - containerPort: 15090
              protocol: TCP
              name: http-envoy-prom

          args:
          - proxy
          - router
          - -v
          - "2"
          - --discoveryRefreshDelay
          - '1s' #discoveryRefreshDelay
          - --drainDuration
          - '45s' #drainDuration
          - --parentShutdownDuration
          - '1m0s' #parentShutdownDuration
          - --connectTimeout
          - '10s' #connectTimeout
          - --serviceCluster
          - istio-ingressgateway
          - --zipkinAddress
          - zipkin:9411
          - --proxyAdminPort
          - "15000"
          - --controlPlaneAuthPolicy
          - NONE
          - --discoveryAddress
          - istio-pilot:8080
          resources:
            requests:
              cpu: 10m
            
          env:
          - name: POD_NAME
            valueFrom:
              fieldRef:
                apiVersion: v1
                fieldPath: metadata.name
          - name: POD_NAMESPACE
            valueFrom:
              fieldRef:
                apiVersion: v1
                fieldPath: metadata.namespace
          - name: INSTANCE_IP
            valueFrom:
              fieldRef:
                apiVersion: v1
                fieldPath: status.podIP
          - name: ISTIO_META_POD_NAME
            valueFrom:
              fieldRef:
                fieldPath: metadata.name
          volumeMounts:
          - name: istio-certs
            mountPath: /etc/certs
            readOnly: true
          - name: ingressgateway-certs
            mountPath: "/etc/istio/ingressgateway-certs"
            readOnly: true
          - name: ingressgateway-ca-certs
            mountPath: "/etc/istio/ingressgateway-ca-certs"
            readOnly: true
      volumes:
      - name: istio-certs
        secret:
          secretName: istio.istio-ingressgateway-service-account
          optional: true
      - name: ingressgateway-certs
        secret:
          secretName: "istio-ingressgateway-certs"
          optional: true
      - name: ingressgateway-ca-certs
        secret:
          secretName: "istio-ingressgateway-ca-certs"
          optional: true
      affinity:      
        nodeAffinity:
          requiredDuringSchedulingIgnoredDuringExecution:
            nodeSelectorTerms:
            - matchExpressions:
              - key: beta.kubernetes.io/arch
                operator: In
                values:
                - amd64
                - ppc64le
                - s390x
          preferredDuringSchedulingIgnoredDuringExecution:
          - weight: 2
            preference:
              matchExpressions:
              - key: beta.kubernetes.io/arch
                operator: In
                values:
                - amd64
          - weight: 2
            preference:
              matchExpressions:
              - key: beta.kubernetes.io/arch
                operator: In
                values:
                - ppc64le
          - weight: 2
            preference:
              matchExpressions:
              - key: beta.kubernetes.io/arch
                operator: In
                values:
                - s390x
---
# Source: istio/charts/gateways/templates/deployment.yaml
apiVersion: extensions/v1beta1
kind: Deployment
metadata:
  name: istio-egressgateway
  namespace: istio-system
  labels:
    chart: gateways-1.0.3
    release: istio
    heritage: Tiller
    app: istio-egressgateway
    istio: egressgateway
spec:
  replicas: 1
  template:
    metadata:
      labels:
        app: istio-egressgateway
        istio: egressgateway
      annotations:
        sidecar.istio.io/inject: "false"
        scheduler.alpha.kubernetes.io/critical-pod: ""
    spec:
      serviceAccountName: istio-egressgateway-service-account
      containers:
        - name: istio-proxy
          image: "docker.io/istio/proxyv2:1.0.3"
          imagePullPolicy: IfNotPresent
          ports:
            - containerPort: 80
            - containerPort: 443

            - containerPort: 15090
              protocol: TCP
              name: http-envoy-prom

          args:
          - proxy
          - router
          - -v
          - "2"
          - --discoveryRefreshDelay
          - '1s' #discoveryRefreshDelay
          - --drainDuration
          - '45s' #drainDuration
          - --parentShutdownDuration
          - '1m0s' #parentShutdownDuration
          - --connectTimeout
          - '10s' #connectTimeout
          - --serviceCluster
          - istio-egressgateway
          - --zipkinAddress
          - zipkin:9411
          - --proxyAdminPort
          - "15000"
          - --controlPlaneAuthPolicy
          - NONE
          - --discoveryAddress
          - istio-pilot:8080
          resources:
            requests:
              cpu: 10m
            
          env:
          - name: POD_NAME
            valueFrom:
              fieldRef:
                apiVersion: v1
                fieldPath: metadata.name
          - name: POD_NAMESPACE
            valueFrom:
              fieldRef:
                apiVersion: v1
                fieldPath: metadata.namespace
          - name: INSTANCE_IP
            valueFrom:
              fieldRef:
                apiVersion: v1
                fieldPath: status.podIP
          - name: ISTIO_META_POD_NAME
            valueFrom:
              fieldRef:
                fieldPath: metadata.name
          volumeMounts:
          - name: istio-certs
            mountPath: /etc/certs
            readOnly: true
          - name: egressgateway-certs
            mountPath: "/etc/istio/egressgateway-certs"
            readOnly: true
          - name: egressgateway-ca-certs
            mountPath: "/etc/istio/egressgateway-ca-certs"
            readOnly: true
      volumes:
      - name: istio-certs
        secret:
          secretName: istio.istio-egressgateway-service-account
          optional: true
      - name: egressgateway-certs
        secret:
          secretName: "istio-egressgateway-certs"
          optional: true
      - name: egressgateway-ca-certs
        secret:
          secretName: "istio-egressgateway-ca-certs"
          optional: true
      affinity:      
        nodeAffinity:
          requiredDuringSchedulingIgnoredDuringExecution:
            nodeSelectorTerms:
            - matchExpressions:
              - key: beta.kubernetes.io/arch
                operator: In
                values:
                - amd64
                - ppc64le
                - s390x
          preferredDuringSchedulingIgnoredDuringExecution:
          - weight: 2
            preference:
              matchExpressions:
              - key: beta.kubernetes.io/arch
                operator: In
                values:
                - amd64
          - weight: 2
            preference:
              matchExpressions:
              - key: beta.kubernetes.io/arch
                operator: In
                values:
                - ppc64le
          - weight: 2
            preference:
              matchExpressions:
              - key: beta.kubernetes.io/arch
                operator: In
                values:
                - s390x
---
# Source: istio/charts/grafana/templates/deployment.yaml
apiVersion: extensions/v1beta1
kind: Deployment
metadata:
  name: grafana
  namespace: istio-system
  labels:
    app: istio-grafana
    chart: grafana-1.0.3
    release: istio
    heritage: Tiller
spec:
  replicas: 1
  template:
    metadata:
      labels:
        app: grafana
      annotations:
        sidecar.istio.io/inject: "false"
        scheduler.alpha.kubernetes.io/critical-pod: ""
    spec:
      containers:
        - name: grafana
          image: "grafana/grafana:5.2.3"
          imagePullPolicy: IfNotPresent
          ports:
            - containerPort: 3000
          readinessProbe:
            httpGet:
              path: /login
              port: 3000
          env:
          - name: GRAFANA_PORT
            value: "3000"
          - name: GF_AUTH_BASIC_ENABLED
            value: "false"
          - name: GF_AUTH_ANONYMOUS_ENABLED
            value: "true"
          - name: GF_AUTH_ANONYMOUS_ORG_ROLE
            value: Admin
          - name: GF_PATHS_DATA
            value: /data/grafana
          resources:
            requests:
              cpu: 10m
            
          volumeMounts:
          - name: data
            mountPath: /data/grafana
          - name: dashboards-istio
            mountPath: "/var/lib/grafana/dashboards/istio"
          - name: config
            mountPath: "/etc/grafana/provisioning/datasources/datasources.yaml"
            subPath: datasources.yaml
          - name: config
            mountPath: "/etc/grafana/provisioning/dashboards/dashboardproviders.yaml"
            subPath: dashboardproviders.yaml
      affinity:      
        nodeAffinity:
          requiredDuringSchedulingIgnoredDuringExecution:
            nodeSelectorTerms:
            - matchExpressions:
              - key: beta.kubernetes.io/arch
                operator: In
                values:
                - amd64
                - ppc64le
                - s390x
          preferredDuringSchedulingIgnoredDuringExecution:
          - weight: 2
            preference:
              matchExpressions:
              - key: beta.kubernetes.io/arch
                operator: In
                values:
                - amd64
          - weight: 2
            preference:
              matchExpressions:
              - key: beta.kubernetes.io/arch
                operator: In
                values:
                - ppc64le
          - weight: 2
            preference:
              matchExpressions:
              - key: beta.kubernetes.io/arch
                operator: In
                values:
                - s390x
      volumes:
      - name: config
        configMap:
          name: istio-grafana
      - name: data
        emptyDir: {}
      - name: dashboards-istio
        configMap:
          name:  istio-grafana-configuration-dashboards
---
# Source: istio/charts/mixer/templates/deployment.yaml
apiVersion: extensions/v1beta1
kind: Deployment
metadata:
  name: istio-telemetry
  namespace: istio-system
  labels:
    chart: mixer-1.0.3
    release: istio
    istio: mixer
spec:
  replicas: 1
  template:
    metadata:
      labels:
        app: telemetry
        istio: mixer
        istio-mixer-type: telemetry
      annotations:
        sidecar.istio.io/inject: "false"
        scheduler.alpha.kubernetes.io/critical-pod: ""
    spec:
      serviceAccountName: istio-mixer-service-account
      volumes:
      - name: istio-certs
        secret:
          secretName: istio.istio-mixer-service-account
          optional: true
      - name: uds-socket
        emptyDir: {}
      containers:
      - name: mixer
        image: "docker.io/istio/mixer:1.0.3"
        imagePullPolicy: IfNotPresent
        ports:
        - containerPort: 9093
        - containerPort: 42422
        args:
          - --address
          - unix:///sock/mixer.socket
          - --configStoreURL=k8s://
          - --configDefaultNamespace=istio-system
          - --trace_zipkin_url=http://zipkin:9411/api/v1/spans
        env:
        - name: GODEBUG
          value: "gctrace=2"
        resources:
          requests:
            cpu: 10m
          
        volumeMounts:
        - name: uds-socket
          mountPath: /sock
        livenessProbe:
          httpGet:
            path: /version
            port: 9093
          initialDelaySeconds: 5
          periodSeconds: 5
      - name: istio-proxy
        image: "docker.io/istio/proxyv2:1.0.3"
        imagePullPolicy: IfNotPresent
        ports:
        - containerPort: 9091
        - containerPort: 15004

        ports:
        - containerPort: 15090
          protocol: TCP
          name: http-envoy-prom

        args:
        - proxy
        - --serviceCluster
        - istio-telemetry
        - --templateFile
        - /etc/istio/proxy/envoy_telemetry.yaml.tmpl
        - --controlPlaneAuthPolicy
        - NONE
        env:
        - name: POD_NAME
          valueFrom:
            fieldRef:
              apiVersion: v1
              fieldPath: metadata.name
        - name: POD_NAMESPACE
          valueFrom:
            fieldRef:
              apiVersion: v1
              fieldPath: metadata.namespace
        - name: INSTANCE_IP
          valueFrom:
            fieldRef:
              apiVersion: v1
              fieldPath: status.podIP
        resources:
          requests:
            cpu: 10m
          
        volumeMounts:
        - name: istio-certs
          mountPath: /etc/certs
          readOnly: true
        - name: uds-socket
          mountPath: /sock
---
# Source: istio/charts/mixer/templates/deployment.yaml
apiVersion: extensions/v1beta1
kind: Deployment
metadata:
  name: istio-policy
  namespace: istio-system
  labels:
    chart: mixer-1.0.3
    release: istio
    istio: mixer
spec:
  replicas: 1
  template:
    metadata:
      labels:
        app: policy
        istio: mixer
        istio-mixer-type: policy
      annotations:
        sidecar.istio.io/inject: "false"
        scheduler.alpha.kubernetes.io/critical-pod: ""
    spec:
      serviceAccountName: istio-mixer-service-account
      volumes:
      - name: istio-certs
        secret:
          secretName: istio.istio-mixer-service-account
          optional: true
      - name: uds-socket
        emptyDir: {}
      affinity:      
        nodeAffinity:
          requiredDuringSchedulingIgnoredDuringExecution:
            nodeSelectorTerms:
            - matchExpressions:
              - key: beta.kubernetes.io/arch
                operator: In
                values:
                - amd64
                - ppc64le
                - s390x
          preferredDuringSchedulingIgnoredDuringExecution:
          - weight: 2
            preference:
              matchExpressions:
              - key: beta.kubernetes.io/arch
                operator: In
                values:
                - amd64
          - weight: 2
            preference:
              matchExpressions:
              - key: beta.kubernetes.io/arch
                operator: In
                values:
                - ppc64le
          - weight: 2
            preference:
              matchExpressions:
              - key: beta.kubernetes.io/arch
                operator: In
                values:
                - s390x
      containers:
      - name: mixer
        image: "docker.io/istio/mixer:1.0.3"
        imagePullPolicy: IfNotPresent
        ports:
        - containerPort: 9093
        - containerPort: 42422
        args:
          - --address
          - unix:///sock/mixer.socket
          - --configStoreURL=k8s://
          - --configDefaultNamespace=istio-system
          - --trace_zipkin_url=http://zipkin:9411/api/v1/spans
        env:
        - name: GODEBUG
          value: "gctrace=2"
        resources:
          requests:
            cpu: 10m
          
        volumeMounts:
        - name: uds-socket
          mountPath: /sock
        livenessProbe:
          httpGet:
            path: /version
            port: 9093
          initialDelaySeconds: 5
          periodSeconds: 5
      - name: istio-proxy
        image: "docker.io/istio/proxyv2:1.0.3"
        imagePullPolicy: IfNotPresent
        ports:
        - containerPort: 9091
        - containerPort: 15004

        ports:
        - containerPort: 15090
          protocol: TCP
          name: http-envoy-prom

        args:
        - proxy
        - --serviceCluster
        - istio-policy
        - --templateFile
        - /etc/istio/proxy/envoy_policy.yaml.tmpl
        - --controlPlaneAuthPolicy
        - NONE
        env:
        - name: POD_NAME
          valueFrom:
            fieldRef:
              apiVersion: v1
              fieldPath: metadata.name
        - name: POD_NAMESPACE
          valueFrom:
            fieldRef:
              apiVersion: v1
              fieldPath: metadata.namespace
        - name: INSTANCE_IP
          valueFrom:
            fieldRef:
              apiVersion: v1
              fieldPath: status.podIP
        resources:
          requests:
            cpu: 10m
          
        volumeMounts:
        - name: istio-certs
          mountPath: /etc/certs
          readOnly: true
        - name: uds-socket
          mountPath: /sock
---
# Source: istio/charts/pilot/templates/deployment.yaml
apiVersion: extensions/v1beta1
kind: Deployment
metadata:
  name: istio-pilot
  namespace: istio-system
  # TODO: default template doesn't have this, which one is right ?
  labels:
    app: istio-pilot
    chart: pilot-1.0.3
    release: istio
    heritage: Tiller
    istio: pilot
  annotations:
    checksum/config-volume: f8da08b6b8c170dde721efd680270b2901e750d4aa186ebb6c22bef5b78a43f9
spec:
  replicas: 1
  template:
    metadata:
      labels:
        istio: pilot
        app: pilot
      annotations:
        sidecar.istio.io/inject: "false"
        scheduler.alpha.kubernetes.io/critical-pod: ""
    spec:
      serviceAccountName: istio-pilot-service-account
      containers:
        - name: discovery
          image: "docker.io/istio/pilot:1.0.3"
          imagePullPolicy: IfNotPresent
          args:
          - "discovery"
          ports:
          - containerPort: 8080
          - containerPort: 15010
          readinessProbe:
            httpGet:
              path: /ready
              port: 8080
            initialDelaySeconds: 5
            periodSeconds: 30
            timeoutSeconds: 5
          env:
          - name: POD_NAME
            valueFrom:
              fieldRef:
                apiVersion: v1
                fieldPath: metadata.name
          - name: POD_NAMESPACE
            valueFrom:
              fieldRef:
                apiVersion: v1
                fieldPath: metadata.namespace
          - name: PILOT_CACHE_SQUASH
            value: "5"
          - name: GODEBUG
            value: "gctrace=2"
          - name: PILOT_PUSH_THROTTLE_COUNT
            value: "100"
          - name: PILOT_TRACE_SAMPLING
            value: "1"
          resources:
            requests:
              cpu: 500m
              memory: 2048Mi
            
          volumeMounts:
          - name: config-volume
            mountPath: /etc/istio/config
          - name: istio-certs
            mountPath: /etc/certs
            readOnly: true
        - name: istio-proxy
          image: "docker.io/istio/proxyv2:1.0.3"
          imagePullPolicy: IfNotPresent
          ports:
          - containerPort: 15003
          - containerPort: 15005
          - containerPort: 15007
          - containerPort: 15011
          args:
          - proxy
          - --serviceCluster
          - istio-pilot
          - --templateFile
          - /etc/istio/proxy/envoy_pilot.yaml.tmpl
          - --controlPlaneAuthPolicy
          - NONE
          env:
          - name: POD_NAME
            valueFrom:
              fieldRef:
                apiVersion: v1
                fieldPath: metadata.name
          - name: POD_NAMESPACE
            valueFrom:
              fieldRef:
                apiVersion: v1
                fieldPath: metadata.namespace
          - name: INSTANCE_IP
            valueFrom:
              fieldRef:
                apiVersion: v1
                fieldPath: status.podIP
          resources:
            requests:
              cpu: 10m
            
          volumeMounts:
          - name: istio-certs
            mountPath: /etc/certs
            readOnly: true
      volumes:
      - name: config-volume
        configMap:
          name: istio
      - name: istio-certs
        secret:
          secretName: istio.istio-pilot-service-account
          optional: true   
      affinity:      
        nodeAffinity:
          requiredDuringSchedulingIgnoredDuringExecution:
            nodeSelectorTerms:
            - matchExpressions:
              - key: beta.kubernetes.io/arch
                operator: In
                values:
                - amd64
                - ppc64le
                - s390x
          preferredDuringSchedulingIgnoredDuringExecution:
          - weight: 2
            preference:
              matchExpressions:
              - key: beta.kubernetes.io/arch
                operator: In
                values:
                - amd64
          - weight: 2
            preference:
              matchExpressions:
              - key: beta.kubernetes.io/arch
                operator: In
                values:
                - ppc64le
          - weight: 2
            preference:
              matchExpressions:
              - key: beta.kubernetes.io/arch
                operator: In
                values:
                - s390x
---
# Source: istio/charts/prometheus/templates/deployment.yaml
# TODO: the original template has service account, roles, etc
apiVersion: extensions/v1beta1
kind: Deployment
metadata:
  name: prometheus
  namespace: istio-system
  labels:
    app: prometheus
    chart: prometheus-1.0.3
    release: istio
    heritage: Tiller
spec:
  replicas: 1
  selector:
    matchLabels:
      app: prometheus
  template:
    metadata:
      labels:
        app: prometheus
      annotations:
        sidecar.istio.io/inject: "false"
        scheduler.alpha.kubernetes.io/critical-pod: ""
    spec:
      serviceAccountName: prometheus
      containers:
        - name: prometheus
          image: "docker.io/prom/prometheus:v2.3.1"
          imagePullPolicy: IfNotPresent
          args:
            - '--storage.tsdb.retention=6h'
            - '--config.file=/etc/prometheus/prometheus.yml'
          ports:
            - containerPort: 9090
              name: http
          livenessProbe:
            httpGet:
              path: /-/healthy
              port: 9090
          readinessProbe:
            httpGet:
              path: /-/ready
              port: 9090
          resources:
            requests:
              cpu: 10m
            
          volumeMounts:
          - name: config-volume
            mountPath: /etc/prometheus
          - mountPath: /etc/istio-certs
            name: istio-certs
      volumes:
      - name: config-volume
        configMap:
          name: prometheus
      - name: istio-certs
        secret:
          defaultMode: 420
          optional: true
          secretName: istio.default
      affinity:      
        nodeAffinity:
          requiredDuringSchedulingIgnoredDuringExecution:
            nodeSelectorTerms:
            - matchExpressions:
              - key: beta.kubernetes.io/arch
                operator: In
                values:
                - amd64
                - ppc64le
                - s390x
          preferredDuringSchedulingIgnoredDuringExecution:
          - weight: 2
            preference:
              matchExpressions:
              - key: beta.kubernetes.io/arch
                operator: In
                values:
                - amd64
          - weight: 2
            preference:
              matchExpressions:
              - key: beta.kubernetes.io/arch
                operator: In
                values:
                - ppc64le
          - weight: 2
            preference:
              matchExpressions:
              - key: beta.kubernetes.io/arch
                operator: In
                values:
                - s390x
---
# Source: istio/charts/security/templates/deployment.yaml
# istio CA watching all namespaces
apiVersion: extensions/v1beta1
kind: Deployment
metadata:
  name: istio-citadel
  namespace: istio-system
  labels:
    app: security
    chart: security-1.0.3
    release: istio
    heritage: Tiller
    istio: citadel
spec:
  replicas: 1
  template:
    metadata:
      labels:
        istio: citadel
      annotations:
        sidecar.istio.io/inject: "false"
        scheduler.alpha.kubernetes.io/critical-pod: ""
    spec:
      serviceAccountName: istio-citadel-service-account
      containers:
        - name: citadel
          image: "docker.io/istio/citadel:1.0.3"
          imagePullPolicy: IfNotPresent
          args:
            - --append-dns-names=true
            - --grpc-port=8060
            - --grpc-hostname=citadel
            - --citadel-storage-namespace=istio-system
            - --custom-dns-names=istio-pilot-service-account.istio-system:istio-pilot.istio-system,istio-ingressgateway-service-account.istio-system:istio-ingressgateway.istio-system
            - --self-signed-ca=true
          resources:
            requests:
              cpu: 10m
            
      affinity:      
        nodeAffinity:
          requiredDuringSchedulingIgnoredDuringExecution:
            nodeSelectorTerms:
            - matchExpressions:
              - key: beta.kubernetes.io/arch
                operator: In
                values:
                - amd64
                - ppc64le
                - s390x
          preferredDuringSchedulingIgnoredDuringExecution:
          - weight: 2
            preference:
              matchExpressions:
              - key: beta.kubernetes.io/arch
                operator: In
                values:
                - amd64
          - weight: 2
            preference:
              matchExpressions:
              - key: beta.kubernetes.io/arch
                operator: In
                values:
                - ppc64le
          - weight: 2
            preference:
              matchExpressions:
              - key: beta.kubernetes.io/arch
                operator: In
                values:
                - s390x
---
# Source: istio/charts/servicegraph/templates/deployment.yaml
apiVersion: extensions/v1beta1
kind: Deployment
metadata:
  name: servicegraph
  namespace: istio-system
  labels:
    app: servicegraph
    chart: servicegraph-1.0.3
    release: istio
    heritage: Tiller
spec:
  replicas: 1
  template:
    metadata:
      labels:
        app: servicegraph
      annotations:
        sidecar.istio.io/inject: "false"
        scheduler.alpha.kubernetes.io/critical-pod: ""
    spec:
      containers:
        - name: servicegraph
          image: "docker.io/istio/servicegraph:1.0.3"
          imagePullPolicy: IfNotPresent
          ports:
            - containerPort: 8088
          args:
          - --prometheusAddr=http://prometheus:9090
          livenessProbe:
            httpGet:
              path: /graph
              port: 8088
          readinessProbe:
            httpGet:
              path: /graph
              port: 8088
          resources:
            requests:
              cpu: 10m
            
      affinity:      
        nodeAffinity:
          requiredDuringSchedulingIgnoredDuringExecution:
            nodeSelectorTerms:
            - matchExpressions:
              - key: beta.kubernetes.io/arch
                operator: In
                values:
                - amd64
                - ppc64le
                - s390x
          preferredDuringSchedulingIgnoredDuringExecution:
          - weight: 2
            preference:
              matchExpressions:
              - key: beta.kubernetes.io/arch
                operator: In
                values:
                - amd64
          - weight: 2
            preference:
              matchExpressions:
              - key: beta.kubernetes.io/arch
                operator: In
                values:
                - ppc64le
          - weight: 2
            preference:
              matchExpressions:
              - key: beta.kubernetes.io/arch
                operator: In
                values:
                - s390x
---
# Source: istio/charts/sidecarInjectorWebhook/templates/deployment.yaml
apiVersion: extensions/v1beta1
kind: Deployment
metadata:
  name: istio-sidecar-injector
  namespace: istio-system
  labels:
    app: sidecarInjectorWebhook
    chart: sidecarInjectorWebhook-1.0.3
    release: istio
    heritage: Tiller
    istio: sidecar-injector
spec:
  replicas: 1
  template:
    metadata:
      labels:
        istio: sidecar-injector
      annotations:
        sidecar.istio.io/inject: "false"
        scheduler.alpha.kubernetes.io/critical-pod: ""
    spec:
      serviceAccountName: istio-sidecar-injector-service-account
      containers:
        - name: sidecar-injector-webhook
          image: "docker.io/istio/sidecar_injector:1.0.3"
          imagePullPolicy: IfNotPresent
          args:
            - --caCertFile=/etc/istio/certs/root-cert.pem
            - --tlsCertFile=/etc/istio/certs/cert-chain.pem
            - --tlsKeyFile=/etc/istio/certs/key.pem
            - --injectConfig=/etc/istio/inject/config
            - --meshConfig=/etc/istio/config/mesh
            - --healthCheckInterval=2s
            - --healthCheckFile=/health
          volumeMounts:
          - name: config-volume
            mountPath: /etc/istio/config
            readOnly: true
          - name: certs
            mountPath: /etc/istio/certs
            readOnly: true
          - name: inject-config
            mountPath: /etc/istio/inject
            readOnly: true
          livenessProbe:
            exec:
              command:
                - /usr/local/bin/sidecar-injector
                - probe
                - --probe-path=/health
                - --interval=4s
            initialDelaySeconds: 4
            periodSeconds: 4
          readinessProbe:
            exec:
              command:
                - /usr/local/bin/sidecar-injector
                - probe
                - --probe-path=/health
                - --interval=4s
            initialDelaySeconds: 4
            periodSeconds: 4
          resources:
            requests:
              cpu: 10m
            
      volumes:
      - name: config-volume
        configMap:
          name: istio
      - name: certs
        secret:
          secretName: istio.istio-sidecar-injector-service-account
      - name: inject-config
        configMap:
          name: istio-sidecar-injector
          items:
          - key: config
            path: config
      affinity:      
        nodeAffinity:
          requiredDuringSchedulingIgnoredDuringExecution:
            nodeSelectorTerms:
            - matchExpressions:
              - key: beta.kubernetes.io/arch
                operator: In
                values:
                - amd64
                - ppc64le
                - s390x
          preferredDuringSchedulingIgnoredDuringExecution:
          - weight: 2
            preference:
              matchExpressions:
              - key: beta.kubernetes.io/arch
                operator: In
                values:
                - amd64
          - weight: 2
            preference:
              matchExpressions:
              - key: beta.kubernetes.io/arch
                operator: In
                values:
                - ppc64le
          - weight: 2
            preference:
              matchExpressions:
              - key: beta.kubernetes.io/arch
                operator: In
                values:
                - s390x
---
# Source: istio/charts/tracing/templates/deployment.yaml
apiVersion: extensions/v1beta1
kind: Deployment
metadata:
  name: istio-tracing
  namespace: istio-system
  labels:
    app: istio-tracing
    chart: tracing-1.0.3
    release: istio
    heritage: Tiller
spec:
  replicas: 1
  template:
    metadata:
      labels:
        app: jaeger
      annotations:
        sidecar.istio.io/inject: "false"
        scheduler.alpha.kubernetes.io/critical-pod: ""
    spec:
      containers:
        - name: jaeger
          image: "docker.io/jaegertracing/all-in-one:1.5"
          imagePullPolicy: IfNotPresent
          ports:
            - containerPort: 9411
            - containerPort: 16686
            - containerPort: 5775
              protocol: UDP
            - containerPort: 6831
              protocol: UDP
            - containerPort: 6832
              protocol: UDP
          env:
          - name: POD_NAMESPACE
            valueFrom:
              fieldRef:
                apiVersion: v1
                fieldPath: metadata.namespace
          - name: COLLECTOR_ZIPKIN_HTTP_PORT
            value: "9411"
          - name: MEMORY_MAX_TRACES
            value: "50000"
          livenessProbe:
            httpGet:
              path: /
              port: 16686
          readinessProbe:
            httpGet:
              path: /
              port: 16686
          resources:
            requests:
              cpu: 10m
            
      affinity:      
        nodeAffinity:
          requiredDuringSchedulingIgnoredDuringExecution:
            nodeSelectorTerms:
            - matchExpressions:
              - key: beta.kubernetes.io/arch
                operator: In
                values:
                - amd64
                - ppc64le
                - s390x
          preferredDuringSchedulingIgnoredDuringExecution:
          - weight: 2
            preference:
              matchExpressions:
              - key: beta.kubernetes.io/arch
                operator: In
                values:
                - amd64
          - weight: 2
            preference:
              matchExpressions:
              - key: beta.kubernetes.io/arch
                operator: In
                values:
                - ppc64le
          - weight: 2
            preference:
              matchExpressions:
              - key: beta.kubernetes.io/arch
                operator: In
                values:
                - s390x
---
# Source: istio/templates/crds.yaml
#
#
---
# Source: istio/charts/mixer/templates/config.yaml
apiVersion: networking.istio.io/v1alpha3
kind: DestinationRule
metadata:
  name: istio-telemetry
  namespace: istio-system
spec:
  host: istio-telemetry.istio-system.svc.cluster.local
  trafficPolicy:
    connectionPool:
      http:
        http2MaxRequests: 10000
        maxRequestsPerConnection: 10000
---
# Source: istio/charts/mixer/templates/config.yaml
# Configuration needed by Mixer.
# Mixer cluster is delivered via CDS
# Specify mixer cluster settings
apiVersion: networking.istio.io/v1alpha3
kind: DestinationRule
metadata:
  name: istio-policy
  namespace: istio-system
spec:
  host: istio-policy.istio-system.svc.cluster.local
  trafficPolicy:
    connectionPool:
      http:
        http2MaxRequests: 10000
        maxRequestsPerConnection: 10000
---
# Source: istio/charts/pilot/templates/gateway.yaml
apiVersion: networking.istio.io/v1alpha3
kind: Gateway
metadata:
  name: istio-autogenerated-k8s-ingress
  namespace: istio-system
spec:
  selector:
    istio: ingress
  servers:
  - port:
      number: 80
      protocol: HTTP2
      name: http
    hosts:
    - "*"
---
# Source: istio/charts/gateways/templates/autoscale.yaml
apiVersion: autoscaling/v2beta1
kind: HorizontalPodAutoscaler
metadata:
    name: istio-egressgateway
    namespace: istio-system
spec:
    maxReplicas: 5
    minReplicas: 1
    scaleTargetRef:
      apiVersion: apps/v1beta1
      kind: Deployment
      name: istio-egressgateway
    metrics:
    - type: Resource
      resource:
        name: cpu
        targetAverageUtilization: 80
---
# Source: istio/charts/gateways/templates/autoscale.yaml
apiVersion: autoscaling/v2beta1
kind: HorizontalPodAutoscaler
metadata:
    name: istio-ingressgateway
    namespace: istio-system
spec:
    maxReplicas: 5
    minReplicas: 1
    scaleTargetRef:
      apiVersion: apps/v1beta1
      kind: Deployment
      name: istio-ingressgateway
    metrics:
    - type: Resource
      resource:
        name: cpu
        targetAverageUtilization: 80
---
# Source: istio/charts/mixer/templates/autoscale.yaml
apiVersion: autoscaling/v2beta1
kind: HorizontalPodAutoscaler
metadata:
    name: istio-policy
    namespace: istio-system
spec:
    maxReplicas: 5
    minReplicas: 1
    scaleTargetRef:
      apiVersion: apps/v1beta1
      kind: Deployment
      name: istio-policy
    metrics:
    - type: Resource
      resource:
        name: cpu
        targetAverageUtilization: 80
---
# Source: istio/charts/mixer/templates/autoscale.yaml
apiVersion: autoscaling/v2beta1
kind: HorizontalPodAutoscaler
metadata:
    name: istio-telemetry
    namespace: istio-system
spec:
    maxReplicas: 5
    minReplicas: 1
    scaleTargetRef:
      apiVersion: apps/v1beta1
      kind: Deployment
      name: istio-telemetry
    metrics:
    - type: Resource
      resource:
        name: cpu
        targetAverageUtilization: 80
---
# Source: istio/charts/pilot/templates/autoscale.yaml
apiVersion: autoscaling/v2beta1
kind: HorizontalPodAutoscaler
metadata:
    name: istio-pilot
    namespace: istio-system
spec:
    maxReplicas: 5
    minReplicas: 1
    scaleTargetRef:
      apiVersion: apps/v1beta1
      kind: Deployment
      name: istio-pilot
    metrics:
    - type: Resource
      resource:
        name: cpu
        targetAverageUtilization: 80
---
# Source: istio/charts/tracing/templates/service-jaeger.yaml
apiVersion: v1
kind: List
items:
- apiVersion: v1
  kind: Service
  metadata:
    name: jaeger-query
    namespace: istio-system
    annotations:
    labels:
      app: jaeger
      jaeger-infra: jaeger-service
      chart: tracing-1.0.3
      release: istio
      heritage: Tiller
  spec:
    ports:
      - name: query-http
        port: 16686
        protocol: TCP
        targetPort: 16686
    selector:
      app: jaeger
- apiVersion: v1
  kind: Service
  metadata:
    name: jaeger-collector
    namespace: istio-system
    labels:
      app: jaeger
      jaeger-infra: collector-service
      chart: tracing-1.0.3
      release: istio
      heritage: Tiller
  spec:
    ports:
    - name: jaeger-collector-tchannel
      port: 14267
      protocol: TCP
      targetPort: 14267
    - name: jaeger-collector-http
      port: 14268
      targetPort: 14268
      protocol: TCP
    selector:
      app: jaeger
    type: ClusterIP
- apiVersion: v1
  kind: Service
  metadata:
    name: jaeger-agent
    namespace: istio-system
    labels:
      app: jaeger
      jaeger-infra: agent-service
      chart: tracing-1.0.3
      release: istio
      heritage: Tiller
  spec:
    ports:
    - name: agent-zipkin-thrift
      port: 5775
      protocol: UDP
      targetPort: 5775
    - name: agent-compact
      port: 6831
      protocol: UDP
      targetPort: 6831
    - name: agent-binary
      port: 6832
      protocol: UDP
      targetPort: 6832
    clusterIP: None
    selector:
      app: jaeger
---
# Source: istio/charts/tracing/templates/service.yaml
apiVersion: v1
kind: List
items:
- apiVersion: v1
  kind: Service
  metadata:
    name: zipkin
    namespace: istio-system
    labels:
      app: jaeger
      chart: tracing-1.0.3
      release: istio
      heritage: Tiller
  spec:
    type: ClusterIP
    ports:
      - port: 9411
        targetPort: 9411
        protocol: TCP
        name: http
    selector:
      app: jaeger
- apiVersion: v1
  kind: Service
  metadata:
    name: tracing
    namespace: istio-system
    annotations:
    labels:
      app: jaeger
      chart: tracing-1.0.3
      release: istio
      heritage: Tiller
  spec:
    ports:
      - name: http-query
        port: 80
        protocol: TCP
        targetPort: 16686
    selector:
      app: jaeger
---
# Source: istio/charts/sidecarInjectorWebhook/templates/mutatingwebhook.yaml
apiVersion: admissionregistration.k8s.io/v1beta1
kind: MutatingWebhookConfiguration
metadata:
  name: istio-sidecar-injector
  namespace: istio-system
  labels:
    app: istio-sidecar-injector
    chart: sidecarInjectorWebhook-1.0.3
    release: istio
    heritage: Tiller
webhooks:
  - name: sidecar-injector.istio.io
    clientConfig:
      service:
        name: istio-sidecar-injector
        namespace: istio-system
        path: "/inject"
      caBundle: ""
    rules:
      - operations: [ "CREATE" ]
        apiGroups: [""]
        apiVersions: ["v1"]
        resources: ["pods"]
    failurePolicy: Fail
    namespaceSelector:
      matchLabels:
        istio-injection: enabled
---
# Source: istio/charts/mixer/templates/config.yaml
apiVersion: "config.istio.io/v1alpha2"
kind: attributemanifest
metadata:
  name: istioproxy
  namespace: istio-system
spec:
  attributes:
    origin.ip:
      valueType: IP_ADDRESS
    origin.uid:
      valueType: STRING
    origin.user:
      valueType: STRING
    request.headers:
      valueType: STRING_MAP
    request.id:
      valueType: STRING
    request.host:
      valueType: STRING
    request.method:
      valueType: STRING
    request.path:
      valueType: STRING
    request.reason:
      valueType: STRING
    request.referer:
      valueType: STRING
    request.scheme:
      valueType: STRING
    request.total_size:
          valueType: INT64
    request.size:
      valueType: INT64
    request.time:
      valueType: TIMESTAMP
    request.useragent:
      valueType: STRING
    response.code:
      valueType: INT64
    response.duration:
      valueType: DURATION
    response.headers:
      valueType: STRING_MAP
    response.total_size:
          valueType: INT64
    response.size:
      valueType: INT64
    response.time:
      valueType: TIMESTAMP
    source.uid:
      valueType: STRING
    source.user: # DEPRECATED
      valueType: STRING
    source.principal:
      valueType: STRING
    destination.uid:
      valueType: STRING
    destination.principal:
      valueType: STRING
    destination.port:
      valueType: INT64
    connection.event:
      valueType: STRING
    connection.id:
      valueType: STRING
    connection.received.bytes:
      valueType: INT64
    connection.received.bytes_total:
      valueType: INT64
    connection.sent.bytes:
      valueType: INT64
    connection.sent.bytes_total:
      valueType: INT64
    connection.duration:
      valueType: DURATION
    connection.mtls:
      valueType: BOOL
    connection.requested_server_name:
      valueType: STRING
    context.protocol:
      valueType: STRING
    context.timestamp:
      valueType: TIMESTAMP
    context.time:
      valueType: TIMESTAMP
    # Deprecated, kept for compatibility
    context.reporter.local:
      valueType: BOOL
    context.reporter.kind:
      valueType: STRING
    context.reporter.uid:
      valueType: STRING
    api.service:
      valueType: STRING
    api.version:
      valueType: STRING
    api.operation:
      valueType: STRING
    api.protocol:
      valueType: STRING
    request.auth.principal:
      valueType: STRING
    request.auth.audiences:
      valueType: STRING
    request.auth.presenter:
      valueType: STRING
    request.auth.claims:
      valueType: STRING_MAP
    request.auth.raw_claims:
      valueType: STRING
    request.api_key:
      valueType: STRING
---
# Source: istio/charts/mixer/templates/config.yaml
apiVersion: "config.istio.io/v1alpha2"
kind: attributemanifest
metadata:
  name: kubernetes
  namespace: istio-system
spec:
  attributes:
    source.ip:
      valueType: IP_ADDRESS
    source.labels:
      valueType: STRING_MAP
    source.metadata:
      valueType: STRING_MAP
    source.name:
      valueType: STRING
    source.namespace:
      valueType: STRING
    source.owner:
      valueType: STRING
    source.service:  # DEPRECATED
      valueType: STRING
    source.serviceAccount:
      valueType: STRING
    source.services:
      valueType: STRING
    source.workload.uid:
      valueType: STRING
    source.workload.name:
      valueType: STRING
    source.workload.namespace:
      valueType: STRING
    destination.ip:
      valueType: IP_ADDRESS
    destination.labels:
      valueType: STRING_MAP
    destination.metadata:
      valueType: STRING_MAP
    destination.owner:
      valueType: STRING
    destination.name:
      valueType: STRING
    destination.container.name:
      valueType: STRING
    destination.namespace:
      valueType: STRING
    destination.service: # DEPRECATED
      valueType: STRING
    destination.service.uid:
      valueType: STRING
    destination.service.name:
      valueType: STRING
    destination.service.namespace:
      valueType: STRING
    destination.service.host:
      valueType: STRING
    destination.serviceAccount:
      valueType: STRING
    destination.workload.uid:
      valueType: STRING
    destination.workload.name:
      valueType: STRING
    destination.workload.namespace:
      valueType: STRING
---
# Source: istio/charts/mixer/templates/config.yaml
apiVersion: "config.istio.io/v1alpha2"
kind: kubernetes
metadata:
  name: attributes
  namespace: istio-system
spec:
  # Pass the required attribute data to the adapter
  source_uid: source.uid | ""
  source_ip: source.ip | ip("0.0.0.0") # default to unspecified ip addr
  destination_uid: destination.uid | ""
  destination_port: destination.port | 0
  attribute_bindings:
    # Fill the new attributes from the adapter produced output.
    # $out refers to an instance of OutputTemplate message
    source.ip: $out.source_pod_ip | ip("0.0.0.0")
    source.uid: $out.source_pod_uid | "unknown"
    source.labels: $out.source_labels | emptyStringMap()
    source.name: $out.source_pod_name | "unknown"
    source.namespace: $out.source_namespace | "default"
    source.owner: $out.source_owner | "unknown"
    source.serviceAccount: $out.source_service_account_name | "unknown"
    source.workload.uid: $out.source_workload_uid | "unknown"
    source.workload.name: $out.source_workload_name | "unknown"
    source.workload.namespace: $out.source_workload_namespace | "unknown"
    destination.ip: $out.destination_pod_ip | ip("0.0.0.0")
    destination.uid: $out.destination_pod_uid | "unknown"
    destination.labels: $out.destination_labels | emptyStringMap()
    destination.name: $out.destination_pod_name | "unknown"
    destination.container.name: $out.destination_container_name | "unknown"
    destination.namespace: $out.destination_namespace | "default"
    destination.owner: $out.destination_owner | "unknown"
    destination.serviceAccount: $out.destination_service_account_name | "unknown"
    destination.workload.uid: $out.destination_workload_uid | "unknown"
    destination.workload.name: $out.destination_workload_name | "unknown"
    destination.workload.namespace: $out.destination_workload_namespace | "unknown"
---
# Source: istio/charts/mixer/templates/config.yaml
apiVersion: "config.istio.io/v1alpha2"
kind: kubernetesenv
metadata:
  name: handler
  namespace: istio-system
spec:
  # when running from mixer root, use the following config after adding a
  # symbolic link to a kubernetes config file via:
  #
  # $ ln -s ~/.kube/config mixer/adapter/kubernetes/kubeconfig
  #
  # kubeconfig_path: "mixer/adapter/kubernetes/kubeconfig"
---
# Source: istio/charts/mixer/templates/config.yaml
apiVersion: "config.istio.io/v1alpha2"
kind: logentry
metadata:
  name: accesslog
  namespace: istio-system
spec:
  severity: '"Info"'
  timestamp: request.time
  variables:
    sourceIp: source.ip | ip("0.0.0.0")
    sourceApp: source.labels["app"] | ""
    sourcePrincipal: source.principal | ""
    sourceName: source.name | ""
    sourceWorkload: source.workload.name | ""
    sourceNamespace: source.namespace | ""
    sourceOwner: source.owner | ""
    destinationApp: destination.labels["app"] | ""
    destinationIp: destination.ip | ip("0.0.0.0")
    destinationServiceHost: destination.service.host | ""
    destinationWorkload: destination.workload.name | ""
    destinationName: destination.name | ""
    destinationNamespace: destination.namespace | ""
    destinationOwner: destination.owner | ""
    destinationPrincipal: destination.principal | ""
    apiClaims: request.auth.raw_claims | ""
    apiKey: request.api_key | request.headers["x-api-key"] | ""
    protocol: request.scheme | context.protocol | "http"
    method: request.method | ""
    url: request.path | ""
    responseCode: response.code | 0
    responseSize: response.size | 0
    requestSize: request.size | 0
    requestId: request.headers["x-request-id"] | ""
    clientTraceId: request.headers["x-client-trace-id"] | ""
    latency: response.duration | "0ms"
    connection_security_policy: conditional((context.reporter.kind | "inbound") == "outbound", "unknown", conditional(connection.mtls | false, "mutual_tls", "none"))
    requestedServerName: connection.requested_server_name | ""
    userAgent: request.useragent | ""
    responseTimestamp: response.time
    receivedBytes: request.total_size | 0
    sentBytes: response.total_size | 0
    referer: request.referer | ""
    httpAuthority: request.headers[":authority"] | request.host | ""
    xForwardedFor: request.headers["x-forwarded-for"] | "0.0.0.0"
    reporter: conditional((context.reporter.kind | "inbound") == "outbound", "source", "destination")
  monitored_resource_type: '"global"'
---
# Source: istio/charts/mixer/templates/config.yaml
apiVersion: "config.istio.io/v1alpha2"
kind: logentry
metadata:
  name: tcpaccesslog
  namespace: istio-system
spec:
  severity: '"Info"'
  timestamp: context.time | timestamp("2017-01-01T00:00:00Z")
  variables:
    connectionEvent: connection.event | ""
    sourceIp: source.ip | ip("0.0.0.0")
    sourceApp: source.labels["app"] | ""
    sourcePrincipal: source.principal | ""
    sourceName: source.name | ""
    sourceWorkload: source.workload.name | ""
    sourceNamespace: source.namespace | ""
    sourceOwner: source.owner | ""
    destinationApp: destination.labels["app"] | ""
    destinationIp: destination.ip | ip("0.0.0.0")
    destinationServiceHost: destination.service.host | ""
    destinationWorkload: destination.workload.name | ""
    destinationName: destination.name | ""
    destinationNamespace: destination.namespace | ""
    destinationOwner: destination.owner | ""
    destinationPrincipal: destination.principal | ""
    protocol: context.protocol | "tcp"
    connectionDuration: connection.duration | "0ms"
    connection_security_policy: conditional((context.reporter.kind | "inbound") == "outbound", "unknown", conditional(connection.mtls | false, "mutual_tls", "none"))
    requestedServerName: connection.requested_server_name | ""
    receivedBytes: connection.received.bytes | 0
    sentBytes: connection.sent.bytes | 0
    totalReceivedBytes: connection.received.bytes_total | 0
    totalSentBytes: connection.sent.bytes_total | 0
    reporter: conditional((context.reporter.kind | "inbound") == "outbound", "source", "destination")
  monitored_resource_type: '"global"'
---
# Source: istio/charts/mixer/templates/config.yaml
apiVersion: "config.istio.io/v1alpha2"
kind: metric
metadata:
  name: requestduration
  namespace: istio-system
spec:
  value: response.duration | "0ms"
  dimensions:
    reporter: conditional((context.reporter.kind | "inbound") == "outbound", "source", "destination")
    source_workload: source.workload.name | "unknown"
    source_workload_namespace: source.workload.namespace | "unknown"
    source_principal: source.principal | "unknown"
    source_app: source.labels["app"] | "unknown"
    source_version: source.labels["version"] | "unknown"
    destination_workload: destination.workload.name | "unknown"
    destination_workload_namespace: destination.workload.namespace | "unknown"
    destination_principal: destination.principal | "unknown"
    destination_app: destination.labels["app"] | "unknown"
    destination_version: destination.labels["version"] | "unknown"
    destination_service: destination.service.host | "unknown"
    destination_service_name: destination.service.name | "unknown"
    destination_service_namespace: destination.service.namespace | "unknown"
    request_protocol: api.protocol | context.protocol | "unknown"
    response_code: response.code | 200
    connection_security_policy: conditional((context.reporter.kind | "inbound") == "outbound", "unknown", conditional(connection.mtls | false, "mutual_tls", "none"))
  monitored_resource_type: '"UNSPECIFIED"'
---
# Source: istio/charts/mixer/templates/config.yaml
apiVersion: "config.istio.io/v1alpha2"
kind: metric
metadata:
  name: responsesize
  namespace: istio-system
spec:
  value: response.size | 0
  dimensions:
    reporter: conditional((context.reporter.kind | "inbound") == "outbound", "source", "destination")
    source_workload: source.workload.name | "unknown"
    source_workload_namespace: source.workload.namespace | "unknown"
    source_principal: source.principal | "unknown"
    source_app: source.labels["app"] | "unknown"
    source_version: source.labels["version"] | "unknown"
    destination_workload: destination.workload.name | "unknown"
    destination_workload_namespace: destination.workload.namespace | "unknown"
    destination_principal: destination.principal | "unknown"
    destination_app: destination.labels["app"] | "unknown"
    destination_version: destination.labels["version"] | "unknown"
    destination_service: destination.service.host | "unknown"
    destination_service_name: destination.service.name | "unknown"
    destination_service_namespace: destination.service.namespace | "unknown"
    request_protocol: api.protocol | context.protocol | "unknown"
    response_code: response.code | 200
    connection_security_policy: conditional((context.reporter.kind | "inbound") == "outbound", "unknown", conditional(connection.mtls | false, "mutual_tls", "none"))
  monitored_resource_type: '"UNSPECIFIED"'
---
# Source: istio/charts/mixer/templates/config.yaml
apiVersion: "config.istio.io/v1alpha2"
kind: metric
metadata:
  name: requestsize
  namespace: istio-system
spec:
  value: request.size | 0
  dimensions:
    reporter: conditional((context.reporter.kind | "inbound") == "outbound", "source", "destination")
    source_workload: source.workload.name | "unknown"
    source_workload_namespace: source.workload.namespace | "unknown"
    source_principal: source.principal | "unknown"
    source_app: source.labels["app"] | "unknown"
    source_version: source.labels["version"] | "unknown"
    destination_workload: destination.workload.name | "unknown"
    destination_workload_namespace: destination.workload.namespace | "unknown"
    destination_principal: destination.principal | "unknown"
    destination_app: destination.labels["app"] | "unknown"
    destination_version: destination.labels["version"] | "unknown"
    destination_service: destination.service.host | "unknown"
    destination_service_name: destination.service.name | "unknown"
    destination_service_namespace: destination.service.namespace | "unknown"
    request_protocol: api.protocol | context.protocol | "unknown"
    response_code: response.code | 200
    connection_security_policy: conditional((context.reporter.kind | "inbound") == "outbound", "unknown", conditional(connection.mtls | false, "mutual_tls", "none"))
  monitored_resource_type: '"UNSPECIFIED"'
---
# Source: istio/charts/mixer/templates/config.yaml
apiVersion: "config.istio.io/v1alpha2"
kind: metric
metadata:
  name: tcpbytereceived
  namespace: istio-system
spec:
  value: connection.received.bytes | 0
  dimensions:
    reporter: conditional((context.reporter.kind | "inbound") == "outbound", "source", "destination")
    source_workload: source.workload.name | "unknown"
    source_workload_namespace: source.workload.namespace | "unknown"
    source_principal: source.principal | "unknown"
    source_app: source.labels["app"] | "unknown"
    source_version: source.labels["version"] | "unknown"
    destination_workload: destination.workload.name | "unknown"
    destination_workload_namespace: destination.workload.namespace | "unknown"
    destination_principal: destination.principal | "unknown"
    destination_app: destination.labels["app"] | "unknown"
    destination_version: destination.labels["version"] | "unknown"
    destination_service: destination.service.name | "unknown"
    destination_service_name: destination.service.name | "unknown"
    destination_service_namespace: destination.service.namespace | "unknown"
    connection_security_policy: conditional((context.reporter.kind | "inbound") == "outbound", "unknown", conditional(connection.mtls | false, "mutual_tls", "none"))
  monitored_resource_type: '"UNSPECIFIED"'
---
# Source: istio/charts/mixer/templates/config.yaml
apiVersion: "config.istio.io/v1alpha2"
kind: metric
metadata:
  name: tcpbytesent
  namespace: istio-system
spec:
  value: connection.sent.bytes | 0
  dimensions:
    reporter: conditional((context.reporter.kind | "inbound") == "outbound", "source", "destination")
    source_workload: source.workload.name | "unknown"
    source_workload_namespace: source.workload.namespace | "unknown"
    source_principal: source.principal | "unknown"
    source_app: source.labels["app"] | "unknown"
    source_version: source.labels["version"] | "unknown"
    destination_workload: destination.workload.name | "unknown"
    destination_workload_namespace: destination.workload.namespace | "unknown"
    destination_principal: destination.principal | "unknown"
    destination_app: destination.labels["app"] | "unknown"
    destination_version: destination.labels["version"] | "unknown"
    destination_service: destination.service.name | "unknown"
    destination_service_name: destination.service.name | "unknown"
    destination_service_namespace: destination.service.namespace | "unknown"
    connection_security_policy: conditional((context.reporter.kind | "inbound") == "outbound", "unknown", conditional(connection.mtls | false, "mutual_tls", "none"))
  monitored_resource_type: '"UNSPECIFIED"'
---
# Source: istio/charts/mixer/templates/config.yaml
apiVersion: "config.istio.io/v1alpha2"
kind: metric
metadata:
  name: requestcount
  namespace: istio-system
spec:
  value: "1"
  dimensions:
    reporter: conditional((context.reporter.kind | "inbound") == "outbound", "source", "destination")
    source_workload: source.workload.name | "unknown"
    source_workload_namespace: source.workload.namespace | "unknown"
    source_principal: source.principal | "unknown"
    source_app: source.labels["app"] | "unknown"
    source_version: source.labels["version"] | "unknown"
    destination_workload: destination.workload.name | "unknown"
    destination_workload_namespace: destination.workload.namespace | "unknown"
    destination_principal: destination.principal | "unknown"
    destination_app: destination.labels["app"] | "unknown"
    destination_version: destination.labels["version"] | "unknown"
    destination_service: destination.service.host | "unknown"
    destination_service_name: destination.service.name | "unknown"
    destination_service_namespace: destination.service.namespace | "unknown"
    request_protocol: api.protocol | context.protocol | "unknown"
    response_code: response.code | 200
    connection_security_policy: conditional((context.reporter.kind | "inbound") == "outbound", "unknown", conditional(connection.mtls | false, "mutual_tls", "none"))
  monitored_resource_type: '"UNSPECIFIED"'
---
# Source: istio/charts/mixer/templates/config.yaml
apiVersion: "config.istio.io/v1alpha2"
kind: prometheus
metadata:
  name: handler
  namespace: istio-system
spec:
  metrics:
  - name: requests_total
    instance_name: requestcount.metric.istio-system
    kind: COUNTER
    label_names:
    - reporter
    - source_app
    - source_principal
    - source_workload
    - source_workload_namespace
    - source_version
    - destination_app
    - destination_principal
    - destination_workload
    - destination_workload_namespace
    - destination_version
    - destination_service
    - destination_service_name
    - destination_service_namespace
    - request_protocol
    - response_code
    - connection_security_policy
  - name: request_duration_seconds
    instance_name: requestduration.metric.istio-system
    kind: DISTRIBUTION
    label_names:
    - reporter
    - source_app
    - source_principal
    - source_workload
    - source_workload_namespace
    - source_version
    - destination_app
    - destination_principal
    - destination_workload
    - destination_workload_namespace
    - destination_version
    - destination_service
    - destination_service_name
    - destination_service_namespace
    - request_protocol
    - response_code
    - connection_security_policy
    buckets:
      explicit_buckets:
        bounds: [0.005, 0.01, 0.025, 0.05, 0.1, 0.25, 0.5, 1, 2.5, 5, 10]
  - name: request_bytes
    instance_name: requestsize.metric.istio-system
    kind: DISTRIBUTION
    label_names:
    - reporter
    - source_app
    - source_principal
    - source_workload
    - source_workload_namespace
    - source_version
    - destination_app
    - destination_principal
    - destination_workload
    - destination_workload_namespace
    - destination_version
    - destination_service
    - destination_service_name
    - destination_service_namespace
    - request_protocol
    - response_code
    - connection_security_policy
    buckets:
      exponentialBuckets:
        numFiniteBuckets: 8
        scale: 1
        growthFactor: 10
  - name: response_bytes
    instance_name: responsesize.metric.istio-system
    kind: DISTRIBUTION
    label_names:
    - reporter
    - source_app
    - source_principal
    - source_workload
    - source_workload_namespace
    - source_version
    - destination_app
    - destination_principal
    - destination_workload
    - destination_workload_namespace
    - destination_version
    - destination_service
    - destination_service_name
    - destination_service_namespace
    - request_protocol
    - response_code
    - connection_security_policy
    buckets:
      exponentialBuckets:
        numFiniteBuckets: 8
        scale: 1
        growthFactor: 10
  - name: tcp_sent_bytes_total
    instance_name: tcpbytesent.metric.istio-system
    kind: COUNTER
    label_names:
    - reporter
    - source_app
    - source_principal
    - source_workload
    - source_workload_namespace
    - source_version
    - destination_app
    - destination_principal
    - destination_workload
    - destination_workload_namespace
    - destination_version
    - destination_service
    - destination_service_name
    - destination_service_namespace
    - connection_security_policy
  - name: tcp_received_bytes_total
    instance_name: tcpbytereceived.metric.istio-system
    kind: COUNTER
    label_names:
    - reporter
    - source_app
    - source_principal
    - source_workload
    - source_workload_namespace
    - source_version
    - destination_app
    - destination_principal
    - destination_workload
    - destination_workload_namespace
    - destination_version
    - destination_service
    - destination_service_name
    - destination_service_namespace
    - connection_security_policy
---
# Source: istio/charts/mixer/templates/config.yaml
apiVersion: "config.istio.io/v1alpha2"
kind: rule
metadata:
  name: tcpkubeattrgenrulerule
  namespace: istio-system
spec:
  match: context.protocol == "tcp"
  actions:
  - handler: handler.kubernetesenv
    instances:
    - attributes.kubernetes
---
# Source: istio/charts/mixer/templates/config.yaml
apiVersion: "config.istio.io/v1alpha2"
kind: rule
metadata:
  name: kubeattrgenrulerule
  namespace: istio-system
spec:
  actions:
  - handler: handler.kubernetesenv
    instances:
    - attributes.kubernetes
---
# Source: istio/charts/mixer/templates/config.yaml
apiVersion: "config.istio.io/v1alpha2"
kind: rule
metadata:
  name: stdiotcp
  namespace: istio-system
spec:
  match: context.protocol == "tcp"
  actions:
  - handler: handler.stdio
    instances:
    - tcpaccesslog.logentry
---
# Source: istio/charts/mixer/templates/config.yaml
apiVersion: "config.istio.io/v1alpha2"
kind: rule
metadata:
  name: stdio
  namespace: istio-system
spec:
  match: context.protocol == "http" || context.protocol == "grpc"
  actions:
  - handler: handler.stdio
    instances:
    - accesslog.logentry
---
# Source: istio/charts/mixer/templates/config.yaml
apiVersion: "config.istio.io/v1alpha2"
kind: rule
metadata:
  name: promhttp
  namespace: istio-system
spec:
  match: context.protocol == "http" || context.protocol == "grpc"
  actions:
  - handler: handler.prometheus
    instances:
    - requestcount.metric
    - requestduration.metric
    - requestsize.metric
    - responsesize.metric
---
# Source: istio/charts/mixer/templates/config.yaml
apiVersion: "config.istio.io/v1alpha2"
kind: rule
metadata:
  name: promtcp
  namespace: istio-system
spec:
  match: context.protocol == "tcp"
  actions:
  - handler: handler.prometheus
    instances:
    - tcpbytesent.metric
    - tcpbytereceived.metric
---
# Source: istio/charts/mixer/templates/config.yaml
apiVersion: "config.istio.io/v1alpha2"
kind: stdio
metadata:
  name: handler
  namespace: istio-system
spec:
  outputAsJson: true
LAST DEPLOYED: Thu Nov 22 22:57:58 2018
NAMESPACE: istio-system
STATUS: DEPLOYED

RESOURCES:
==> v1/Service
NAME                    AGE
istio-galley            2m
istio-ingressgateway    2m
istio-egressgateway     2m
grafana                 2m
istio-policy            2m
istio-telemetry         2m
istio-pilot             2m
prometheus              2m
istio-citadel           2m
servicegraph            2m
istio-sidecar-injector  2m
jaeger-query            2m
jaeger-collector        2m
jaeger-agent            2m
zipkin                  2m
tracing                 2m

==> v1alpha2/kubernetesenv
handler  2m

==> v1alpha2/prometheus
handler  2m

==> v1/Pod(related)

NAME                                     READY  STATUS   RESTARTS  AGE
istio-galley-6d74549bb9-464ht            1/1    Running  0         2m
istio-ingressgateway-6c6ffb7dc8-f29gz    1/1    Running  0         2m
istio-egressgateway-866885bb49-l97n7     1/1    Running  0         2m
grafana-9cfc9d4c9-62txs                  1/1    Running  0         2m
istio-telemetry-69b794ff59-f9xz2         2/2    Running  0         2m
istio-policy-688f99c9c4-z9c8h            2/2    Running  0         2m
istio-pilot-685fc95d96-7cssn             2/2    Running  0         2m
prometheus-f556886b8-9pkf6               1/1    Running  0         2m
istio-citadel-6d7f9c545b-74hrb           1/1    Running  0         2m
servicegraph-778f94d6f8-4mxhc            1/1    Running  0         2m
istio-sidecar-injector-74855c54b9-4vhcm  1/1    Running  0         2m
istio-tracing-ff94688bb-jhbsr            1/1    Running  0         2m

==> v1alpha2/metric

NAME             AGE
requestduration  2m
responsesize     2m
requestsize      2m
tcpbytereceived  2m
tcpbytesent      2m
requestcount     2m

==> v1alpha3/Gateway
istio-autogenerated-k8s-ingress  2m

==> v2beta1/HorizontalPodAutoscaler
istio-egressgateway   2m
istio-ingressgateway  2m
istio-policy          2m
istio-telemetry       2m
istio-pilot           2m

==> v1alpha2/kubernetes
attributes  2m

==> v1alpha2/logentry
accesslog     2m
tcpaccesslog  2m

==> v1beta1/MutatingWebhookConfiguration
istio-sidecar-injector  2m

==> v1alpha2/attributemanifest
istioproxy  2m
kubernetes  2m

==> v1/ServiceAccount
istio-galley-service-account            2m
istio-egressgateway-service-account     2m
istio-ingressgateway-service-account    2m
istio-grafana-post-install-account      2m
istio-mixer-service-account             2m
istio-pilot-service-account             2m
prometheus                              2m
istio-security-post-install-account     2m
istio-citadel-service-account           2m
istio-sidecar-injector-service-account  2m

==> v1beta1/ClusterRole
istio-galley-istio-system                 2m
istio-egressgateway-istio-system          2m
istio-ingressgateway-istio-system         2m
istio-grafana-post-install-istio-system   2m
istio-mixer-istio-system                  2m
istio-pilot-istio-system                  2m
prometheus-istio-system                   2m
istio-citadel-istio-system                2m
istio-security-post-install-istio-system  2m
istio-sidecar-injector-istio-system       2m

==> v1beta1/ClusterRoleBinding
istio-galley-admin-role-binding-istio-system            2m
istio-egressgateway-istio-system                        2m
istio-ingressgateway-istio-system                       2m
istio-grafana-post-install-role-binding-istio-system    2m
istio-mixer-admin-role-binding-istio-system             2m
istio-pilot-istio-system                                2m
prometheus-istio-system                                 2m
istio-citadel-istio-system                              2m
istio-security-post-install-role-binding-istio-system   2m
istio-sidecar-injector-admin-role-binding-istio-system  2m

==> v1alpha3/DestinationRule
istio-telemetry  2m
istio-policy     2m

==> v1/ConfigMap
istio-galley-configuration              2m
istio-grafana-custom-resources          2m
istio-grafana-configuration-dashboards  2m
istio-grafana                           2m
istio-statsd-prom-bridge                2m
prometheus                              2m
istio-security-custom-resources         2m
istio                                   2m
istio-sidecar-injector                  2m

==> v1beta1/Deployment
istio-galley            2m
istio-ingressgateway    2m
istio-egressgateway     2m
grafana                 2m
istio-telemetry         2m
istio-policy            2m
istio-pilot             2m
prometheus              2m
istio-citadel           2m
servicegraph            2m
istio-sidecar-injector  2m
istio-tracing           2m

==> v1alpha2/rule
tcpkubeattrgenrulerule  2m
kubeattrgenrulerule     2m
stdiotcp                2m
stdio                   2m
promhttp                2m
promtcp                 2m

==> v1alpha2/stdio
handler  2m


