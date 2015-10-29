class Article < ActiveRecord::Base

	belongs_to :user

	self.per_page = 15

	has_attached_file 	:header,
						path: ':rails_root/public/images/articles/:class/:id/:style/:filename',
						url: '/images/articles/:class/:id/:style/:filename',
						:styles => {
							:index => "400x300#",
							:spinner => "1000x450#",
							:fb_thumb_large => "1200x630#",
							:article => "720x378"
						},
						:default_url => "missing/article/:style.jpg",
						:convert_options => {
							:index => "-quality 75 -strip",
							:spinner => "-quality 75 -strip",
							:fb_thumb_large => "-quality 75 -strip",
							:article => "-quality 75 -strip"
						}
	validates_attachment_content_type :header, :content_type => /\Aimage/

	def self.most_important(num = 0)
		where("priority > 0").order("priority DESC").limit(num)
	end
	
end
