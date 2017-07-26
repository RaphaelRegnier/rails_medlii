class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]

  def new
     @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    @message.user_id = current_user.id
    @conversation = Conversation.find(params[:conversation_id])
    @message.conversation_id = @conversation.id

    if @message.save!
      respond_to do |format|
        format.js
      end
    end
  end

  def index
  end

  def destroy
  end

  private

  def set_message
    @message = Message.find(params[:id])
  end

  def set_conversation
    @conversation = Conversation.find(params[:conversation_id])
  end

  def message_params
      params.require(:message).permit(:conversation, :content, :conversation_id, :user_id)
  end

end



