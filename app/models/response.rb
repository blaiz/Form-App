class Response < ActiveRecord::Base
  belongs_to :form_instance
  belongs_to :form_field
end
