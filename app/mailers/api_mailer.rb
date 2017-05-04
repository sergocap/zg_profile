class ApiMailer < ActionMailer::Base
  default from: Settings['mail.from']
  layout 'mailer'

  def send_from_remote(user, subject, body)
    mail to: user.email, subject: subject, body: body
  end
end
