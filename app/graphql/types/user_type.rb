class Types::UserType < Types::BaseObject
  description "One user"

  field :id, ID, null: false
  field :first_name, String, null: true
  field :last_name, String, null: true
  field :number, Int, null: true
  field :postal_code, Int, null: true
  field :street, String, null: true
  field :country, String, null: true
  field :created_at, GraphQL::Types::ISO8601DateTime, null: false

  field :full_address, String, null: true

  def full_address
    "#{object.number} #{object.street} #{object.postal_code} #{object.country}"
  end

  field :posts, [Types::PostType], null: true, description: "A user's posts"


end