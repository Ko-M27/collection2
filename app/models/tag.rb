class Tag < ApplicationRecord
  has_many :columns_tags
  has_many :columns, through: :columns_tags
end
