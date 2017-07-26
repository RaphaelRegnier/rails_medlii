class ConversationsController < ApplicationController
  before_action :set_conversation, only: [:refresh_messages, :destroy]
  def new
    @conversation = Conversation.new
    @conversation.user1 = current_user
  end

  def create

    other_user = User.find(params[:conversation][:user2].to_i)

    first_posibility = Conversation.where(user1: current_user, user2: other_user)
    second_posibility = Conversation.where(user2: current_user, user1: other_user)

    if first_posibility.length.zero? && second_posibility.length.zero?

      @conversation = Conversation.new()

      @conversation.user1 = current_user
      @conversation.user2 = other_user

      respond_to do |format|
        if @conversation.save
          format.html { redirect_to conversation_path(@conversation), notice: 'Conversation was successfully created.' }
        else
          format.html { render :new }
        end
      end

    else

      if !first_posibility.length.zero?
        redirect_to conversation_path(first_posibility.last)
      else
        redirect_to conversation_path(second_posibility.last)
      end

    end
  end

  def index
    @conversations = Conversation.where("user_1_id = ? or user_2_id = ?", current_user.id, current_user.id)
  end

  def show
      set_conversation
      @message = Message.new
  end

  def update
    respond_to do |format|
      if @conversation.update(conversation_params)
        format.html { redirect_to @conversation, notice: 'Conversation was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @conversation.destroy
    respond_to do |format|
      format.html { redirect_to conversations_url, notice: 'Conversation was successfully destroyed.' }
    end
  end

  def refresh_messages
    if !params[:last_message_id].nil? &&
     last_message = @conversation.messages.find(params[:last_message_id])
     @messages = @conversation.messages.where("created_at > ?", last_message.created_at)
    else
      @messages = @conversation.messages
     respond_to do |format|
       format.js
     end
    end
  end

  private

  def set_conversation
    @conversation = Conversation.find(params[:id])
  end

end
