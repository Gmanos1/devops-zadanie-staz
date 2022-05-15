# Blok 1
Maszyna wirtualna została zamówiona za pomocą narzędzia Terraform w GCP.

Następnie za pomocą ansible playbooka (zadanie-playbook.yml), została skonfigurowana zgodnie z punktami z bloku 1.

Na uruchomionej maszynie zostały postawione 2 kontenery LXC z uruchomioną aplikacją napisaną we Flasku (flaskapp.py, wsgi.py), zostały zainstalowane serwery nginx i skonfigurowane do pracy jako proxy (nginx.conf).