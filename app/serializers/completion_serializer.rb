class CompletionSerializer < ActiveModel::Serializer
  attributes :id, :completed_at, :created_at, :link, :media_type,
    :summary, :title, :updated_at
end
