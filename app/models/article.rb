class Article < ActiveRecord::Base
  has_attached_file :img, :styles => { :medium => "300x300>" }
  validates_attachment_content_type :img, :content_type => /\Aimage\/.*\Z/

	belongs_to :user
end