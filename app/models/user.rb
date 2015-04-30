class User < ActiveRecord::Base

	has_secure_password
	has_many :posts

	EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i

	validates :first_name,	:presence => true,
													:length => { :maximum => 25}

	validates :last_name, 	:presence => true, 
													:length => { :maximum => 50}

	validates :email, 			:presence => true,
													:uniqueness => true,
													:length => { :maximum => 255},
													:format => EMAIL_REGEX,
													:confirmation => true

	validates :username, 		:presence => true,
													:uniqueness => true,
													:length => { :maximum => 50}

	validates :phone, 			:length => { :maximum => 10}

	validates :user_type,		:presence => true,
													:length => { :maximum => 3}
	validates :password, 		:presence => true,
													:length => { :minimum => 8},
													:length => { :maximum => 30}

	validates :password_confirmation, :presence => true

end
