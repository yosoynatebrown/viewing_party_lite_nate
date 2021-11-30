class ViewingParty < ApplicationRecord
  has_many :user_viewing_parties
  has_many :users, through: :user_viewing_parties
  belongs_to :host, class_name: "User", foreign_key: :host_id
end
