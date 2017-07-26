class AppointmentsController < ApplicationController


  def new
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.new(appointment_params)
    @appointment.user_id = current_user.id
    if @appointment.save?
      redirect_to appointment_path
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
      params.require(:appointment).permit(:address, :date, :user_id )
    end
  end
