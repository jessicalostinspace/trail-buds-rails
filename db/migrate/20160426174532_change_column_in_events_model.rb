class ChangeColumnInEventsModel < ActiveRecord::Migration
  def change
  	change_column :events, :eventDate, :string
  end
end
