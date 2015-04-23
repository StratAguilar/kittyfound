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
													:length => 255,
													:format => EMAIL_REGEX
													:confirmation => true
	validate :phone, 				:length => { :maximum => 10}
	validate :type,					:presence => true,
													:length => { :maximu => 3}
end
