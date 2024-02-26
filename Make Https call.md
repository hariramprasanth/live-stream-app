# TO make kubernetes services use https protocal

## Setup domain in Route 53
1. Buy a domain or use the existing one
2. Create a hosted Zone

3. Now add the Nameserver in the hosted zone to domain register list

4. Now try do `dig NS <domain> +short`

## Create Certificate with ACM
1. go to ACM
2. Request a certificate
3. give `*.<domain>` as fqdn, and Validatiion method as DNS Validation
4. it will be in pending  state
6. Click create records in route 53 and done
7. It will take some time (5 mins) to approved


### Route Traffic from domain to ELB
1. Create a `A Record ` of ls-app.< domain > route to aws resource ELB using alias.


## Without Istio
1. Create a kubernetes service object with acm annotation with acm arn. It will make ELB termiante https call at ELB.  The call fro ELB to cluster is http
2. In frontned use the `ls-app.< domain >` as it directly connected to the ELB and it again in turns conneect directly the backend service

## With Istio
1. Modify Istio `ingress gateway service` object by adding the annotation with ACM arn. It will also terminate the https call at ELB
2. In virtual service and gateway add the `ls-app.< domain >` as the host. 
3. In the virtual service do the path based routing s-app for the < `<domain >/ls-backend` and route to intended backend service
4. In the frontend make `ls-app.< domain >/ls-backend` as the base url.