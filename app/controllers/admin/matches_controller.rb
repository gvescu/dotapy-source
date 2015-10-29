class Admin::MatchesController < ApplicationController

	before_filter :is_admin_user
	layout "admin"

	def index
		@matches = Match.page(params[:page]).order("created_at DESC")
	end

	def show
		# STUB
		redirect_to edit_admin_match_path(params[:id])
	end

	def new
		@match = Match.new
		@heros = DotaHero.all.order("name ASC")
	end

	def create
		@match = Match.new(match_params)
		if @match.save
			flash[:info] = "Partida guardada"
			redirect_to edit_admin_match_path(@match.id)
		else
			render action: :new
		end
	end

	def edit
		@match = Match.find(params[:id])
		@heros = DotaHero.all.order("name ASC")
	end

	def update
		@match = Match.find(params[:id])
		if @match.update_attributes(match_params)
			flash[:info] = "Partida guardada"
			redirect_to edit_admin_match_path(@match.id)
		else
			render action: :edit
		end
	end

	def destroy
		@match = Match.find(params[:id])
		@match.destroy
		flash[:info] = "Partida eliminada"
		redirect_to admin_matches_path
	end

	def player_search
	end

	def generate_ranking
		unless params[:g].nil?
			Ranking.calculate_score
			flash[:info] = "Se ha generado un nuevo ránking! Puedes verlo en la página de DotaPy."
		end
	end

	def ranking
		@last_update = Ranking.order("updated_at DESC").first.updated_at.to_date rescue nil
		@ranking = Ranking.page(params[:page]).order("current_position ASC")
		@ranking_carry = CarryRanking.page(params[:carry_page]).order("current_position ASC")
		@ranking_support = SupportRanking.page(params[:support_page]).order("current_position ASC")
		@ranking_mid = MidRanking.page(params[:mid_page]).order("current_position ASC")
		@ranking_offlane = OfflaneRanking.page(params[:offlane_page]).order("current_position ASC")
	end

	def update_users
		User.update_attributes
		flash[:info] = "Lista de jugadores actualizada"
		redirect_to params[:callback]
	end

	private

	def match_params
		params.require(:match).permit(:description, :radiant_win, :match_id, :game_mode, :duration, :start_time, :user_id, match_details_attributes: [:id, :user_id, :match_id, :dota_hero_id, :player_slot, :level, :kills, :deaths, :assists, :gold, :last_hits, :denies, :role, :penalty, :gold_per_min, :xp_per_min, :_destroy])
	end



end