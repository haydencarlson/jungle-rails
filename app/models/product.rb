class Product < ActiveRecord::Base

  monetize :price_cents, numericality: true
  mount_uploader :image, ProductImageUploader
  has_many :reviews
  belongs_to :category

  validates :name, presence: true
  validates :price, presence: true
  validates :quantity, presence: true
  validates :category, presence: true

  def sold_out?
  	quantity == 0
  end

  def average_rating
 		sum = reviews.inject(0) { | previous, current | previous + current.rating }

 		if reviews.count > 0
 			sum / reviews.count
 		end
  end

  def has_reviews?
  	reviews.count > 0
  end
end
