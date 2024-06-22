# Docker

## Imagem

### Construindo uma imagem

Criar uma imagem chamada app baseadas nos arquivos do diretório atual.

```bash
docker build -t app .
```

### Criar um container

Criar um container a partir da imagem de nome app, criada acima e rodar o shell no modo interativo.

```bash
docker run -it app sh
```

### Rodar a imagem criada

Rodar a imagem de nome app mapeando as portas 53000 na minha máquina e a porta 3000 no container.

```bash
docker run -p 53000:3000 app
```

### Acessar a aplicação

A partir de agora posso acessar a aplicação através de um browser indicando o endereço http://localhost:53000/

### Alterar a TAG de uma imagem

Alteramos a tag que por padrão é criada como latest para v1.0.0.

```bash
docker image tag app:latest app:v1.0.0
```

### Criar novas versões

```bash
docker build -t app:v1.0.1 .
docker run -p 53000:3000 app:v1.0.1
```

### Criar um backup da imagem

```bash
docker image save -o app-v1.0.1.tar app:v1.0.0
```

### Carregar um imagem de um backup

```bash
docker image load -i app-v1.0.1.tar
```

## Container

### Parâmetros importantes

- -p: definir a porta da maquina:container.
- -d: roda em plano de fundo, sem prender o terminal.
- --name: permite escolher um nome para o container.
- -v: adiciona um volume.

```bash
docker run -p 53000:3000 -d --name app-v1.0.0 -v app-dados:/app/dados app:v1.0.0 
```

### Verificar log de eventos

```bash
# Log pelo ID
docker logs -f 4a71c9a8

# Log das 10 últimas linhas
docker logs -n 10 4a71c9a8

# Logs completos do container
docker logs 4a71c9a8

# Logs com timestamp
docker logs -t 4a71c9a8
```

### Iniciar e parar um container

```bash
docker stop 4a71c9a8
docker start 4a71c9a8
```

### Remover um container

```bash
docker ps -a
docker rm -f 4a71c9a8
```