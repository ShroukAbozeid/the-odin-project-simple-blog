class RemoveColumnsFromTagging < ActiveRecord::Migration[5.2]
  def change
  	remove_column :taggings, :tag_id
  	remove_column :taggings, :article_id
  end
end
