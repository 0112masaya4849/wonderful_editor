require "rails_helper"

RSpec.describe Article, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
   context "title を指定しているとき" do
    it "記事が作られる" do
      user = create(:user)  # テスト用のUserオブジェクトを作成する
      article = build(:article, user: user)  # userを関連付けたarticleオブジェクトを作成する
      expect(article).to be_valid
    end
  end

  context "title を指定していないとき" do
    it "記事作成に失敗する" do
    end
  end

  context "まだ同じ名前の title が存在しないとき" do
    it "記事が作られる" do
    end
  end

  context "すでに同じ名前の title が存在しているとき" do
    it "記事作成に失敗する" do
    end
  end
end
