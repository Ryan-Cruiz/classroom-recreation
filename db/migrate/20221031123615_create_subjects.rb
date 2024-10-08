class CreateSubjects < ActiveRecord::Migration[7.0]
  def change
    create_table :subjects do |t|
      t.string :title
      t.string :section
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
