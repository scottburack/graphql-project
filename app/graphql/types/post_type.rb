class Types::PostType < Types::BaseObject
  description "A blog post"

  field :id, ID, null: false
  field :user, Types::UserType, null: false, description: "The author of the post"
  field :body, String, null: true, description: "The contents of the post"

  field :created_at, String, null: false
  def created_at
    object.created_at.iso8601 # easily parsed by Javascript
  end

  field :comments, [Types::CommentType], null: true, description: "Comments to this post"
end
