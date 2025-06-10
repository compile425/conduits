# app/controllers/conduits_controller.rb
class ConduitsController < ApplicationController
  before_action :set_conduit, only: [ :show_article, :edit_article, :update_article, :destroy_article ]
  before_action :authenticate_user!, only: [ :new_article, :create_article, :edit_article, :update_article, :destroy_article ]
  before_action :set_conduit, only: [ :show_article, :edit_article, :update_article, :destroy_article ]
  before_action :authorize_author!, only: [ :edit_article, :update_article, :destroy_article ]
  def home
    @conduits = Conduit.order(created_at: :desc).page(params[:page]).per(5)
  end

  def new_article
    @conduit = Conduit.new
  end

  def show_article
    begin
      @conduit = Conduit.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to root_path, alert: "記事が見つかりませんでした。"
      nil
    end
  end

  def edit_article
    begin
      @conduit = Conduit.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to root_path, alert: "記事が見つかりませんでした。"
      nil
    end
  end

  def create_article
    @conduit = Conduit.new(conduit_params)
    @conduit = current_user.conduits.build(conduit_params)
    if @conduit.save
      redirect_to article_detail_path(@conduit.id), notice: "記事が作成されました！"
    else
      render :new_article, status: :unprocessable_entity
    end
  end

  def update_article
    begin
      @conduit = Conduit.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to root_path, alert: "記事が見つかりませんでした。"
      return
    end

    if @conduit.update(conduit_params)
      redirect_to article_detail_path(@conduit.id), notice: "記事が更新されました！"
    else
      render :edit_article, status: :unprocessable_entity
    end
  end

  def destroy_article
    begin
      @conduit = Conduit.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to root_path, notice: "削除する記事が見つかりませんでした。"
    end

    @conduit.destroy
    redirect_to root_path, notice: "記事は削除されました！"
  end

  private

  def set_conduit
    begin
      @conduit = Conduit.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to root_path, alert: "記事が見つかりませんでした。"
    end
  end

  def conduit_params
    params.require(:conduit).permit(:title, :description, :body, :tag_list)
  end

  def authorize_author!
    unless @conduit.author == current_user
      redirect_to root_path, alert: "この操作を実行する権限がありません。"
    end
  end
end
