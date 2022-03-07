class DashboardsController < ApplicationController
  def show
    @events = Event.all
  end

  #to get to member page
  def member
    @events = Event.all 
  end
end