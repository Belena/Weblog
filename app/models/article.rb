class Article < ActiveRecord::Base
  attr_accessible :article_id, :author, :category, :content, :created, :rating, :title

validates :title, :presence => true,
					:length => { :minimum => 5 }
validates :author, :presence => true
validates :content, :presence => true

# declare the relationship between two models and in case article destroyed comment will be destroyed as well

has_many :comments, :dependent => :destroy
end

