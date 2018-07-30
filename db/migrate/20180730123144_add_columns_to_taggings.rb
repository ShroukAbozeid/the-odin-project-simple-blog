class AddColumnsToTaggings < ActiveRecord::Migration[5.2]
  def change
  	add_column :taggings, :article_id, :integer, index: true
  	change_column_null :taggings , :article_id, false
  	add_column :taggings, :tag_id, :integer, index: true
  	change_column_null :taggings , :tag_id, false
  end
end
