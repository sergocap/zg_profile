class Manage::CountriesController < Manage::ApplicationController
  load_and_authorize_resource
  inherit_resources
end
