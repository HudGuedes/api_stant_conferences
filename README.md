<h1>Api Stant Conferences</h1>

Primeiramente quero agradecer a oportunidade que me foi dado para realizar esse teste e demonstrar os meus conhecimentos. Essa API se refere há um CRUD, aonde o usuário pode criar, excluir e editar palestras e além de importar os dados por arquivo CSV.

<h1>Tecnologias utilizadas;</h1>

- Ruby 3.0.2
- Rails 7.1.1 

<h1>Modo de utilizar;</h1>

Primeiramente clone o projeto para sua máquina e crie um arquivo .env na pasta raiz do projeto e coloque as credenciais do seu banco de dados PostgreSQL. Por exemplo:

DB_USERNAME='seu usuário'
DB_PASSWORD='sua senha'
DB_HOST='seu host'
DB_PORT='sua porta'
DB_NAME=stant_conferences

Após isto, rode os seguintes comandos:

- bundle install
- rails db:create
- rails db:migrate
- rails s

<h1>Testando as requisições via HTTP</h1>

Modifique para que o texto seja em JSON, no URL insira a seguinte URL: http://localhost:'sua_porta'/lectures/

- POST
para testar o POST, insira o seguinte texto:
{
	"name": "sua_escolha",
	"duration" : sua_escolha
}
Envie e retorne o status 200 OK.

- GET
para testar o GET, insira o URL http://localhost:'sua_porta'/lectures/ e envie. Retorne o status 200 OK

- PUT
para testar o PUT, insira o URL com o id http://localhost:'sua_porta'/lectures/'id' e insira o seginte texto:
{
	"name": "sua_modificação",
	"duration" : sua_modificação
}
Envie e retorne o status 200 OK.

- DELETE 
para testar o DELETE, insira o URL com o id http://localhost:'sua_porta'/lectures/'id' e envie, retorne o status 204 OK.
