# TO make kubernetes serve https

## Setup domain in Route 53
1. Buy a domain or use the existing one
2. Create a hosted Zone

3. Now add the Nameserver in the hosted zone to domain register list

4. Now try do `dig NS <domain> +short`

## Create Certoficate with ACM
1. go to ACM
2. Request a certificate
3. give `*.<domain>` as fqdn, and Validatiion method as DNS Validation
4. it will be in pending  state
6. Click create records in route 53 and done
7. It will take some time (5 mins) to approved
8. Copy the arn of the ACM certifcate and use it in kubernetes service object annotation. It will add certificates to ELB created by k8 service object. So it will terminate ssl at ELB and route traffic to kubernets cluster in http.

### Route Traffic from domain to ELB
1. Create a `A Record ` of ls-app.< domain > route to aws resource ELB using alias.
2. In frontend use this URL as the base url for backend.