class UsersController < ApplicationController
  require 'pry'
  skip_before_action :require_login, only: [:new, :create]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @blah = "sad"

    if @user.happiness == nil
      @user.happiness = 0
    elsif @user.happiness >= 3
      @blah = "happy"
    end

    @blah
  end


    private

    def user_params
      params.require(:user).permit(:name, :password, :happiness, :nausea, :tickets, :height, :admin)
    end

end
