class SessionsController < ApplicationController
  def new
  end

  def create
   @user = User.find_by(username:params[:session][:username])
   if @user && @user.authenticate(params[:session][:password])
    redirect_to tweets_path
    login(@user.id)
   else
    flash.now[:message] = 'Password/username incorrect'
    render 'new'
   end
  end
end
