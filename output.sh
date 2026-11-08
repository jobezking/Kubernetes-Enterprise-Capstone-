# Week 1-2 Labs 
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
# Week 3-4 Labs
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
kubectl events
kubectl events -A
# Week 5-6 Labs
kubectl create deployment stateless --image=nginx --port=80
kubectl create service clusterip stateless --tcp=80:80
kubectl scale deployment stateless --replicas=4
kubectl create configmap stateless --from-literal=ENV=dev
kubectl create secret generic stateless --from-literal=PASSWORD=example123
kubectl edit deployment stateless
spec:
  template:
    spec:
      containers:
      - name: nginx
        image: nginx
        env:
        - name: ENV
          valueFrom:
            configMapKeyRef:
              name: stateless
              key: ENV

        - name: PASSWORD
          valueFrom:
            secretKeyRef:
              name: stateless
              key: PASSWORD
kubectl set image deployment/stateless nginx=nginx:latest
kubectl rollout status deployment/stateless
kubectl rollout history deployment/stateless
kubectl set image deployment/stateless nginx:latest=httpd