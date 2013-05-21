ActiveAdmin.register Article do


   index do
   	selectable_column
    column :id 
    column :title do |article|
        link_to article.title.html_safe, admin_article_path(article)
    end
    column :author 
    column :published
    column :image 
    column :created_at
    default_actions
    
  end

 
  filter :published, :as => :check_boxes
end




