class ApiController < ActionController::Base
  def send_mail
    user = User.find params['user_id']
    subject = params['subject']
    body = params['body']
    user.messages.create subject: subject, body: body
    ApiMailer.send_from_remote(user, subject, body).deliver
    render json: {}, status: 200
  end

  def get_users_id_by
    ids = User.where(params[:key].to_sym => params[:value]).map(&:id)
    render json: ids, status: 200
  end

  def main_cities
    res = MainCity.all.map {|city| city.common_data }
    render json: res
  end
end
