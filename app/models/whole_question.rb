class WholeQuestion < ApplicationRecord
  #バリデーション
  validates :content, presence: true, length:{ maximum:150 }
  
  #Modelの関係づけ
  has_many :detailed_questions
  belongs_to :whole_answer
  
end
