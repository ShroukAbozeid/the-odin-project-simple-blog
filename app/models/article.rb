class Article < ApplicationRecord
	has_many :comments
	has_many :taggings
	has_many :tags, through: :taggings
	has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]
	def tag_list
		self.tags.collect do |tag|
			tag.name
		end.join(", ")
	end

	def tag_list=(tags_string)
		tags=tags_string.split(",")
		tags = tags.collect{|t| t.strip.downcase}
		tags = tags.uniq
		tags.each do |t|
			tmp= Tag.find_or_create_by(name: t)
			self.tags.push(tmp)
		end
	end
end
