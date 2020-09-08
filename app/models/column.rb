class Column < ApplicationRecord
  belongs_to :user
  has_many :columns_tags
  has_many :tags, through: :columns_tags
  validates :tittle, presence: true
  mount_uploader :image, ImageUploader

  def save_contents(savepost_tags)
    current_tags = self.tags.pluck(:tag) unless self.tags.nil?
    old_tags = current_tags - savepost_tags
    new_tags = savepost_tags - current_tags
  
      # Destroy old taggings:
      old_tags.each do |old_name|
        self.tags.delete Tag.find_by(tag: old_name)
      end
  
      # Create new taggings:
      new_tags.each do |new_name|
        post_tag = Tag.find_or_create_by(tag: new_name)
        self.tags << post_tag
      end
    end
end
