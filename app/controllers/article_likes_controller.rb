class ArticleLikesController < ApplicationController
  before_action :set_article_like, only: %i[show update destroy]

  # GET /article_likes
  # GET /article_likes.json
  def index
    @article_likes = ArticleLike.all
  end

  # GET /article_likes/1
  # GET /article_likes/1.json
  def show
  end

  # POST /article_likes
  # POST /article_likes.json
  def create
    @article_like = ArticleLike.new(article_like_params)

    if @article_like.save
      render :show, status: :created, location: @article_like
    else
      render json: @article_like.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /article_likes/1
  # PATCH/PUT /article_likes/1.json
  def update
    if @article_like.update(article_like_params)
      render :show, status: :ok, location: @article_like
    else
      render json: @article_like.errors, status: :unprocessable_entity
    end
  end

  # DELETE /article_likes/1
  # DELETE /article_likes/1.json
  def destroy
    @article_like.destroy
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_article_like
      @article_like = ArticleLike.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def article_like_params
      params.fetch(:article_like, {})
    end
end
