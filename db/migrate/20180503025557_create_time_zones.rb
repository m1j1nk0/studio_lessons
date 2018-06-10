class CreateTimeZones < ActiveRecord::Migration[5.0]
  def change
    create_table :time_zones do |t|
      t.time :time_value
      t.timestamps
    end
  end
end
