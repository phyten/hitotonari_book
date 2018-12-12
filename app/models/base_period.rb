class BasePeriod < ApplicationRecord
  
  #Modelの関係づけ
  has_many :periods
  
  #バリデーション
  validates :name, presence: true, length:{ maximum:100 }
  
end
