class IdentitiesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @identities = current_user.identities
  end

  def destroy
    @identity = current_user.identities.find(params[:id])
    @identity.destroy
    redirect_to identities_path
  end
end
