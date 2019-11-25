class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  def show
    payload = params[:login]

    @user = User.where("login = '#{payload}'").to_a
  end

  def create
    xml = params[:xml]
    p '-------------'
    Hash.from_xml(xml)["users"].each do |elem|
      if elem.second.kind_of?(Array)
        elem.second.each do |user|
          p 'Novo Usuario:'
          p 'Login: ' + user['login']
          p 'Senha: ' + user['password']
          p '-------------'
          User.create!(login: user['login'], password: user['password'])
        end
      else
        p 'Novo Usuario:'
        p 'Login: ' + elem.second['login']
        p 'Senha: ' + elem.second['password']
        p '-------------'
        User.create!(login: elem.second['login'], password: elem.second['password'])
      end
    end
  end
end
