class Book < ApplicationRecord
 
  #Modelの関係づけ
  belongs_to :user
  has_many :whole_answers
  has_many :base_periods
  accepts_nested_attributes_for :base_periods, allow_destroy: true, reject_if: :reject_base_period
  
  #バリデーション
  validates :name, presence: true, length:{ maximum:50 }

  def reject_base_period(attributed)
    if attributed['name'].blank?
      if attributed['content'].present?
        return false
      end
      return true
    end
  end

end
