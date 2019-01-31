module SessionsHelper
  def log_in(user,identity)
    session[:user_id] = user.id
    session[:identity]=identity
  end
  def admin?
    session[:identity]=="Admin"
  end
  def recruiter?
    session[:identity]=="Recruiter"
  end
  def job_seeker?
    session[:identity]=="JobSeeker"
  end
  def join_company?
    current_user.company_id.nil?
  end
  def current_user
    if session[:identity]=='Recruiter'
      @current_user ||= Recruiter.find_by(id: session[:user_id])
    elsif session[:identity]=='JobSeeker'
      @current_user ||= JobSeeker.find_by(id: session[:user_id])
    elsif session[:identity]=='Admin'
      @current_user ||= Admin.find_by(id: session[:user_id])
    end
  end
  def current_user?(user)
    user == current_user
  end
  def logged_in?
    !current_user.nil?
  end
  def log_out
    session.delete(:user_id)
    session.delete(:identity)
    @current_user = nil
  end
  def current_company
    current_user.company_id
  end

end
