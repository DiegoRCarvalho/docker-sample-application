# Significa que o Docker vai utilizar uma distribuição do Linux Alpine, com o Nodejs versão 12 instalada.
FROM node:12-alpine

# Indica que dentro da imagem o diretório de trabalho escolhido será o /app
WORKDIR /app

# Copia todos os arquivos do diretório app da minha máquina para o diretório app da imagem.
# Como informamos a variável WORKDIR acima, podemos referenciar o diretório de trabalho apenas informando um ponto(.).
# O comando abaixo copia o primeiro ponto, ou seja, tudo que está no diretório de trabalho da minha máquina, e cola no segundo ponto que significa o diretório de trabalho da imagem.
COPY . .

# Caso o arquivo que desejamos copiar não esteja na nossa máquima, mas sim na internet, então devemos usar o comando ADD ao invés do copy.
# ADD https://microsoft.com/test.json /app/
# Ou utilizando o ponto para se referir ao diretório onde o arquivo será colado.
# ADD https://microsoft.com/test.json .

# Outra funcionalidade do ADD é descompactar arquivos que estão em nossa máquina e colar o conteúdo na imagem.
# ADD /home/diego/test.zip /app/