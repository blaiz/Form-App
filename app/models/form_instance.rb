class FormInstance < ActiveRecord::Base
  belongs_to :form
  belongs_to :respondent
  
  has_many :form_fields, :through => :form
  has_many :responses
end
