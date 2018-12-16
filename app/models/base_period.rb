class BasePeriod < ApplicationRecord
  
  #Modelの関係づけ
  belongs_to :book
  has_many :periods
  has_many :whole_answers, through: :periods
  
  #has_many_throughの形（必要なら作成する）
  
  #バリデーション
  validates :name, presence: true, length:{ maximum:100 }
  
end
