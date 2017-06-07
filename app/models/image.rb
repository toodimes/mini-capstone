class Image < ApplicationRecord
  belongs_to :product

  #Validations
  validates :url, :presence => true
  
end
