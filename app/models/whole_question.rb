class WholeQuestion < ApplicationRecord

  #Modelの関係づけ
  has_many :detailed_questions
  has_many :whole_answers

  #バリデーション
  validates :content, presence: true, length:{ maximum:150 }
  
end
