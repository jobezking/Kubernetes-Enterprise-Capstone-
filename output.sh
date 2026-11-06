# Labs 1, 2, 3 
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