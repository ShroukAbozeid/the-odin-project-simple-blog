class Article < ApplicationRecord
	has_many :comments, dependent: :destroy
	has_many :taggings, dependent: :destroy
	has_many :tags, through: :taggings
	belongs_to :author
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
		self.tags =tags.collect{ |t| Tag.find_or_create_by(name: t) }
	
	end

	def increment_views
		self.increment!(:views_count)
	end

	def self.most_popular
		Article.all.sort_by{ |i| i.views_count}.last(3)
	end

	def self.filter_by_month(month)
		month =Date::MONTHNAMES.index(month)
		Article.all.select{|a| a.created_at.month == month} 
	end
end
