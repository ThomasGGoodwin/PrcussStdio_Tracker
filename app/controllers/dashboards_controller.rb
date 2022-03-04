class DashboardsController < ApplicationController
  def show
    @events = Event.all
  end

  #to get to member page
  def member 
  end

    
  #render "events/index"
end