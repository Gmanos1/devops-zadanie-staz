# Blok 2

Link do strony głównej nginxa, z szyfrowaniem: 
[https://zadanie-na-staz-devops.org/](https://zadanie-na-staz-devops.org/)

Etapy konfiguracji klastra:

1. Nadanie uprawnień cluster-admin użytkownikowi
```
kubectl create clusterrolebinding cluster-admin-binding \
  --clusterrole cluster-admin \
  --user $(gcloud config get-value account)
```
2. Instalacja kontrolera ingress-nginx
```
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.2.0/deploy/static/provider/cloud/deploy.yaml
```
3. Deployment nginxa
```
kubectl apply -f k8s-deployment.yaml
```
4. Dodanie usługi
```
kubectl apply -f k8s-service.yaml
```
5. Dodanie ingress'a
```
kubectl apply -f k8s-ingress.yaml
```
6. Instalacja cert-managera
```
kubectl apply -f cert-manager.yaml 
```
7. Dodanie nowego dostawcy certyfikatów w oparciu o Let's Encrypt
```
kubectl apply -f k8s-cert-issuers.yaml
```
8. Utworzenie obiektu typu "Certificate", którego zadaniem jest wystawianie certyfikatów
```
kubectl apply -f k8s-certificate.yaml
```