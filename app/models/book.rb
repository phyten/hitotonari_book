class Book < ApplicationRecord
 
  #Modelの関係づけ
  belongs_to :user
  has_many :whole_answers
  has_many :base_periods
  accepts_nested_attributes_for :base_periods, allow_destroy: true
  
  #バリデーション
  validates :name, presence: true, length:{ maximum:50 }
 
end
