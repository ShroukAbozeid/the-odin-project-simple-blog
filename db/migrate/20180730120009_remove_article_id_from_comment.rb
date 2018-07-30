class RemoveArticleIdFromComment < ActiveRecord::Migration[5.2]
  def change
  	remove_column :comments, :article_id
  end
end
