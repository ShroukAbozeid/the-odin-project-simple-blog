class RemoveAuthorIdFromArticle < ActiveRecord::Migration[5.2]
  def change
  	  	remove_column :articles, :author_id
  end
end
