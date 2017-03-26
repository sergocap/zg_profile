class RegistrationsController < Devise::RegistrationsController
  def update
    super
    resource.after_database_authentication
  end
end
