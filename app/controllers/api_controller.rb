class ApiController < ActionController::Base
  def send_mail
    user = User.find params['user_id']
    subject = params['subject']
    body = params['body']
    user.messages.create subject: subject, body: body
    ApiMailer.send_from_remote(user, subject, body).deliver
    render json: {}, status: 200
  end
end
