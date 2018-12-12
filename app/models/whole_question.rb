class WholeQuestion < ApplicationRecord
  #バリデーション
  validates :content, presence: true, length:{ maximum:150 }
  validates :required, inclusion:{in: [true,false]}
  
  #Modelの関係づけ
  has_many :detailed_questions
  belong_to :whole_answer
  
end
