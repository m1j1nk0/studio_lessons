class CreateLessons < ActiveRecord::Migration[5.0]
  def change
    create_table :lessons do |t|
      t.references :store, foreign_key: true
      t.references :lesson_kind, foreign_key: true
      t.date :year_month
      t.string :day_of_week
      t.string :instractor
      t.string :studio
      t.time :start_at
      t.time :end_at

      t.timestamps
    end
  end
end
