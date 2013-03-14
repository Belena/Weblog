class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :content
      t.string :author
      t.string :category
      t.integer :article_id
      t.decimal :rating
      t.date :created

      t.timestamps
    end
  end
end
