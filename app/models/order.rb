class Order < ActiveRecord::Base
  PAYMENT_TYPES = ["чек", "кредитная карта", "наличные при получении" ]
  validates :name, :address, :email, presence: true
  validates :pay_type, inclusion: PAYMENT_TYPES
end
