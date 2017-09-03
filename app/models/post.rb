class Post < ApplicationRecord
  has_many :post, dependent: :destroy
end
