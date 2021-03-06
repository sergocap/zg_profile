class Manage::ApplicationController < ActionController::Base
  layout 'manage'

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, flash: { denied: 'Недостаточно прав для выполнения операции' }
  end

  def namespace
    @current_namespace ||= controller_path.split('/').first.capitalize
  end

  def current_ability
    @current_ability ||= Ability.new(current_user, namespace)
  end
end
