class Form < ActiveRecord::Base
  has_many :form_fields, :order => 'weight ASC'
  has_many :fields, :through => :form_fields
  has_many :form_instances
  
  belongs_to :next_form, :class_name => "Form"
  has_one :previous_form, :class_name => "Form", :foreign_key => "next_form_id"
  
  belongs_to :next_section_form, :class_name => "Form"
  has_one :previous_section_form, :class_name => "Form", :foreign_key => "next_section_form_id"
  
  acts_as_url :label, :url_attribute => :name
  
  def to_param
    name
  end
end
