class AdminController < ApplicationController
	http_basic_authenticate_with :name => "charles", :password => "1342"
  def index
		@users = User.all
  end
end
