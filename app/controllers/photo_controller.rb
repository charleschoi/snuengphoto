#coding=utf-8
class PhotoController < ApplicationController
	http_basic_authenticate_with name: "charles", password: "1342", except: :index
  def index
    reset_session
  end

  def register
    if session[:user_id] == nil
      redirect_to :root
    end
    @user = User.find_by_email(session[:user_id])
  end

  def register_process
		if session[:user_id] == nil
			redirect_to :root
		else
			if params[:photo].nil?
				render :text => "<script>alert('사진을 업로드 해주세요.');location.href = '/photo/register'; </script>"
			else
				if params[:photo].content_type =~ /image|jpg|jpeg|png|gif|bmp/
					photo = Photo.new
					photo.user_id = User.find_by_email(session[:user_id]).id
					photo.title = params[:title]
					photo.where = params[:where]
					photo.when = params[:when]
					photo.description = params[:description]
					photo.photo_saved_name = Time.now.to_i.to_s + "_" + rand(36**20).to_s(36) + File.extname(params[:photo].original_filename)
					photo.photo_real_name = params[:photo].original_filename
					File.open(Rails.root.join('public/data', photo.photo_saved_name), 'wb') do |file|
						file.write(params[:photo].read)
					end
					if photo.save
						redirect_to :action => "register" 
					else
						render :text => "Error"
					end
				else
					render :text => "<script>alert('사진파일 형식이 잘못되었습니다.');location.href = '/photo/register'; </script>"
				end
			end
		end
  end

  def del
	  if User.find_by_email(session[:user_id]).id == Photo.find(params[:id]).user_id
			del_to_photo = Photo.find(params[:id])
			del_to_photo.destroy
			redirect_to :action => "register"
		else
			render :text => "Wrong!!"
		end
	end

  def result
  end
end
