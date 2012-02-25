class FormField < ActiveRecord::Base
  belongs_to :form
  belongs_to :field
  
  def self.display_options
    {
      'Do not show' => 'hide',
      'Show in summary' => 'show',
      'Use as label' => 'label'
    }
  end
end
