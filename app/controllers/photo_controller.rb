class PhotoController < ApplicationController
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
    photo = Photo.new
    photo.user_id = params[:user_id]
    photo.title = params[:title]
    photo.where = params[:where]
    photo.when = params[:when]
    photo.description = params[:description]
    if photo.save
      redirect_to :action => "register" 
    else
      render :text => "Error"
    end
  end

  def del
    del_to_photo = Photo.find(params[:id])
    del_to_photo.destroy
    redirect_to :action => "register"
  end

  def result
  end
end
