class Manage::CountriesController < Manage::ApplicationController
  load_and_authorize_resource
  inherit_resources

  def new
    new! { render partial: 'form' and return }
  end

  def show
    show! { @cities = @country.cities }
  end

  def create
    create! { manage_countries_path }
  end

  private
  def country_params
    params.require(:country).permit([:title, :public])
  end
end
