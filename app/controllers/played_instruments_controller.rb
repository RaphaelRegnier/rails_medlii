class PlayedInstrumentsController < ApplicationController
  def create
    @played_instrument = PlayedInstrument.new(played_instrument_params)

  end

  def destroy
    @played_instrument = PlayedInstrument.find(params[:id])
    @played_instrument.destroy
  end

  private

  def played_instrument_params
    params.require(:played_instrument).permit(:level, :instrument_id, :user_id)
  end
end
