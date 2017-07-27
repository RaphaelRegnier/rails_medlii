class AppointmentsController < ApplicationController

def index
  @appointments = Appointment.all
end

def new
  @appointment = Appointment.new
  @conversation = Conversation.find(params[:conversation_id])
end

def create
  @appointment = Appointment.create(appointment_params)
  @appointment.user_id = current_user.id
  @conversation = Conversation.find(params[:conversation_id])
  @appointment.conversation_id = @conversation.id
  @appointment.save!
  redirect_to conversation_path(@conversation)
end

def show
  set_appointment
  @appointment = Appointment.new
end


private
def set_appointment
  @appointment = Appointment.find(params[:id])
end

def set_conversation
  @conversation = Conversation.find(params[:conversation_id])
end

def appointment_params
  params.require(:appointment).permit(:address, :date)
end
end
