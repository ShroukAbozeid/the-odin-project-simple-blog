class RemoveForeignKeyFromComments < ActiveRecord::Migration[5.2]
  def change
  	remove_foreign_key :comments, column: :article_id
  end
end
