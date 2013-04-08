ActiveAdmin::Dashboards.build do
  section "Recent Articles" do
    table_for Article.order("created desc").limit(5) do
      column :title do |article|
        link_to article.title, admin_article_path(article)
    end
      column :content
      
    end
    strong { link_to "View All Articles", admin_articles_path }
  end
end