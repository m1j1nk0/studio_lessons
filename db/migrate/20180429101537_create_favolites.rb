class CreateFavolites < ActiveRecord::Migration[5.0]
  def change
    create_table :favolites do |t|
      t.references :lesson, foreign_key: true
      t.references :member, foreign_key: true

      t.timestamps
    end
  end
end
