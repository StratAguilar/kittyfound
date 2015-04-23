class Cat < ActiveRecord::Base
	belongs_to :post

	validates :color, 		:length => { :maximum => 20}
	validates :breed, 		:length => { :maximum => 50}
	validates :size, 			:length => { :maximum => 12}
	validates :coat, 			:length => { :maximum => 12}
	validates :age, 			:length => { :maximum => 12}
	validates :sex, 			:length => { :maximum => 8}

end
