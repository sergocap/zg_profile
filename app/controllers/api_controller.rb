class ApiController < ActionController::Base
  def mail_organization_to_draft
    user_id = params['user_id']
    organization_title = params['organization_title']
    organization_link = params['organization_link']
    ApiMailer.organization_to_draft(user_id, organization_title, organization_link).deliver
    render json: {organization_title: params['organization_title']}, status: 200
  end

  def mail_organization_to_public
    render json: {organization_title: params['organization_title']}, status: 200
  end
end
