class CreateVotedUsers < ActiveRecord::Migration
  def change
    create_table :voted_users do |t|
      t.integer :article_id
      t.integer :user_id
      t.integer :rvalue

      t.timestamps
    end
  end
end
