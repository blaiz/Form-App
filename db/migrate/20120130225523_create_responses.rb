class CreateResponses < ActiveRecord::Migration
  def change
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
