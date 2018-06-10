class AddNameToTimeZones < ActiveRecord::Migration[5.0]
  def change
     add_column :time_zones, :name, :string
  end
end
