class RankingsController < ApplicationController

	layout "ranking"

	def rankings
		@ranking = Ranking.page(params[:page]).order("current_position ASC")
		@page_title = "Ranking general"
	end

	def carry_rankings
		@ranking = CarryRanking.page(params[:page]).order("current_position ASC")
		@page_title = "Ranking de carries"
		render :rankings
	end

	def support_rankings
		@ranking = SupportRanking.page(params[:page]).order("current_position ASC")
		@page_title = "Ranking de supports"
		render :rankings
	end

	def mid_rankings
		@ranking = MidRanking.page(params[:page]).order("current_position ASC")
		@page_title = "Ranking de midders"
		render :rankings
	end

	def offlane_rankings
		@ranking = OfflaneRanking.page(params[:page]).order("current_position ASC")
		@page_title = "Ranking de offlanes"
		render :rankings
	end

end