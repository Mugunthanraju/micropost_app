class SessionsController < ApplicationController
  
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user&.authenticate(params[:session][:password])
      if user.activated?
        # Login the user and redirects to user's page.
        log_in user
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        flash.now[:success] = "Welcome - #{user[:name]}"
        # redirect_to user_url(@user)
        redirect_back_or user
      else
        flash.now[:warning] = "Account not activated. Check your email for the activation link."
        redirect_to root_url
      end
    else
      # Create an error message
      if user
        if !user.authenticate(params[:session][:password])
          flash.now[:danger] = "Invalid email/password combination!"
        end
      else
        flash.now[:danger] = "User not found!"
      end
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

end
