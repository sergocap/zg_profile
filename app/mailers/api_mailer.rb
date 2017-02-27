class ApiMailer < ActionMailer::Base
  default from: Settings['app']['from']
  layout 'mailer'

  def organization_to_draft(user_id, organization_title, organization_link)
    @user = User.find user_id
    @organization_title = organization_title
    @organization_link = organization_link
    mail to: @user.email, subject: '[ZnaiGorod] Ваша организация попала в черновики'
  end
end
