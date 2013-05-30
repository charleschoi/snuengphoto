class User < ActiveRecord::Base
  attr_accessible :dept_id, :email, :find_pw_code, :name, :password_hash, :phone, :student_id
  has_many :photos
end
