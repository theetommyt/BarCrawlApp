class SessionsController < ApplicationController

  def log_in
    drinker = Drinker.find_by(drinkername: params[:drinkername])
    if drinker && drinker.authenticate( params[:password] )
      session[:drinker_id] = drinker.id
      redirect_to "/profile"
      # skip_before_filter  :verify_authenticity_token
    else
      redirect_to "/"
    end
  end

  def log_out
    session[:drinker_id] = nil
    redirect_to "/"
  end

end
