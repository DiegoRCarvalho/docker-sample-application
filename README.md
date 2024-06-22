# Docker

## Construindo uma imagem

Criar uma imagem chamada app baseadas nos arquivos do diretório atual.

```bash
docker build -t app .
```

## Criar um container

Criar um container a partir da imagem de nome app, criada acima e rodar o shell no modo interativo.

```bash
docker run -it app sh
```