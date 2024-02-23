# TO install istio on cluster
1. Install istioctl on local `curl -L https://istio.io/downloadIstio | sh -`
2. It will has bin folder
3. Add the PATH to that bin `export PATH=$PWD/bin:$PATH`. (It depends on OS)
4. Install istio to cluster by `istioctl install --set profile=demo -y`
5. Enable istio on namespace by `kubectl label namespace default istio-injection=enabled`

## URL
1. In virtual service and istio gateway object, give url of istio-ingress load balancer url as hosts