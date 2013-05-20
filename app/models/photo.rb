class Photo < ActiveRecord::Base
  attr_accessible :description, :photo_abc, :photo_real_name, :photo_saved_name, :title, :user_id, :when, :where
end
