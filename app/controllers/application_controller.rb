class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  Yelp.client.configure do |config|

    config.consumer_key = '4KLg7i-FPaoD7EshsYlFig'
    config.consumer_secret = 'hOEbG_EIYZO-uQWX2BnOICw_NnU'
    config.token = 'jSoZBmusx8iq-I8zIqLPtz_SMG5dZaLY'
    config.token_secret = 'GU2kgZy7iqUpCyWcLuYnvTdMjjM'

  end

  def current_user
    if session[:drinker_id]
      @current_user = Drinker.find(session[:drinker_id])
    end
  end

  def authenticate!
    redirect_to '/' unless current_user
  end

end
