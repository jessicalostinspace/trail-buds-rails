class ChangeEventColumnNameName < ActiveRecord::Migration
  def change
  	rename_column :events, :name, :host_name
  end
end
