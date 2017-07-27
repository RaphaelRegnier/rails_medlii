class AppointmentsController < ApplicationController


  def new
    @appointment = Appointment.new
    @user_1 = current_user.id
  end

  def create

    @appointment.user1 = current_user
    @appointment.user2 = other_user
    @other_user = conversation_id_
    @appointment = Appointment.create(appointment_params)
    if @appointment.save
      redirect_to conversation_path(@conversation)
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
