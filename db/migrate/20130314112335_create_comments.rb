class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body
      t.references :article
      t.string :comment_id
      t.integer :user_id

      t.timestamps
    end
    add_index :comments, :article_id
  end
end
