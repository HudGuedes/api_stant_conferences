<h1>Api Stant Conferences</h1>

Primeiramente quero agradecer a oportunidade que me foi dado para realizar esse teste e demonstrar os meus conhecimentos. Este é um projeto de API que permite a realização das operações básicas de CRUD (Criar, Ler, Atualizar e Excluir) de palestras. Além disso, oferece a funcionalidade de importar dados por meio de arquivos CSV.

<h1>Tecnologias utilizadas;</h1>

- Ruby 3.0.2
- Rails 7.1.1

<h2>Bibliotecas utilizadas;</h2>

- pg: Uma interface para o banco de dados PostgreSQL.
- dotenv-rails: Para carregar variáveis de ambiente.
- csv: Biblioteca para manipulação de arquivos CSV.
- rack-cors: Configuração de políticas de compartilhamento de recursos entre origens (CORS).
- byebug: Uma ferramenta de depuração para Ruby.

<h2>Modo de utilizar;</h2>

- Clone o projeto em sua máquina.
- Crie um arquivo `.env` na pasta raiz do projeto e insira as credenciais do seu banco de dados PostgreSQL, como no exemplo abaixo:

```
DB_USERNAME='seu usuário'
DB_PASSWORD='sua senha'
DB_HOST='seu host'
DB_PORT='sua porta'
DB_NAME=stant_conferences
```

Após isto, execute os seguintes comandos:
```
bundle install
rails db:create
rails db:migrate
rails s
```
<h2>Testando as requisições via HTTP</h2>

Testando as Requisições via HTTP
Para testar as requisições via HTTP, siga as instruções abaixo:

<h3>POST</h3>

- Modifique o cabeçalho para que o tipo de conteúdo seja JSON.
- Use a URL: http://localhost:'sua_porta'/lectures/.
- Insira o seguinte JSON:
```
{
	"name": "sua_escolha",
	"duration" : sua_escolha
}
```
Envie a solicitação e aguarde o status 200 OK.

<h3>GET</h3>

- Use a URL: http://localhost:'sua_porta'/lectures/.
Envie a solicitação e aguarde o status 200 OK.

<h3>PUT/PATCH</h3>

- Use a URL com o ID: http://localhost:'sua_porta'/lectures/'id'.
- Insira o seguinte JSON:
```
{
	"name": "sua_modificação",
	"duration" : sua_modificação
}
```
Envie a solicitação e aguarde o status 200 OK.

<h3>DELETE</h3> 

- Use a URL com o ID: http://localhost:'sua_porta'/lectures/'id'.
Envie a solicitação e aguarde o status 204 OK.
