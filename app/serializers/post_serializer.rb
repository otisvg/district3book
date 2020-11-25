class PostSerializer < ActiveModel::Serializer
  attributes :message, :created_at, :updated_at, :user_id
end
