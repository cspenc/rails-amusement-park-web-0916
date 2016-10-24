class SessionsController < ApplicationController

  def new
  end

  def create
    session[:user_id] = params[:id]
    if params[:id] == nil || params[:id].empty?
      redirect_to '/login'
    else
      redirect_to '/'
    end
  end

  def destroy
    session.delete :id
    redirect_to '/login'
  end

end
