# Significa que o Docker vai utilizar uma distribuição do Linux Alpine, com o Nodejs versão 12 instalada.
FROM node:12-alpine

# Indica que dentro da imagem o diretório de trabalho escolhido será o /app
WORKDIR /app

# Criar um usuário sem poderes de Root para executar as tarefas abaixo.
# Criar um grupo dev para dar permissões específicas.
# O usuário criado irá entrar no grupo dev.
# RUN addgroup -S dev && adduser -S -G dev nomeusuario
# Dar as permissões necessárias ao grupo dev.
# RUN chmod -R g+x /app
# Informar ao Docker qual usuário irá executar os comandos a partir daqui.
# USER nomeusuario

# Para melhorar a performace, nesse trecho iremos copiar apenas o package.json, se houver alterações nele o Docker irá entender que deve rodar novamente
# as instalações abaixo, caso contrário irá utilizar o que está no cache da instalação anterior e irá pular direto para o comando de cópia. Dessa forma,
# a construção da imagem será muito mais rápida e não vai reinstalar as bibliotecas quando mudarmos o código fonte da aplicação, a reinstalação só vai 
# ocorrer se adicionarmos alterações no package.json 
COPY package.json .

# Caso o arquivo que desejamos copiar não esteja na nossa máquima, mas sim na internet, então devemos usar o comando ADD ao invés do copy.
# ADD https://microsoft.com/test.json /app/
# Ou utilizando o ponto para se referir ao diretório onde o arquivo será colado.
# ADD https://microsoft.com/test.json .

# Outra funcionalidade do ADD é descompactar arquivos que estão em nossa máquina e colar o conteúdo na imagem.
# ADD /home/diego/test.zip /app/

# Para a aplicação rodar, precisamos instalar no S.O. da imagem os pacotes: python2, g++ e make
# Para instalar um pacote no Alpine o gerenciador de pacotes é o apk, no Ubuntu o apt e no Fedora o yum.
# O parâmetro --no-cache é para apagar o instalador após  finalizar a instalação.
RUN apk add --no-cache python2 g++ make

# O yarn é necessário para rodar a aplicação e eu me esqueci de passar essa instrução anteriormente.
RUN yarn install --production

# Copia todos os arquivos do diretório app da minha máquina para o diretório app da imagem.
# Como informamos a variável WORKDIR acima, podemos referenciar o diretório de trabalho apenas informando um ponto(.).
# O comando abaixo copia o primeiro ponto, ou seja, tudo que está no diretório de trabalho da minha máquina, e cola no segundo ponto que significa o diretório de trabalho da imagem.
COPY . .

# Inseri na imagem, a variável de ambiente que estamos passando. ENV key=value
# ENV API_URL=https://api.test.com/

# Depois que a imagem é iniciada e todas as dependências instaladas, devemos executar o aplicativo.
# O RUN é executado apenas na construção da imagem, o CMD é executado sempre que inicializamos a imagem.
# CMD ["Executável" , "Parâmetros"]
CMD [ "node", "src/index.js" ]




# Indica a porta aberta no container
EXPOSE 3000