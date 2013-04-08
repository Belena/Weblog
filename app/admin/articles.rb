ActiveAdmin.register Article do
   index do
   	selectable_column
    column :id
    column :title
    column :author
    column :published
    column :created_at
    default_actions
    
  end

  filter :published, :as => :check_boxes
end



