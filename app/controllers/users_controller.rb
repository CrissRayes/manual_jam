class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit

  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id 
        format.html { redirect_to root_path, notice: "Usuario creado" }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html {redirect_to user_url(@user), notice: "Usuario actualizado"}
      else
        format.html { render :edit, status: :unprocessable_entity }
    end
  end

    def destroy
      @user.destroy
      respond_to do |format|
        format.html { redirect_to users_url, notice: "Usuario eliminado" }
      end
    end


  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password) 
  end

end
