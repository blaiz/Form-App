class RecreateResponsesTable < ActiveRecord::Migration
  def up
    drop_table :responses
    create_table :responses do |t|
      t.references :form_field
      t.references :form_instance
      t.text :value

      t.timestamps
    end
    add_index :responses, :form_field_id
    add_index :responses, :form_instance_id
  end

  def down
    drop_table :responses
    create_table :responses do |t|
      t.references :form_field
      t.references :respondent
      t.text :value

      t.timestamps
    end
    add_index :responses, :form_field_id
    add_index :responses, :respondent_id
  end
end
