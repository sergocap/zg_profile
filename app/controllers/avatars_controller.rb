class AvatarsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_avatar

  def edit
  end

  def update
    @avatar.attributes = avatar_params
    if @avatar.save
      @avatar.user.after_database_authentication
      flash['notice'] = 'Аватар успешно выбран'
    else
      flash['alert'] = 'При выборе аватара произошла ошибка'
    end

    redirect_to :edit_avatar
  end

  private

  def find_avatar
    @avatar = current_user.avatar
  end

  def avatar_params
    params.require(:avatar).permit(:identity_id)
  end
end
