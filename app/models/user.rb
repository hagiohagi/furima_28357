class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    validates :nickname, presence: true
    validates :email,              presence: true
    validates :password, presence: true, length:{ minimum:6 }, format: { with: (/\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i) }
    validates :firstname_kanji, presence: true, format: { with: (/\A[ぁ-んァ-ン一-龥]+\z/) }
    validates :lastname_kanji, presence: true, format: { with:(/\A[ぁ-んァ-ン一-龥]+\z/) }
    validates :firstname_katakana, presence: true, format: { with:(/\A[ァ-ヶー－]+\z/) }
    validates :lastname_katakana, presence: true, format: { with:(/\A[ァ-ヶー－]+\z/)}
    validates :birth_day, presence: true
end