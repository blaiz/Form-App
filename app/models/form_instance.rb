class FormInstance < ActiveRecord::Base
  belongs_to :form
  belongs_to :group
  
  has_many :form_fields, :through => :form
  has_many :responses
  
  belongs_to :next_form_instance, :class_name => "FormInstance"
  has_one :previous_form_instance, :class_name => "FormInstance", :foreign_key => "next_form_instance_id"
end
