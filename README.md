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

## Rodar a imagem criada

Rodar a imagem de nome app mapeando as portas 53000 na minha máquina e a porta 3000 no container.

```bash
docker run -p 53000:3000 app
```

## Acessar a aplicação

A partir de agora posso acessar a aplicação através de um browser indicando o endereço http://localhost:53000/