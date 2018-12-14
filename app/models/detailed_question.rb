class DetailedQuestion < ApplicationRecord
  
  #Modelの関係づけ
  belongs_to :whole_question
  has_many :detailed_answers

  #バリデーション
  validates :content, presence: true, length:{maximum:150}

end
