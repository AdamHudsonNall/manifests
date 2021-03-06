# K8 Manifests / Charts

helm dep update

kubectl apply -f https://raw.githubusercontent.com/coreos/prometheus-operator/master/example/prometheus-operator-crd/alertmanager.crd.yaml
kubectl apply -f https://raw.githubusercontent.com/coreos/prometheus-operator/master/example/prometheus-operator-crd/prometheus.crd.yaml
kubectl apply -f https://raw.githubusercontent.com/coreos/prometheus-operator/master/example/prometheus-operator-crd/prometheusrule.crd.yaml
kubectl apply -f https://raw.githubusercontent.com/coreos/prometheus-operator/master/example/prometheus-operator-crd/servicemonitor.crd.yaml

## Reference

https://github.com/helm/charts/tree/master/stable
https://github.com/argoproj/argo-helm
https://github.com/vmware/kube-fluentd-operator
https://github.com/NVIDIA/gpu-operator
https://github.com/banzaicloud/logging-operator
https://banzaicloud.com/docs/one-eye/logging-operator/fluentbit/
https://github.com/NVIDIA/gpu-monitoring-tools
https://rook.io/docs/rook/v1.3/ceph-quickstart.html
https://longhorn.io/docs/0.8.0/getting-started/quick-start-with-helm/
https://github.com/milvus-io/milvus-helm
https://milvus.io/docs/v0.9.0/about_milvus/overview.md
https://marquezproject.github.io/marquez/
https://github.com/mlflow/mlflow
https://github.com/mlrun/mlrun
https://github.com/K-Phoen/dark
https://github.com/argoproj/argo/blob/f33624d67d0cf348dcdece46832081346c26bf80/examples/volumes-emptydir.yaml

## kubeVirt

https://kubevirt.io/user-guide/#/README
https://kubevirt.io/user-guide/#/installation/installation
https://github.com/kubevirt/kubevirt/releases

export KUBEVIRT_VERSION=$(curl -s https://api.github.com/repos/kubevirt/kubevirt/releases|grep tag_name|sort -V | tail -1 | awk -F':' '{print $2}' | sed 's/,//' | xargs | cut -d'-' -f1)
wget  https://github.com/kubevirt/kubevirt/releases/download/${KUBEVIRT_VERSION}/kubevirt-operator.yaml
kubectl apply -f kubevirt-operator.yaml
wget https://github.com/kubevirt/kubevirt/releases/download/${KUBEVIRT_VERSION}/kubevirt-cr.yaml
kubectl apply -f kubevirt-cr.yaml
curl -L -o virtctl https://github.com/kubevirt/kubevirt/releases/download/${KUBEVIRT_VERSION}/virtctl-${KUBEVIRT_VERSION}-linux-amd64
chmod +x virtctl
kubectl get pods -n kubevirt

https://github.com/gardener/machine-controller-manager/blob/master/docs/design/README.md

## to investigate

https://rook.io/docs/rook/v1.3/
https://longhorn.io/docs/0.8.0/
https://www.kubeflow.org/docs/components/training/tftraining/
https://github.com/elastic/helm-charts/tree/master/elasticsearch
https://cert-manager.io/docs/
https://github.com/jetstack/kube-oidc-proxy



- name: Loki
type: prometheus
url: http://loki:3100
access: proxy
isDefault: false