class BasePeriod < ApplicationRecord
  
  #Modelの関係づけ
  belongs_to :book
  has_one :whole_answer
  
  #バリデーション
  validates :name, presence: true, length:{ maximum:100 }
  
end
