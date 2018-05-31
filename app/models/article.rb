class Article < ApplicationRecord
    has_many :comments,
    dependent: :destroy #ensures that when we call destroy on article it'll destroy comments too
    has_many :taggings,
    dependent: :destroy
    has_many :tags, through: :taggings
    has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>"} #has_attached_file is part of paperclip library, paperclip understands this model should accept a file attachement and store info in model's database
    validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]

    
    def tag_list=(tags_string)
        tag_names = tags_string.split(",").collect{|s| s.strip.downcase}.uniq
        new_or_found_tags = tag_names.collect{ |name| Tag.find_or_create_by(name: name)}
        self.tags = new_or_found_tags
    end
    
    def tag_list
        self.tags.collect do |tag|
            tag.name
        end.join(", ")
    end
end
