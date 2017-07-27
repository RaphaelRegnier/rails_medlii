class AppointmentsController < ApplicationController


def new
  @appointment = Appointment.new
end

def create
  @appointment = Appointment.create(appointment_params)
  @appointment.user_1_id = current_user.id

  if @appointment.save!
    redirect_to current_user
  else
    render :new
  end
end

  def show
    # set_appointment
    # @appointment = Appointment.new
  end


  private
  def set_appointment
    # @appointment = Appointment.find(params[:id])
  end


  def appointment_params
    params.require(:appointment).permit(:address, :date, :user_id , :conversation_id)
  end
end
