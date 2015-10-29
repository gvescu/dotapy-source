class Admin::ArticlesController < ApplicationController

  before_filter :is_admin_user
  layout "admin"

  def index
    @articles = Article.where("deleted = 'f'").page(params[:page]).order("created_at DESC")
  end

  def show
    # STUB
    redirect_to edit_admin_article_path(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.slug = @article.title.parameterize if article_params[:slug].blank?
    @article.deleted = false
    if @article.save
      flash[:info] = "Artículo creado"
      redirect_to edit_admin_article_path(@article.id)
    else
      render action: :new
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update_attributes(article_params)
      flash[:info] = "Artículo actualizado"
      redirect_to edit_admin_article_path(@article.id)
    else
      render action: :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.deleted = true
    @article.save
    flash[:info] = "Artículo eliminado"
    redirect_to admin_articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :description, :user_id, :body, :slug, :tags, :priority, :hidden, :deleted, :header)
  end
end
