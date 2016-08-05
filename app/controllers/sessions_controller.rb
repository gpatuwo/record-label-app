class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_crendentials(
            params[:user][:email],
            params[:user][:password])
    if user.nil?
      flash.now[:errors] = ["Wrong credentials"]
      render :new
    else
      login!(user)
      redirect_to user_url(user.id)
    end
  end

  def destroy
    logout!
    redirect_to bands_url
  end

end
