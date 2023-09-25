class Producao < ApplicationRecord
    belongs_to :category
    validates :name, presence: true, length: {minimum: 1}
    validates :price,presence: true, length: {minimum: 1}
end
