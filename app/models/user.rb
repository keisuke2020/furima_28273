class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, 
         :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  zenkaku = /\A[ぁ-んァ-ン一-龥]/
  kana = /\A[ァ-ヶー－]+\z/

  with_options presence: true do
    validates :nickname
    validates :password, length: { minimum: 6 },
                         format: { with: /\A[a-zA-Z0-9]+\z/, message: 'is invalid. Input half-width characters.' }
    validates :family_name_full_width, format: { with: zenkaku, message: 'is invalid. Input full-width characters.' }
    validates :first_name_full_width, format: { with: zenkaku, message: 'is invalid. Input full-width characters.' }
    validates :family_name_kana_input, format: { with: kana, message: 'is invalid. Input full-width katakana characters.' }
    validates :first_name_kana_input, format: { with: kana, message: 'is invalid. Input full-width katakana characters.' }
    validates :birthday
  end

  has_many :sns_credentials
end
