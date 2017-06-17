class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(params[:name])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def destroy
  end
end
