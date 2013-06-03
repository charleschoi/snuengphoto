#coding=utf-8
require 'digest/md5'
class UserController < ApplicationController
  def login_process
    if user = User.find_by_email(params[:userid])
      if user.password_hash == Digest::MD5.hexdigest(params[:password])
        session[:user_id] = user.email
        redirect_to :controller => 'photo', :action => 'register'
      else
			render :text => "<script>alert('아이디 또는 비밀번호가 일치하지 않습니다.');location.href = '/'; </script>"
      end
    else
			render :text => "<script>alert('아이디 또는 비밀번호가 일치하지 않습니다.');location.href = '/'; </script>"
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
		if params[:password] != params[:password_confirm]
			render :text => "<script>alert('비밀번호 확인이 일치하지 않습니다.');location.href = '/'; </script>"
		else
			user = User.new
			user.email = params[:userid]
			user.password_hash = Digest::MD5.hexdigest(params[:password])
			user.name = params[:realname]
			user.dept_id = params[:dept_id]
			user.student_id = params[:student_id]
			user.phone = params[:phone]
			user.activated = true
			if user.save
				session[:user_id] = user.email
				redirect_to "/photo/register"
			else
				render :text => "<script>alert('이미 존재하는 계정입니다. 문의 cyc@snu.ac.kr');location.href = '/'; </script>"
				flash[:notice] = "이미 존재하는 계정입니다. 문의 cyc@snu.ac.kr"
				#redirect_to :root
			end
		end
  end

	def modify
		@info = User.find_by_email(session[:user_id])
		if @info.nil?
			render :text => "please login"
		end
	end
	def modify_process
		user = User.find_by_email(session[:user_id])
		user.name = params[:name]
		user.phone = params[:phone]
		user.student_id = params[:student_id]
		user.save
		redirect_to "/photo/register"
	end
end
