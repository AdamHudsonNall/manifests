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