class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :trailName
      t.string :meetingLocation
      t.decimal :hikeDistance
      t.integer :elevationGain
      t.string :hikeLocation
      t.decimal :latitude
      t.decimal :longitude
      t.text :description
      t.references :user, index: true, foreign_key: true
      t.integer :maxAttendees
      t.datetime :eventDate

      t.timestamps null: false
    end
  end
end
