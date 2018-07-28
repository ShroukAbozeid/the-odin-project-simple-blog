class Article < ApplicationRecord
	has_many :comments
	has_many :taggings
	has_many :tags, through: :taggings
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
