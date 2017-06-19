class LoginController < ApplicationController
  layout false


  def login
    redirect_to :action => "index", :controller => "events"  if session[:user_id]
  end

  def check
    @user=User.where(:email => params[:email], :password => params[:password])
    if !(@user.blank?)
      session[:role] = @user.last.role
      session[:user_id] = @user.last.id
      redirect_to :action => "index", :controller => "events"
    else
      redirect_to root_path
    end
  end

  def sign_out
    session[:user_id] = nil
    session[:role] = nil
    reset_session
    redirect_to root_path
  end

end