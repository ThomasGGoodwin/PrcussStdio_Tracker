class DashboardsController < ApplicationController
  def show
    @events = Event.all
    @upcoming_events = Event.where("end_time > ?", DateTime.now) || [] 
    @past_events = Event.where("end_time <= ?", DateTime.now) || []
    begin
      user_role_int = User.where(email: current_admin.email).first.role
      session[:user_role] = Role.where(id: user_role_int).first.role_description
    rescue
      session[:user_role] = "None"
    end
  end

  #to get to member page
  def member
    @events = Event.all 
  end
end