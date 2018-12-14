class WholeAnswer < ApplicationRecord
  
  #Modelの関係づけ
  belongs_to :book
  has_many :detailed_answers
  belongs_to :whole_question
  has_many :periods
  
  #has_many_throughの形（必ずhas_many :periodsの下に記載）
  has_many :base_periods, through: :periods
  def select_period
    self.periods.find_or_create_by(base_period_id: base_period.id)
  end
  
end
