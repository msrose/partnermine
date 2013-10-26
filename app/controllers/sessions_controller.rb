class SessionsController < ApplicationController
  def new
    redirect_to user_url(current_user) if signed_in?
  end

  def create
    user = User.find_by_email(params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      flash[:success] = 'Sign in successful.'
      sign_in(user)
      self.current_user = user
      redirect_to user_url(user)
    else
      flash[:error] = 'Invalid email/password combination.'
      render :new
    end
  end
end
