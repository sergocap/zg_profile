class MessagesController < ApplicationController
  before_action :authenticate_user!
  def index
    @messages = current_user.messages.order('created_at DESC').page(params[:page]).per(20)
  end

  def destroy
    Message.find(params[:id]).destroy
    respond_to do |format|
      format.js
    end
  end
end
