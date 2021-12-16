class Etablissement < ApplicationRecord

  has_many :adherents
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?


end
