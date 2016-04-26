class ChangingColumns < ActiveRecord::Migration
  def change
  	change_column :events, :hikeDistance, :string
  	change_column :events, :elevationGain, :string
  	change_column :events, :latitude, :string
  	change_column :events, :longitude, :string
  	change_column :events, :maxAttendees, :string
  end
end
