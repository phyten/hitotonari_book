class Period < ApplicationRecord
  
  #Modelの関係づけ
  belongs_to :base_period
  belongs_to :whole_answer, optional: true
  
end
