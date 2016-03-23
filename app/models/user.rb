class User < ActiveRecord::Base
  has_many :listings

  #paperclip
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "public/images/:style/missing.jpg"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  include PgSearch
  pg_search_scope :search_title, :against => [:username]

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
