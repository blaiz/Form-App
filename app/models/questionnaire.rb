class Questionnaire < ActiveRecord::Base
  has_and_belongs_to_many :groups
  has_many :forms
  belongs_to :start_form, :class_name => "Form"
  
  def administrator
    self.groups.find_by_group_type("administrator")
  end
  
  def respondents
    self.groups.find_all_by_group_type("respondent")
  end
end
