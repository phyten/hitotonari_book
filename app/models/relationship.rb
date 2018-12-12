class Relationship < ApplicationRecord
  
  #Modelの関係づけ
  belongs_to :user
  belongs_to :follow, class_name: 'User'
  
end
