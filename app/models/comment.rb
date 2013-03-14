class Comment < ActiveRecord::Base
  belongs_to :article
  attr_accessible :body, :comment_id, :user_id
end
