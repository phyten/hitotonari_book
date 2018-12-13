class WholeAnswer < ApplicationRecord
  
  #Modelの関係づけ
  belongs_to :book
  has_many :detailed_answers
  belongs_to :whole_question
  belongs_to :base_period
  
end
