class SessionsController < ApplicationController

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.find_by_credentials(params[:user][:username], params[:user][:password])

    if @user
      login!(@user)
      redirect_to cats_url
    else
      flash.now[:errors] = ['WRONG CREDENTIALS']
      render :new
    end
  end

end
