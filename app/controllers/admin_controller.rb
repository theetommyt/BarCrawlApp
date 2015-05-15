class AdminController < ApplicationController
  def index
    authenticate!
    redirect_to '/' unless current_user.is_admin
    @bars = Bar.all
  end
end
