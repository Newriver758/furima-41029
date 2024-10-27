class OrderForm
  include ActiveModel::Model

  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :address, :building, :phone_number, :token

  # バリデーションの定義
  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'is invalid. Include hyphen(-)', allow_blank: true }
    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'is invalid. Enter only numbers', allow_blank: true }
    validates :token
  end

  # 郵便番号のフォーマットチェック
  validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'is invalid. Include hyphen(-)' }, if: -> { postal_code.present? }

  # データを保存するメソッド
  def save
    ActiveRecord::Base.transaction do
      # 購入履歴を保存
      order = Order.create!(user_id:, item_id:)
      # 住所情報を保存
      Address.create!(postal_code:, prefecture_id:, city:, address:, building:,
                      phone_number:, order_id: order.id)
    end
  rescue ActiveRecord::RecordInvalid
    false
  end
end
