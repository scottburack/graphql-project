class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :street
      t.integer :number
      t.integer :postal_code
      t.string :country

      t.timestamps
    end
  end
end
