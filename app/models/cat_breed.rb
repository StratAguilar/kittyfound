class CatBreed < ActiveRecord::Base

	validates :breed, 		:presence => true,
												:length => { :maximum => 30}
	validates :coat, 			:length => { :maximum => 40}
	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100#" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validates_attachment_file_name :image, :matches => [/png\Z/, /jpe?g\Z/]
  
end
