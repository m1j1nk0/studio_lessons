class CreateLessonKinds < ActiveRecord::Migration[5.0]
  def change
    create_table :lesson_kinds do |t|
      t.references :kind, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
