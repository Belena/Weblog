class Article < ActiveRecord::Base
  attr_accessible :article_id, :author, :category, :content, :created, :rating, :title

validates :title, :uniqueness => { :message => 'already taken!'}
validates :title, :presence => true,
					:length => { :minimum => 5 }

validates :author, :presence => true
validates :content, :presence => true

# declare the relationship between two models and in case article destroyed comment will be destroyed as well

has_many :comments, :dependent => :destroy

# search by solr
searchable do
    text :title, :default_boost => 2
    text :content
  #   text :author_names do
  #   authors.map { |author| author.full_name }
  # end
  string :title, :stored => true
  # integer :category_ids, :references => Category, :multiple => true
  # float :average_rating
  # time :published_at
end
end

