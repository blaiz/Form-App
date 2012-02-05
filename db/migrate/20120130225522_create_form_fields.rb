class CreateFormFields < ActiveRecord::Migration
  def change
    create_table :form_fields do |t|
      t.references :form
      t.references :field
      t.integer :weight

      t.timestamps
    end
    add_index :form_fields, :form_id
    add_index :form_fields, :field_id
  end
end
