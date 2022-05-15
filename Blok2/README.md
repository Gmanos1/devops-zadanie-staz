# Blok 2
## Treść zadania
### **Blok 2 - Kubernetes** 
Terraform - w ramach przyznanych darmowych srodków z GCP  
1. zamów klaster kubernetes z 2 workerami (https://cloud.google.com/kubernetes engine) 
2. Wykonaj komendę "kubectl get nodes -o wide" i jej wynik zachowaj w pliku i załącz  do odsyłanych odpowiedzi  
3. Uruchom deployment Nginx w k8s z punktu 1 który: 
    - będzie miał scale=2 
    - będzie współdzielił dysk PV zamontowany w /var/www/data który będzie  zawierał stronę startową w nginx 
4. Opublikuj deployment Nginx za pomocą k8s ingress 
5. (*dodatkowe) zamów do opublikowanego adresu ingress certyfikat SSL Let's Encrypt.  Wykonaj komendę: 
"kubectl describe secret \[nazwa-secretu-z-certyfikatem\]" 
jej wynik załącz w odpowiedziach

## Rozwiązanie
#### **_Wyniki poleceń zostały wysłane w załączniku w emailu._**

Link do strony głównej nginxa, z szyfrowaniem: 
[https://zadanie-na-staz-devops.org/](https://zadanie-na-staz-devops.org/)

Na GCP dodatkowo został dodatkowo zamówiony dysk PV, do zamontowania w nim wolumenu, statyczny adres IP dla kontrolera Ingress i nazwa domenowa.

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