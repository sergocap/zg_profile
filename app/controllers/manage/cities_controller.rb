class Manage::CitiesController < Manage::ApplicationController
  load_and_authorize_resource
  inherit_resources
  before_action :find_country, only: [:new, :edit]

  def new
    new! { render partial: 'form' and return }
  end

  def create
    create! { manage_country_path(@city.country) }
  end

  def destroy
    country = @city.country
    @city.destroy
    redirect_to manage_country_path(country)
  end

  private

  def find_country
    @country = Country.find(params[:country_id])
  end

  def city_params
    params.require(:city).permit([:country_id, :title, :public])
  end
end
