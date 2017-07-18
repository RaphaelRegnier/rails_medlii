class PlayedInstrumentsController < ApplicationController
  def create
    @played_instrument = PlayedInstrument.new(played_instrument_params)
    @played_instrument.instrument = Instrument.find(params[:played_instrument][:instrument])
    @played_instrument.user = current_user
    if @played_instrument.save!
      redirect_to users_path
    else
      redirect_to :back
    end

  end

  def destroy
    @played_instrument = PlayedInstrument.find(params[:id])
    @played_instrument.destroy
  end

  private

  def played_instrument_params
    params.require(:played_instrument).permit(:level)
  end
end
