class DotaHero < ActiveRecord::Base

	has_many :match_details

	def image_url_large
		"http://media.steampowered.com/apps/dota2/images/heroes/#{self.token}_lg.png"
	end

	def image_url_small
		"http://media.steampowered.com/apps/dota2/images/heroes/#{self.token}_sb.png"
	end

	def image_url_tiny
		"http://media.steampowered.com/apps/dota2/images/heroes/#{self.token}_eg.png"
	end

end
