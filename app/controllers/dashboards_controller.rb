class DashboardsController < ApplicationController
  def show
    @events = Event.all
    @upcoming_events = Event.where("end_time > ?", DateTime.now) || [] 
    @past_events = Event.where("end_time <= ?", DateTime.now) || []
    session[:first_name] = current_admin.full_name.split.first
    session[:last_name] = current_admin.full_name.split.last
    session[:email] = current_admin.email
    begin
      user_role_int = User.where(email: current_admin.email).first.role
      session[:user_role] = Role.where(id: user_role_int).first.role_description
      session[:current_user_id] = User.where(email: current_admin.email).first.id
    rescue
      if current_admin.full_name == "Test Admin"
        session[:user_role] = 'Admin'
      elsif current_admin.full_name == "Test Member"
        session[:user_role] = 'Member'
      else
        session[:user_role] = "Pending"
      end
      session[:current_user_id] = nil 
    end
  end

  #to get to member page
  def member
    @events = Event.all 
  end
end