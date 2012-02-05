class Field < ActiveRecord::Base
  belongs_to :field_type
  has_many :form_fields
  has_many :forms, :through => :form_fields
end
