class Form < ActiveRecord::Base
  has_many :form_fields, :order => 'weight ASC'
  has_many :fields, :through => :form_fields
  has_many :form_instances
  
  acts_as_url :name
  
  def to_param
    url
  end
end
