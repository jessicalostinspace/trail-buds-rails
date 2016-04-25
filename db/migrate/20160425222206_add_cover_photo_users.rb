class AddCoverPhotoUsers < ActiveRecord::Migration
  def change
  	add_column :users, :coverPhotoURL, :string
  end
end
