crumb :root do
  link "Home", root_path
end

crumb :item do
  link "商品出品", new_item_path
  parent :root
end

crumb :show do
  link "商品詳細", item_path(item.id)
  parent :root
end

crumb :purchase do
  link "商品購入", item_transactions_path(@item.id)
  parent :show
end

crumb :session do
  link "ログイン", new_user_session_path
  parent :root
end

crumb :newsns do
  link "新規登録１", new_user_path
  parent :root
end

crumb :session do
  link "新規登録２", new_user_session_path
  parent :newsns
end

# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).