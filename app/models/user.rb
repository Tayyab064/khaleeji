class User < ApplicationRecord
	validates_uniqueness_of :email
	has_secure_password

	has_secure_token :token
	has_secure_token :password_reset_token
	
	enum gender: [:male , :female]
	enum role: [:end_user , :owner , :admin]

	has_many :purchases , dependent: :destroy
	has_many :courses , foreign_key: "instructor_id" ,dependent: :destroy

end
