class Producao < ApplicationRecord
    validates :name, presence: true, length: {minimum: 1}
    validates :price,presence: true, length: {minimum: 1}
end
