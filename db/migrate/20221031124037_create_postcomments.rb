class CreatePostcomments < ActiveRecord::Migration[7.0]
  def change
    create_table :postcomments do |t|
      t.text :content
      t.references :post, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
