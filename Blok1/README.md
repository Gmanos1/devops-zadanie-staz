# Blok 1
## Treść zadania
### **Blok 1 - Infrastructure as a Code**
Za pomocą narzędzia Terraform (https://www.terraform.io/): 
1. zamów wirtualną maszynę z Debianem w GCP.  
Za pomocą narzędzia Ansible (https://docs.ansible.com/): 
2. Załóż swojego użytkownika w stworzonym systemie 
3. Skonfiguruj usługę NTP klient na stworzonym systemie i skieruj zapytania na serwer  ntp.assecobs.pl 
4. Zainstaluj pakiety userspace LXC 
5. Uruchom 2 kontenery LXC z limitem RAMu 1 GB. 
6. (*dodatkowe) Uruchom w kontenerach z pkt4 własną prostą aplikację Flask,  wyświetlającą nagłówki HTTP oraz adres IP kontenera, na którym działa aplikacja  (dwa bliźniacze kontenery - z tą samą aplikacją)

## Rozwiązanie
Maszyna wirtualna została zamówiona za pomocą narzędzia Terraform w GCP.

Następnie za pomocą ansible playbooka (zadanie-playbook.yml), została skonfigurowana zgodnie z punktami z bloku 1.

Na uruchomionej maszynie zostały postawione 2 kontenery LXC z uruchomioną aplikacją napisaną we Flasku (flaskapp.py, wsgi.py), zostały zainstalowane serwery nginx i skonfigurowane do pracy jako proxy (nginx.conf).