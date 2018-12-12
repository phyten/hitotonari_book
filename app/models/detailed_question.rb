class DetailedQuestion < ApplicationRecord
  
  #Modelの関係づけ
  belongs_to :whole_question
  belongs_to :detailed_answer

  #バリデーション
  validates :content, presence: true, length:{maximum:150}

end
