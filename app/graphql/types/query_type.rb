module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :test_field, String, null: false,
      description: "An example field added by the generator" do
      argument :name, String, required: true
    end

    def test_field(name:)
      Rails.logger.info context[:time]
      "Hello #{name}!"
    end

    field :author, Types::AuthorType, null: true, description: "Returns one Author instance" do
      argument :id, ID, required: true
    end

    def author(id:)
      Author.where(id: id).first
    end

    field :authors, [Types::AuthorType], null: false

    def authors
      Author.all
    end
    
    field :user, Types::UserType, null: true, description: "Retrieve a user by ID" do
      argument :id, ID, required: true, description: 'A user id'
    end
  
    def user(id:)
      User.where(id: id).first
    end
  
    field :post, Types::PostType, null: true, description: "Retrieve a post by ID" do
      argument :id, ID, required: true, description: 'A post id'
    end
  
    def post(id:)
      Post.where(id: id).first
    end
  
    field :comment, Types::CommentType, null: true, description: "Retrieve a comment by ID" do
      argument :id, ID, required: true, description: 'A comment id'
    end
  
    def comment(id:)
      Comment.where(id: id).first
    end

    field :login, String, null: false, description: "Login a user" do
      argument :email, String, required: true
      argument :password, String, required: true
    end

    def login(email:, password:)
      if user = User.where(email: email).first.authenticate(password)
        user.sessions.create.key
      end
    end

    field :current_user, Types::UserType, null: true, description: "The currently logged in user" 

    def current_user
      context[:current_user]
    end

    field :logout, Boolean, null: false, description: "Logout a user"

    def logout
      Session.where(id: context[:session_id]).destroy_all
      true
    end

  end
  

end
