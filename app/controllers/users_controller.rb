class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    render :show
  end

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      # log in
      # redirect to some page
      redirect_to user_url(@user.id)
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end

  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
    # params is everything that comes in from the form and also the url
  end

end
