class AppointmentsController < ApplicationController

  def index
    @appointments = Appointment.all
    @hash = Gmaps4rails.build_markers(@appointments.uniq) do |appointment, marker|
      marker.lat appointment.latitude
      marker.lng appointment.longitude
    end
  end

  def new
    @appointment = Appointment.new
    @conversation = Conversation.find(params[:conversation_id])
  end

  def create
    @conversation = Conversation.find(params[:conversation_id])

    @appointment = Appointment.create(appointment_params)
    @appointment.user_id = current_user.id
    @appointment.user_2_id = @conversation.user_2_id
    @appointment.conversation_id = @conversation.id

    @appointment.save!
    redirect_to conversation_appointments_path(@conversation)
  end

  def show
    # set_appointment
    # @appointment = Appointment.new
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