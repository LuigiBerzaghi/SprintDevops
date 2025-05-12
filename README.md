# Trackyard API

**Alunos**:&#x20;

-Luigi Berzaghi - RM555516

-Cauã Dos Santos Souza - RM559093

-Guilherme Pelissari Feitosa - RM558445 

---

---

## Passo a passo para execução

### 1. Clone o projeto

```bash
git clone https://github.com/LuigiBerzaghi/SprintDevops.git
cd SprintDevops
```

### 2. Execute o script de provisionamento

```bash
bash azure-cli.sh
```

Após isso esse script cria a VM na Azure, instala Docker, envia o JAR e sobe a API automaticamente.

Aguarde a execução completa até aparecer algo como:

```
==============================
 API em execução na nuvem!
 Acesse: http://<IP_PUBLICO>:8080/api/motos
==============================
```

## Testes de API

Esses dois exemplos abaixo realizam operações GET do nosso CRUD para mostrar alguns inserts feitos através do arquivo data.sql dentro de nosso projeto.

Acesse no navegador ou via `curl`:

```bash
http://<IP_PUBLICO>:8080/api/motos
http://<IP_PUBLICO>:8080/api/patios
```

---

---

## Finalizando

Após os testes, para evitar uso desnecessário de créditos na Azure, devemos **deletar a VM** com o comando:

```bash
az vm delete --resource-group devops-rg --name devops-vm --yes
```

Ou **remover o grupo inteiro** (recomendado):

```bash
az group delete --name devops-rg --yes --no-wait
```
