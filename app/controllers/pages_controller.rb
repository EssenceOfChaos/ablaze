class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:dashboard]
  def index
  end

  def contact
  end

  def info
  end

  def dashboard
  end
  
end
