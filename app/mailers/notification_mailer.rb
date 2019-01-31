class NotificationMailer < ApplicationMailer
  default :from => 'jalatestp2@gmail.com'

  def status_change(application)
    @application = application
    mail(:to => application.job_seeker.email, subject: 'Your application status has changed')
  end
end

