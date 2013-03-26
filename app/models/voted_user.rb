class VotedUser < ActiveRecord::Base
  belongs_to :article
  attr_accessible :article_id, :rvalue, :user_id
  validates :rvalue, :numericality => { :greater_than_or_equal_to => 1, :less_than_or_equal_to => 5 }
  validates :rvalue, :presence => true
end
