class JobSeekersController < ApplicationController
  before_action  :logged_in_job_seeker, only: [:index,:edit, :update,:show]
  before_action  :correct_job_seeker,   only: [:edit, :update]
  before_action :must_be_admin,  only: [:destroy]
  def index
    @job_seekers = JobSeeker.paginate(page: params[:page])
  end
  def show
    @job_seeker = JobSeeker.find(params[:id])
    # @application = @job_seeker.applications.paginate(page: params[:page])
    # @application = current_user.applications.build if logged_in?
    # if logged_in?
    #   @application = current_user.applications.build
    #   @feed_items = current_user.feed.paginate(page: params[:page])
    # end
  end
  def new
    @job_seeker = JobSeeker.new
  end
  def create
    @job_seeker = JobSeeker.new(job_seeker_params)
    if @job_seeker.save
      log_in @job_seeker,'JobSeeker' unless admin?
      flash[:success] = "Welcome to the JALAPENO!"
      redirect_to @job_seeker
    else
      render 'new'
    end
  end
  def edit
    @job_seeker = JobSeeker.find(params[:id])
  end


  def update
    @job_seeker = JobSeeker.find(params[:id])
    if @job_seeker.update_attributes(job_seeker_params)
      flash[:success] = "Profile updated"
      redirect_to @job_seeker
    else
      render 'edit'
    end
  end
  def destroy
    JobSeeker.find(params[:id]).destroy
    flash[:success] = "Job seeker deleted"
    redirect_to job_seekers_url
  end
  private
  def job_seeker_params
    params.require(:job_seeker).permit(:name, :email, :full_name,:phone,:password,
                                 :password_confirmation)
  end
  # 前置过滤器
  # 确保用户已登录
  def logged_in_job_seeker
    unless logged_in?
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

  # 确保是正确的用户
  def correct_job_seeker
    @job_seeker = JobSeeker.find(params[:id])
    redirect_to(root_url) unless @job_seeker == current_user||admin?
  end
  def must_be_admin
    unless admin?
      flash[:danger] = "Not allowed!"
      redirect_to(root_url)
    end
  end
end
