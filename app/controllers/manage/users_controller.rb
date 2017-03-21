class Manage::UsersController < Manage::ApplicationController
  load_and_authorize_resource
  inherit_resources

  def index
    @users = User.order(:surname).page(params[:page]).per(20)
  end

  def add_role
    @user.roles.create(value: params[:role])
    redirect_to :back
  end

  def delete_role
    Role.find(params[:role_id]).destroy
    redirect_to :back
  end
end
