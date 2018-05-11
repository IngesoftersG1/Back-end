class SessionsController < ApplicationController
  def create
    user = GoogleUser.from_omniauth(env["omniauth.auth"])
    if user.email_confirmed
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash.now[:error] = 'Por favor activa tu cuenta siguiendo las 
      instrucciones del correo de confirmación para continuar'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
