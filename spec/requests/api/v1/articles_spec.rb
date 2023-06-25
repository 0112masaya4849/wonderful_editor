require "rails_helper"

RSpec.describe "Api::V1::Articles", type: :request do
  describe "GET /articles" do
    subject { get(api_v1_articles_path) }

    let!(:article1) { create(:article, updated_at: 1.days.ago) }
    let!(:article2) { create(:article, updated_at: 2.days.ago) }
    let!(:article3) { create(:article) }

    it "記事の一覧が取得できる" do
      subject
      res = JSON.parse(response.body)

      expect(response).to have_http_status(:ok)
      expected_ids = [article3.id, article1.id, article2.id]
      actual_ids = res.map { |d| d["id"] }

      expect(actual_ids.sort).to eq(expected_ids.sort)
    end
  end
  describe "GET /articles/:id" do
    subject { get(api_v1_articles_path(article_id)) }

    context "指定した id のユーザーが存在する場合" do
      let(:article) { create(:article) }
      let(:article_id) { article.id }

      it "そのユーザーのレコードが取得できる" do
        subject
        res = JSON.parse(response.body)
        expect(response).to have_http_status(200)
        #binding.pry
        expect(res[0]["id"]).to eq article.id
        expect(res[0]["title"]).to eq article.title
      end
    end
  end
  describe "POST /articles" do
    subject { post(api_v1_articles_path, params: params) }

    let(:params) { { article: attributes_for(:article) } }
    let(:current_user) { create(:user) }

    # stub
    before { allow_any_instance_of(Api::V1::BaseApiController).to receive(:current_user).and_return(current_user) }

    it "記事のレコードが作成できる" do
      expect { subject }.to change { Article.where(user_id: current_user.id).count }.by(1)
      res = JSON.parse(response.body)
      expect(res["title"]).to eq params[:article][:title]
      expect(res["body"]).to eq params[:article][:body]
      expect(response).to have_http_status(:ok)
    end
  end
end
