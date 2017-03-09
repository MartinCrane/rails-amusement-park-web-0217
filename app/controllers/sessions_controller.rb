class SessionsController < ApplicationController

  def create
  
    user = User.find_by(name: params[:user][:name])
    if @user = user.try(:authenticate, params[:user][:password])
      session[:user_id] = @user.id
      session[:admin] = !!@user.admin
      redirect_to @user
    else
      redirect_to '/'
    end
  end

  def new
    @user = User.new
  end

  def destroy
    reset_session
    redirect_to '/'
  end

  private

  def sessions_params
    params.require(:session).permit(:name, :password)
  end

end
