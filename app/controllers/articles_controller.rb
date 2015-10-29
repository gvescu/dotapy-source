class ArticlesController < ApplicationController

	def index
		@articles = Article.where("deleted = 'f'").page(params[:page]).order("created_at DESC")
		render layout: "articles"
	end

	def show
		@article = Article.find_by_id(params[:id].to_i)
		if @article.nil?
			redirect_to root_path
		else
			render layout: "article"
		end
	end
end
