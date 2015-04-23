class Post < ActiveRecord::Base
	belongs_to :user
	has_one :cat

	validates :type, 				:presence => true,
													:length => { :maximum => 4}
	validates :title 				:presence => true,
													:length => { :maximum => 60}
	validates :description	:length => {:maximum => 500}
	validates :image				:length => {:maximum => 65535}
	validates :location 		:length => {:location}

	scope :newest_first, lambda {order("post.created_at DESC")}
end
