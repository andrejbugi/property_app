class Property < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  belongs_to :account

  scope :latest, -> { order created_at: :desc }

  scope :for_sale, -> { where(for_sale: true, status: "available") }
  scope :sold, -> { where(for_sale: true, status: "sold") }
  scope :for_rent, -> { where(for_sale: false, status: "available") }
  scope :leased, -> { where(for_sale: false, status: "leased") }
end
