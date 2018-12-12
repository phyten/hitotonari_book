class Book < ApplicationRecord
 
  #バリデーション
  validates :name, presence: true, length:{ maximum:50 }
 
  #Modelの関係づけ
  belongs_to :user
  has_many :whole_answers
  
end
