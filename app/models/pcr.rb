class Pcr < ApplicationRecord
  belongs_to :user
  has_many :etablissements
end
