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

  def self.from_omniauth(auth)
    sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create
    # sns認証したことがあればアソシエーションで取得
   # 無ければemailでユーザー検索して取得orビルド(保存はしない)
    user = User.where(email: auth.info.email).first_or_initialize(
      nickname: auth.info.name,
      email: auth.info.email
    )
    # userが登録済みであるか判断
    if user.persisted?
    sns.user = user
    sns.save
    end
    user
  end
end
