# README

Requer 
- Ruby 2.6.2 ou mais recente
- Docker 2.1.0.3

Para executar:

- Suba o banco com `docker-compose up`
- Rode `bundle` na pasta
- rode `rails db:setup` para criar o banco corretamente
- rode `rails db:migrate` para executar a migração que cria a tabela users

Utilizando:

- rode o servidor com `rails s`
- Abra `/app/FORM_XML.html` para enviar um XML no servidor para criar um usuário
- abra `localhost:3000/users?login=usuario` para realizar uma busca com login==usuario (ou substitua pelo que você criou)

Dicas:
- Utilize um programa como Datagrip ou o próprio terminal para fazer select na tabela `users`
- Teste um XML Injection criando na form: 
    - usuario: `user`
    - senha:  `password</password></user><user><login>LoginMalicioso</login><password>SenhaMaliciosa</password></user><user><login>teste</login><password>teste
`
- Teste uma SQL injection utilizando: `http://localhost:3000/users?login=%27)%20OR%201=1--`
