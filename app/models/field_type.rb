class FieldType < ActiveRecord::Base
  has_many :fields
  
  def self.types
    {
      "Short Text" => "text_field",
      "E-mail" => "email_field",
      "Password or confidential" => "email_field",
      "Phone number" => "telephone_field",
      "Multiline Text" => "text_area"
    }
  end
end
