class NotificationsMailer < ActionMailer::Base

  default :from => "elena.burnos@gmail.com"
  default :to => "elena.burnos@gmail.com"

  def new_message(message)
    @message = message
    mail(:subject => "[Overseas.tld] #{message.subject}")
  end

end