class Types::CommentType < Types::BaseObject
  description "A blog post comment"

  field :id, ID, null: false
  field :body, String, null: true, description: "The body of the comment"

  field :created_at, String, null: false
  def created_at
    object.created_at.iso8601 # easily parsed by Javascript
  end

end