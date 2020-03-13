class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to session[:request_url] || root_path, notice: 'Добро пожаловать! Успешный вход.'
    else
      render 'new', alert: 'Проверьте свои email и пароль'
    end
  end

  def destroy
    reset_session
    redirect_to root_path, notice: 'Вы вышли'
  end
end
