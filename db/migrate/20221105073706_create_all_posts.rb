class CreateAllPosts < ActiveRecord::Migration[7.0]
  def change
    create_table :all_posts do |t|
      t.references :imageable, polymorphic: true, null: false
      t.references :subject, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
