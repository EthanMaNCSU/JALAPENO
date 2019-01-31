class SessionsController < ApplicationController
  def new
  end
  def create
    if params[:user]=='Recruiter'
      user = Recruiter.find_by(email: params[:session][:email].downcase)
    elsif params[:user]=='JobSeeker'
      user = JobSeeker.find_by(email: params[:session][:email].downcase)
    elsif params[:user]=='Admin'
      user = Admin.find_by(email: params[:session][:email].downcase)
    end

    if user && user.authenticate(params[:session][:password])
      log_in user,params[:user]
      redirect_to user
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end
  def destroy
    log_out
    redirect_to root_url
  end
end
