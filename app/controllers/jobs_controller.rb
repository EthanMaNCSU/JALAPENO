class JobsController < ApplicationController
  before_action :chosen_a_company, only: [:new,:create]
  def index
    @jobs = Job.search(params).paginate(page: params[:page])
  end
  def new
    @job=Job.new
  end
  def show
    @job=Job.find(params[:id])
  end
  def create
    @job=Job.new(job_params)
    if @job.save
      flash[:success] = "Job created!"
      redirect_to @job
    else
      render 'new'
    end
  end
  def edit
      @job = Job.find(params[:id])
  end
  def update
    @job = Job.find(params[:id])
    if @job.update_attributes(job_params)
      redirect_to @job
    else
      render 'new'
    end
  end
  def destroy
    Job.find(params[:id]).destroy
    flash[:success] = "Job deleted"
    redirect_to jobs_url
  end
  private
  def job_params
    params.require(:job).permit(:description, :responsibility, :requirement, :employment_type, :company_id)
  end
  def chosen_a_company
      if recruiter?&&current_company.nil?
        flash[:danger] = "Please choose a company first."
        redirect_to companies_path
      end
  end
end
