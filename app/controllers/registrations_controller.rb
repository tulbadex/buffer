class RegistrationsController < ApplicationController
  def new
    @user = User.new
  end

  def create

    # render plain: params[:user]
    # params
    @user = User.new(user_params)
    if @user.save
        login @user
        redirect_to root_path, notice: "Registration Successfully"
    else
        # flash[:alert] = "Something went wrong"
        render :new, status: :unprocessable_entity
    end
    
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
