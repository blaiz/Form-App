class AddGroupsQuestionnairesTable < ActiveRecord::Migration
  def up
    create_table :groups_questionnaires, :id => false do |t|
      t.integer :group_id
      t.integer :questionnaire_id
    end
  end

  def down
    drop_table :groups_questionnaires
  end
end
