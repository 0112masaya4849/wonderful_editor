class ArticlePreviewSerializer < ActiveModel::Serializer
  attributes :id, :title, :updated_at
  belongs_to :user, serializer: UserSerializer
end
