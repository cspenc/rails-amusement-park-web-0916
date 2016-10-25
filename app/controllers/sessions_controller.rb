class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create, :index]
  def new

  end

  def create
    user = User.find_by(name: params[:user][:name])

    if user.authenticate(params[:user][:password])
      login(user)
      redirect_to user_path(user)
    else
      render :new
    end
  end

  def destroy
    session.delete :user_id
    redirect_to '/'
  end

end
