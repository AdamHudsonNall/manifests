
https://github.com/K-Phoen/dark


```sh
kubectl apply -f crd.yaml
```

Add the ClusterRole and ClusterRoleBinding to grant ServiceAccount API access to the new GrafanaDashboard resource:

```sh
kubectl apply -f cluster-role.yaml
```

Create a secret to store Grafana's API token (with `editor` access level):

Generate API token in Graphana

```sh
kubectl create secret generic dark-tokens --from-literal=grafana=eyJrIjoiZENiM2doZzBWWldJZFRPMUF4aVl0UUtJbTVuUlExeVkiLCJuIjoiZGFyayIsImlkIjoxfQ==
```

Deploy DARK's controller:

```sh
kubectl apply -f deployment.yaml
```

## Dashboard definition

Define a dashboard:

```yaml
# k8s/example-dashboard.yml
apiVersion: k8s.kevingomez.fr/v1
kind: GrafanaDashboard

metadata:
  # must be unique across dashboards
  name: example-dashboard

folder: "Awesome folder"
spec:
  title: Awesome dashboard

  shared_crosshair: true
  tags: [generated, yaml]
  auto_refresh: 10s

  variables:
    - interval:
        name: interval
        label: interval
        default: 1m
        values: [30s, 1m, 5m, 10m, 30m, 1h, 6h, 12h]

  rows:
    - name: Prometheus
      panels:
        - graph:
            title: HTTP Rate
            height: 400px
            datasource: prometheus-default
            targets:
              - prometheus:
                  query: "rate(promhttp_metric_handler_requests_total[$interval])"
                  legend: "{{handler}} - {{ code }}"
        - graph:
            title: Heap allocations
            height: 400px
            datasource: prometheus-default
            targets:
              - prometheus:
                  query: "go_memstats_heap_alloc_bytes"
                  legend: "{{job}}"
```

For more information on the YAML schema used to describe dashboards, see [Grabana](https://github.com/K-Phoen/grabana).

Apply the configuration:

```sh
kubectl apply -f example-dashboard.yml
```

And verify that the dashboard was created:

```sh
kubectl get dashboards
kubectl get events | grep dark
```

## Converting Grafana JSON dashboard to YAML

To ease the transition from existing, raw Grafana dashboards to DARK, a converter is provided.
It takes the path to a JSON dashboard and a path for the destination YAML file.

```sh
docker run --rm -it -v $(pwd):/workspace kphoen/dark-converter:latest convert-yaml -i dashboard.json -o converted-dashboard.yaml
```

## Converting Grafana JSON dashboard to a Kubernetes manifest

```sh
docker run --rm -it -v $(pwd):/workspace kphoen/dark-converter:latest convert-k8s-manifest -i dashboard.json -o converted-dashboard.yaml test-dashboard
```

```sh
kubectl exec -i -t dark-converter -- /app/dark-converter convert-k8s-manifest -i dashboard.json -o converted-dashboard.yaml test-dashboard

kubectl cp dashboard.json dark-converter:/workspace  

kubectl cp dark-converter:/workspace/converted-dashboard.yaml converted-dashboard.yaml
```