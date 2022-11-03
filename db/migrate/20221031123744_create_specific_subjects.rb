class CreateSpecificSubjects < ActiveRecord::Migration[7.0]
  def change
    create_table :specific_subjects do |t|
      t.references :subject, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
