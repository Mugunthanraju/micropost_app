class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    # debugger
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params) # Paramater comes form private method below.
    if @user.save
      # Handle a successful save.
      log_in @user
      flash.now[:success] = "Welcome to Micropost"
      redirect_to user_url(@user)
    else
      render 'new'
    end 
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
