# app/controllers/articles_controller.rb
class ArticlesController < ApplicationController
  before_action :set_article, only: [ :show, :edit, :update, :destroy ]
  before_action :authenticate_user!, only: [ :new, :create, :edit, :update, :destroy ]
  before_action :authorize_author!, only: [ :edit, :update, :destroy ]

  def index
    @articles = Article.order(created_at: :desc).page(params[:page]).per(5)
  end

  def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.build(article_params)
    if @article.save
      redirect_to @article, notice: "記事が作成されました！"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show; end

  def edit; end

  def update
    if @article.update(article_params)
      redirect_to @article, notice: "記事が更新されました！"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_url, notice: "記事は削除されました！"
  end

  private

  def set_article
    @article = Article.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path, alert: "記事が見つかりませんでした。"
  end

  def article_params
    params.require(:article).permit(:title, :description, :body, :tag_list)
  end

  def authorize_author!
    return if @article.author == current_user

    redirect_to root_path, alert: "この操作を実行する権限がありません。"
  end
end
