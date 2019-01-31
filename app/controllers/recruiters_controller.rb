class RecruitersController < ApplicationController
  before_action :logged_in_user, only: [:index,:edit, :update,:show, :update_company_id]
  before_action :correct_user,   only: [:edit, :update, :update_company_id]
  before_action :must_be_admin,  only: [:destroy]
  include SessionsHelper

  def index
    @recruiters = Recruiter.paginate(page: params[:page])
  end
  def new
    @recruiter = Recruiter.new
  end
  def show
    @recruiter = Recruiter.find(params[:id])
  end
  def create
    @recruiter = Recruiter.new(recruiter_params)
    if @recruiter.save
      log_in @recruiter,'Recruiter' unless admin?
      flash[:success] = "Welcome to the JALAPENO!"
      redirect_to @recruiter
    else
      render 'new'
    end
  end
  def edit
    @recruiter = Recruiter.find(params[:id])
  end

  def update
    @recruiter = Recruiter.find(params[:id])
    if @recruiter.update_attributes(recruiter_params)
      flash[:success] = "Profile updated"
      redirect_to @recruiter
    else
      render 'edit'
    end
  end
  def destroy
    Recruiter.find(params[:id]).destroy
    flash[:success] = "Recruiter deleted"
    redirect_to recruiters_url
  end

  def update_company_id
    @recruiter = Recruiter.find params[:id]
    @recruiter.update_attributes(company_id:params[:real_company_id])
    redirect_to @recruiter
  end

  private
  def recruiter_params
    params.require(:recruiter).permit(:name, :email, :password, :password_confirmation)
  end
  def logged_in_user
    unless logged_in?
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end
  def correct_user
    @recruiter = Recruiter.find(params[:id])
    redirect_to(root_url) unless @recruiter == current_user||admin?
  end
  def must_be_admin
    unless admin?
      flash[:danger] = "Not allowed!"
      redirect_to(root_url)
    end
  end
end
