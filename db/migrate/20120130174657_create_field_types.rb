class CreateFieldTypes < ActiveRecord::Migration
  def change
    create_table :field_types do |t|
      t.string :name
      t.string :html_type

      t.timestamps
    end
  end
end
