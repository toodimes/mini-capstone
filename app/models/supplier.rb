class Supplier < ApplicationRecord
  has_many :products

  #Validations
  validates :name, :email, :phone, :presence => true



end
