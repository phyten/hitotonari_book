class DetailedAnswer < ApplicationRecord
  
  #Modelの関係づけ
  belongs_to :whole_answer
  has_one :detailed_question
  
  #バリデーション
  validates :content, presence: true, length:{ maximum:1000 }
  
end
