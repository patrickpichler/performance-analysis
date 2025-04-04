# Performance analysis tools

The goal of this repo is to provide a container image with various performance analysis
tools I use for quick use.

## How to use

### Via deployment

There is a sample deploymend under [HACK/deploy.yaml](HACK/deploy.yaml) that can shows how to run the
image on a specific node. All you need to do is to replace the `nodeName:` field in the
spec with the name of the node you want to debug.

To deploy the container, run
```sh
kubectl -n <namespace to deploy> apply -f ./HACK/deploy.yaml
```

To connect to the container you can use
```sh
kubectl -n <namespace to deploy> exec -it deploy/perf-analysis -- bash
```

To cleanup run
```sh
kubectl -n <namespace to deploy> delete -f ./HACK/deploy.yaml
```

### Via kubectl debug

Another approach would be to use `kubectl debug` like
```sh
kubectl debug node/<nodename> -it --image ghcr.io/patrickpichler/performance-analysis:latest --profile=sysadmin
```


This will run the analysis container on the node with elevated privileges. It also drops you directly into a shell.

To cleanup find the pod that was created and run
```sh
kubectl delete pod node-debugger-<pod name> --now
```
