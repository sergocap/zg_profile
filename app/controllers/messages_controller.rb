class MessagesController < ApplicationController
  before_filter :authenticate_user!
  def index
    @messages = current_user.messages
  end

  def destroy
    Message.find(params[:id]).destroy
    respond_to do |format|
      format.js
    end
  end
end