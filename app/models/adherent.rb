class Adherent < ApplicationRecord
  belongs_to :user
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  has_many :etablissements
  include SearchFlip::Model
  notifies_index(AdherentIndex)
end
