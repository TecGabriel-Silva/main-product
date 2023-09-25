class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise  :database_authenticatable, 
          :registerable,
          :recoverable, 
          :rememberable, 
          :validatable
  
  validates :email, presence: true, length: {minimum: 1}
  validates :encrypted_password, presence: true, length: {minimum: 1}


end
