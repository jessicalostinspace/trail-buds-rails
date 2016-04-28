class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :content
      t.references :sender, index: true, references: :user
      t.references :receiver, index: true, references: :user
      t.references :event, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
