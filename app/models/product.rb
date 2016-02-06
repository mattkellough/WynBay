class Product < ActiveRecord::Base
  belongs_to :user

  has_attached_file :image, styles: {medium: "300x300>", thumb: "150x150#"}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  validates :description, :name, presence: true

  validates :price_in_cents, numericality: {only_integer: true, greater_than: 0}

  def formatted_price

    price_in_dollars = price_in_cents.to_f / 100

    format("$%.2f", price_in_dollars)

  end
end
