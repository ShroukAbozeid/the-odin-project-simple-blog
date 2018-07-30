class AddAuthorIdToArticle < ActiveRecord::Migration[5.2]
  def change
  	add_column :articles, :author_id, :integer, index: true
  	change_column_null :articles , :author_id, false
  end
end
