class WholeAnswer < ApplicationRecord
  
  #Modelの関係づけ
  belongs_to :book
  has_many :detailed_answers
  has_one :whole_question
  has_one :period
  
end
