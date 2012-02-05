class CreateFormInstances < ActiveRecord::Migration
  def change
    create_table :form_instances do |t|
      t.references :form
      t.references :respondent

      t.timestamps
    end
    add_index :form_instances, :form_id
    add_index :form_instances, :respondent_id
  end
end
