class DashboardsController < ApplicationController
  def show
    session[:first_name] = current_admin.full_name.split.first
    session[:last_name] = current_admin.full_name.split.last
    session[:email] = current_admin.email
    begin
      user_role_int = User.where(email: current_admin.email).first.role
      session[:user_role] = Role.where(id: user_role_int).first.role_description
      session[:current_user_id] = User.where(email: current_admin.email).first.id
    rescue
      session[:user_role] = "Pending"
      session[:current_user_id] = nil 
    end
  end

  # to get to member page
  def member 
  end

  #to get to member page
  def member 
  end
end