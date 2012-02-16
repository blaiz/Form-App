class RemoveRespondentsAndOwners < ActiveRecord::Migration
  def up
    remove_column :questionnaires, :owner_id
    remove_column :form_instances, :respondent_id
    drop_table :owners
    drop_table :respondents
  end

  def down
  end
end
