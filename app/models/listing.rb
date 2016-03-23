class Listing < ActiveRecord::Base
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  belongs_to :category
  belongs_to :user

  include PgSearch
  pg_search_scope :search_title, :against => [:title], :using => { :tsearch => {:prefix => true} }
  # multisearchable :against => [:title, :description]
end
