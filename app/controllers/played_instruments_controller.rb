class PlayedInstrumentsController < ApplicationController

  def new
    @instruments = Instrument.all
    @played_instrument = PlayedInstrument.new()
  end

  def create
    @played_instrument = PlayedInstrument.new(played_instrument_params)
    @played_instrument.instrument = Instrument.find(params[:played_instrument][:instrument])
    @played_instrument.user = current_user
    if @played_instrument.save
      respond_to do |format|
        format.html { redirect_to add_instruments_path }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { render 'add_instruments' }
        format.js  # <-- idem
      end
    end
  end

  def destroy
    @played_instrument = PlayedInstrument.find(params[:id])

    if @played_instrument.destroy
      respond_to do |format|
        format.html { redirect_to add_instruments_path }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
    end
  end

  private

  def played_instrument_params
    params.require(:played_instrument).permit(:level, :user_id, :instrument_id)
  end
end
