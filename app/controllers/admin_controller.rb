class AdminController < ApplicationController
  def index
    authenticate!
    @bars = Bar.all
  end
end
