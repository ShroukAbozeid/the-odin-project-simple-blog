class AddArticleIdToComments < ActiveRecord::Migration[5.2]
  def change
  	add_column :comments, :article_id, :integer, index: true
  	change_column_null :comments , :article_id, false
  end
end
