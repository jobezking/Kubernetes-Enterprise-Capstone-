# Week 1 Labs 
kubectl get nodes
kubectl config get-contexts
kubectl get pods -A
kubectl create namespace dev
kubectl create namespace staging
kubectl create namespace prod
kubectl config set-context --current -n dev
kubectl config get-contexts
kubectl create deployment sample-app --image=nginx:1.27 --port=80 --replicas=2
kubectl create service clusterip sample-app --tcp=80:80
# Week 2 Labs
kubectl create deployment resource-demo --replicas=2 --image=nginx:latest --dry-run=client -o yaml > resource-demo.yaml # add resources and requests
kubectl apply -f resource-demo.yaml
kubectl top nodes
kubectl top pods
kubectl taint nodes node01 key1=value1:NoSchedule
kubectl taint nodes node01 key1=value1:NoSchedule-
kubectl taint nodes node01 ops=value1:NoSchedule
kubectl run toleration-demo --image=nginx --dry-run=client -o yaml > toleration-demo.yaml
apiVersion: v1
kind: Pod
metadata:
  labels:
  name: toleration-demo
spec:
  containers:
  - image: nginx
    name: toleration-demo
  tolerations:
  - key: "key1"
    operator: "Equal"
    value: "ops"
    effect: "NoSchedule"
kubectl create deployment scale --image=httpd
kubectl autoscale deployment scale --cpu=50% --min=1 --max=5