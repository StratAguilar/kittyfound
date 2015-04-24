class Post < ActiveRecord::Base
	belongs_to :user
	has_one :cat

	validates :post_type, 	:presence => true,
													:length => { :maximum => 4}
	validates :title, 			:presence => true,
													:length => { :maximum => 60}
	validates :description,	:presence => true,
													:length => { :maximum => 500}
	validates :city, 				:presence => true,
													:length => { :maximum => 50}

	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100#" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validates_attachment_file_name :image, :matches => [/png\Z/, /jpe?g\Z/]

  scope :lost, lambda { where(:post_type => 0)}
  scope :found, lambda { where(:post_type => 1)}
  scope :newest_first, lambda { order("posts.created_at DESC")}
end
