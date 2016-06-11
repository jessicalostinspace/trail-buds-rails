class AddSenderIDtoMessages < ActiveRecord::Migration
  def change
  	add_column :messages, :sender_facebook_id, :string 
  end
end
