class WholeAnswer < ApplicationRecord
  
  #Modelの関係づけ
  belongs_to :book
  has_many :detailed_answers
  belongs_to :whole_question
  has_many :periods
  accepts_nested_attributes_for :detailed_answers, allow_destroy: true
  accepts_nested_attributes_for :periods, allow_destroy: true
  
  #has_many_throughの形（必ずhas_many :periodsの下に記載）
  has_many :base_periods, through: :periods
  
  def select_period
    self.periods.find_or_create_by(base_period_id: base_period.id)
  end
  
  def self.detailed_question_length
    self.find_by(params[:whole_question_id]).detailed_questions.length
  end
  
end
