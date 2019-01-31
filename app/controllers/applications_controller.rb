class ApplicationsController < ApplicationController
  before_action :logged_in_user, only: [:index,:create, :destroy,:show]
  before_action :correct_user, only: [:destroy]

  def index
    @applications=Application.paginate(page: params[:page])
  end
  def new
    @application=Application.new
  end
  def show
    @application=Application.find(params[:id])
  end


  def create
    @application=Application.new(application_params)
    if @application.save
      flash[:success] = "Application created!"
      redirect_to @application
    else
      render 'new'
    end
  end

  def edit
    @application = Application.find(params[:id])
  end
  def update
    @application = Application.find(params[:id])
    if params[:status]=="Resume received"
      @application.status = "Resume received"
    elsif params[:status]=="Hired"
      @application.status = "Hired"
    elsif params[:status]=="Not selected"
      @application.status = "Not selected"
    end
    if @application.update_attributes(application_params)
      flash[:success] = "Application information updated"
      redirect_to @application
      case @application.status
        when "Resume received","Hired","Not selected"
          NotificationMailer.status_change(@application).deliver_now
      end
    else
      render 'new'
    end
  end
  def destroy
    Application.find(params[:id]).destroy
    flash[:success] = "Application deleted"
    redirect_to applications_url
    end
  private
  def application_params

    params.require(:application).permit(:current_company, :linkedin_url, :portfolio_url, :additional_information, :gender, :race, :veteran_status, :disability_status, :job_id, :job_seeker_id,:status, :document)
  end
  def correct_job_seeker
    @application = current_user.applications.find_by(id: params[:id])
    redirect_to applications_url if @application.nil?
    params.require(:application).permit(:current_application, :linkedin_url, :portfolio_url, :additional_information, :gender, :race, :veteran_status, :disability_status, :application, :job_seeker_id, :job_id,:document)
  end
  def correct_user
    @application = Application.find(params[:id])
    redirect_to(root_url) unless (@application.job_seeker_id == current_user.id)||admin?
  end
end
