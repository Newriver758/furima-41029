class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :last_name, presence: true,
                        format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'must be in full-width characters (kanji, hiragana, katakana)' }
  validates :first_name, presence: true,
                         format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'must be in full-width characters (kanji, hiragana, katakana)' }
  validates :last_name_kana, presence: true,
                             format: { with: /\A[ァ-ヶー－]+\z/, message: 'must be in full-width katakana' }
  validates :first_name_kana, presence: true,
                              format: { with: /\A[ァ-ヶー－]+\z/, message: 'must be in full-width katakana' }
  validates :birthday, presence: true
  validate :password_complexity

  private

  def password_complexity
    return unless password.present?

    errors.add :password, 'must include both letters and numbers' unless password.match?(/\A(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]+\z/)
    return unless password.match?(/[^\x20-\x7E]/)

    errors.add :password, 'must not contain full-width characters'
  end
end
