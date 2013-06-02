#coding=utf-8
class User < ActiveRecord::Base
  attr_accessible :dept_id, :email, :find_pw_code, :name, :password_hash, :phone, :student_id
  has_many :photos

	validates :email, :format => { :with => /^[a-zA-Z0-9._+-]*$/,
		:message => "올바른 이메일 아이디를 적어주세요" }
	validates :email, :length => { :in => 3..20,
		:message => "3이상 20자 이하입니다" }
	validates :email, :presence => true
	validates :email, :uniqueness => true

	def dept
		case dept_id
		when 1
			"건설환경공학부"
		when 2
			"기계항공공학부"
		when 3
			"재료공학부"
		when 4
			"전기정보공학부"
		when 5
			"컴퓨터공학부"
		when 6
			"화학생물공학부"
		when 7
			"건축학과"
		when 8
			"산업공학과"
		when 9
			"에너지자원공학과"
		when 10
			"원자핵공학과"
		when 11
			"조선해양공학과"
		when 12
			"기타"
		else
			"없음"
		end
	end

end
