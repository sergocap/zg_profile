class Manage::ApplicationController < ActionController::Base
  layout 'manage'

  def namespace
    @current_namespace ||= controller_path.split('/').first.capitalize
  end

  def current_ability
    @current_ability ||= Ability.new(current_user, namespace)
  end
end
