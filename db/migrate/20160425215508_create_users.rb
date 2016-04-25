class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :facebook_id
      t.string :gender
      t.string :picture_url
      t.string :city
      t.string :state
      t.text :description

      t.timestamps null: false
    end
  end
end
