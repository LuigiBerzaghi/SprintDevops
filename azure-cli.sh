#!/bin/bash

# 1. Criar grupo de recursos
az group create --name devops-rg --location brazilsouth

# 2. Criar VM e capturar IP público
IP=$(az vm create \
  --resource-group devops-rg \
  --name devops-vm \
  --image Ubuntu2204 \
  --admin-username rm555516 \
  --authentication-type password \
  --admin-password 'RM555516@Fiap' \
  --size Standard_B1s \
  --location brazilsouth \
  --query publicIpAddress \
  --output tsv)

# 3. Abrir a porta 8080
az vm open-port --resource-group devops-rg --name devops-vm --port 8080 --priority 1001

# 4. Aguardar a VM iniciar
echo "Aguardando a VM iniciar..."
sleep 25

# 5. Acessar VM e instalar Docker + liberar uso sem sudo
ssh -o StrictHostKeyChecking=no rm555516@$IP << EOF
  sudo apt update && sudo apt upgrade -y
  sudo apt install docker.io -y
  sudo usermod -aG docker rm555516
EOF

# 6. Gerar o .jar localmente
cd trackyard || exit
mvn clean package
cd ..

# 7. Copiar JAR e Dockerfile para a VM
scp trackyard/target/trackyard-0.0.1-SNAPSHOT.jar Dockerfile rm555516@$IP:~

# 8. Acessar a VM novamente e rodar o container
ssh rm555516@$IP << EOF
  docker build -t trackyard-api .
  docker run -d -p 8080:8080 --name trackyard-container trackyard-api
EOF

# 9. Exibir link de acesso
echo "=============================="
echo "✅ API disponível em: http://$IP:8080/api/motos"
echo "=============================="
