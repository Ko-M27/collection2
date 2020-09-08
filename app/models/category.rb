class Category < ApplicationRecord
  has_many :columns
  has_ancestry
end
