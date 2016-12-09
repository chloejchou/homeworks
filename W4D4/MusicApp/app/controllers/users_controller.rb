class UsersController < ApplicationController
  def show
    @user = User.find_by(id: params[:id])
    render :show
  end

  def new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in_user!(@user)
      redirect_to bands_url
    else
      flash.now[:messages] = @user.errors.full_messages
      render :new
    end
  end

  def user_params
    params.require(:users).permit(:email, :password)
  end
end
