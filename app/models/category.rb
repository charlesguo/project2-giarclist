class Category < ActiveRecord::Base
  has_many :listings

  def name
    title
  end
end
