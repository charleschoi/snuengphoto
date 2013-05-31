class UserController < ApplicationController
  def login_process
    if user = User.find_by_email(params[:userid])
      if user.password_hash == params[:password]
        session[:user_id] = user.email
        redirect_to :controller => 'photo', :action => 'register'
      else
        redirect_to :root
      end
    else
      redirect_to :root
    end
  end
  def logout
    reset_session
    redirect_to :root
  end

  def find_pw_send
  end

  def reset_pw
  end

  def join_process
    user = User.new
    user.email = params[:userid]
    user.password_hash = params[:password]
    user.activated = true
    if user.save
      session[:user_id] = user.email
      redirect_to "/photo/register"
    else
      render :text => "Join Error"
    end
  end
end
