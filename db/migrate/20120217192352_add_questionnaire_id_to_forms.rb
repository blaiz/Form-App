class AddQuestionnaireIdToForms < ActiveRecord::Migration
  def change
    add_column :forms, :questionnaire_id, :integer

  end
end
