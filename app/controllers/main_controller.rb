class MainController < ApplicationController

	before_filter :is_admin_user, only: [:available_players, :balancing]
	layout "home"

	def index
		@articles = Article.where("hidden = 'f' and deleted = 'f'").order("created_at DESC").limit(6)
		@spinner = Article.most_important(5)
	end

	def staff
		render layout: "staff"
	end

	def privacy
		render layout: "privacy"
	end

	def available_players
		require 'geoip'
		@players = User.all.order("lower(nickname) ASC")
		render layout: 'blank'
	end

	def season2
		render layout: 'new_blank'
	end

	def balancing
		unless params[:players].nil?
			players, ranked, unranked = [], [], []
			@team1 = []
			@team2 = []
			10.times do |i|
				u = User.find(params[:players]["user_#{i+1}".to_sym].to_i)
				if u.ranking.nil?
					unranked << u
				else
					ranked << u
				end
			end
			ranked.sort! { |a,b| a.ranking.current_position <=> b.ranking.current_position }
			unranked.sort! { |a,b| a.created_at <=> b.created_at }
			players = (ranked + unranked).flatten
			@team1 << players.first.nickname << players.last.nickname << players[2].nickname << players[7].nickname << players[4].nickname
			@team2 << players[1].nickname << players[8].nickname << players[3].nickname << players[6].nickname << players[5].nickname
			# @team1 = @team1.join("<br>")
			# @team2 = @team2.join("<br>")
			respond_to do |format|
				format.js
				return
			end
		end
		@allowed = User.order("lower(nickname) asc")
		render layout: 'blank'
	end

end
