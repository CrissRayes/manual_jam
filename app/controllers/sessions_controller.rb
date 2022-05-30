class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      format.html { redirect_to root_path, notice: 'Logeado correctamente' }
    else
      format.html { render :new, notice: "Email o password inválida" }
    end
  end

  def destroy
    session[:user_id] = nil
    format.html { redirect_to root_url, notice: 'Signed out exitósamente' }
  end
end
