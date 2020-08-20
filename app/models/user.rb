class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

        has_many :items
        has_many :comments
        has_many :orders
         

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  PASSWORD_REGEX_ZENKAKU = /\A[ぁ-んァ-ン一-龥]+\z/.freeze
  PASSWORD_REGEX_KATAKANA = /\A[ァ-ヶー－]+\z/

    with_options presence: true do
    validates :nickname
    validates :email
    validates :password, format: { with: PASSWORD_REGEX }
    validates :firstname_kanji, format: { with: PASSWORD_REGEX_ZENKAKU }
    validates :lastname_kanji, format: { with: PASSWORD_REGEX_ZENKAKU }
    validates :firstname_katakana, format: { with: PASSWORD_REGEX_KATAKANA }
    validates :lastname_katakana, format: { with: PASSWORD_REGEX_KATAKANA }
    validates :birth_day
    end
end