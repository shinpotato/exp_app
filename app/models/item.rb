class Item < ApplicationRecord
  belongs_to :user

  validates :language, {presence: true}
  validates :keyword, {presence: true}
  validates :exp_category, {presence: true}
  validates :exp_detail, {presence: true}
end
