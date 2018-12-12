class BasePeriod < ApplicationRecord
  
  #Modelの関係づけ
  has_many :periods
  belongs_to :book
  
  #バリデーション
  validates :name, presence: true, length:{ maximum:100 }
  
end
