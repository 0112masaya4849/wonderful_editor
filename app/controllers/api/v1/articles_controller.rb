class Api::V1::ArticlesController < Api::V1::BaseApiController
  before_action :set_article, only: %i[show update destroy]

  # GET /articles
  # GET /articles.json
  def index
    articles = Article.order(updated_at: :desc)
    render json: articles, each_serializer: ArticlePreviewSerializer
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    @article = Article.find(params[:id])
    render json: @article, each_serializer: ArticleSerializer
  end

  # POST /articles
  # POST /articles.json
  def create
    article = current_user.articles.create!(article_params)
    render json: article, serializer: Api::V1::ArticleSerializer
  end

  private

    def article_params
      params.require(:article).permit(:title, :body)
    end

  private

  # def article_params
  #   params.require(:article).permit(:title, :body)
  # end


  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    # 対象のレコードを探す
    @article = Article.find(params[:id])
    # 探してきたレコードに対して変更を行う
    @article.update!(article_params)
    # json として値を返す
    render :show
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article).permit(:title, :body)
    end
end
