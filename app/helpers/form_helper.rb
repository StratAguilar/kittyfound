module FormHelper
	def setup_post(post)
		post.cat ||= Cat.new
		post
	end
end