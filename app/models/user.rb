class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, :last_name, :first_name, :first_name_kana, :last_name_kana, :date_of_birth, presence:true
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*[\d])[a-z\d]+\z/i.freeze
  validates :password, format: { with: VALID_PASSWORD_REGEX, message: 'は半角英数字を両方含む必要があります'}
  VALID_NAME_REGEX = /[ぁ-んァ-ヶ一-龥々ー]/.freeze
  validates :last_name, :first_name, format: { with: VALID_NAME_REGEX, message: 'は全角（漢字・ひらがな・カタカナ）のみ使用できます'}
  VALID_NAME_KANA_REGEX = /[ァ-ヶー]/.freeze
  validates :last_name_kana, :first_name_kana, format: { with: VALID_NAME_KANA_REGEX, message: 'は全角（カタカナ）のみ使用できます'}
end
