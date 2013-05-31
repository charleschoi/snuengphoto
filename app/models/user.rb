class User < ActiveRecord::Base
  attr_accessible :dept_id, :email, :find_pw_code, :name, :password_hash, :phone, :student_id
  has_many :photos

  validates_uniqueness_of :email,
    :message => "이미 등록된 메일주소입니다."
  validates_format_of :email,
    :with => /^[a-zA-Z0-9._+-]*$/,
    :message => "서울대 이메일(아이디)의 형식이 올바르지 않습니다."
  validates_presence_of :email
    :message => "서울대 이메일(아이디)는 빈칸일 수 없습니다."

end
