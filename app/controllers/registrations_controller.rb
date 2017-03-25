class RegistrationsController < Devise::RegistrationsController
  before_action :countries_load, only: [:new]

  def update
    super
    resource.after_database_authentication
  end

  def countries_load
    @countries = VkApi.get_countries
  end
end
