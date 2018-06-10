class AddUrlsToStores < ActiveRecord::Migration[5.0]
  def change
    add_column :stores, :schedule_url, :string
  end
end
