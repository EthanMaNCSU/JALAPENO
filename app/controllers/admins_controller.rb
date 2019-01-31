class AdminsController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update,:show]
  before_action :must_be_admin,   only: [:edit, :update,:show]

  def show
    @admin = Admin.find(params[:id])
  end
  def edit
    @admin = Admin.find(params[:id])
  end
  def update
    @admin = Admin.find(params[:id])
    if @admin.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @admin
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:admin).permit(:name, :email, :password,
                                 :password_confirmation)
  end

  def logged_in_user
    unless logged_in?
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end
  def must_be_admin
      unless admin?
        flash[:danger] = "Not allowed!"
        redirect_to(root_url)
      end
  end
end
