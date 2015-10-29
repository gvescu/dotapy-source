class MatchesController < ApplicationController

	def profile
		@user = User.find(params[:id])
		heroes = MatchDetail.select("dota_hero_id, count(dota_hero_id) as times_played").where(user_id: @user.id).group("dota_hero_id").order("times_played DESC").limit(3)
		@most_used_heroes = []
		if heroes.length > 0 && !heroes.first.dota_hero_id.blank?
			heroes.each do |h|
				@most_used_heroes << DotaHero.find(h.dota_hero_id)
			end
		end
		@country = Country.new(@user.location.gsub(" ", "").split(",").last) rescue nil
		@last_matches = MatchDetail.where(user_id: @user.id).order("created_at DESC").limit(5)
		render layout: 'profile'
	end

end