class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :last_name, presence: true,
                        format: { with: /\A[一-龥ぁ-んァ-ヶ]+\z/, message: 'must be in full-width characters (kanji, hiragana, katakana)' }
  validates :first_name, presence: true,
                         format: { with: /\A[一-龥ぁ-んァ-ヶ]+\z/, message: 'must be in full-width characters (kanji, hiragana, katakana)' }
  validates :last_name_kana, presence: true,
                             format: { with: /\A[ァ-ヶー－]+\z/, message: 'must be in full-width katakana' }
  validates :first_name_kana, presence: true,
                              format: { with: /\A[ァ-ヶー－]+\z/, message: 'must be in full-width katakana' }
  validates :birthday, presence: true
  validate :password_complexity

  private

  def password_complexity
    return unless password.present? && !password.match?(/\A(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]+\z/)

    errors.add :password, 'must include both letters and numbers'
  end
end
