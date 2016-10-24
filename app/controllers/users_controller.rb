class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    redirect_to user_path(@user)
  end

  def show
    @user = User.find(params[:id])
    if @user.happiness >= 3
      @blah = "happy"
    else
      @blah = "sad"
    end
    @blah
  end


    private

    def user_params
      params.require(:user).permit(:name, :password, :happiness, :nausea, :tickets, :height, :admin)
    end

end
