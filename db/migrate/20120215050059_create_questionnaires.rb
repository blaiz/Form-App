class CreateQuestionnaires < ActiveRecord::Migration
  def change
    create_table :questionnaires do |t|
      t.string :label
      t.string :name
      t.references :owner
      t.references :start_form

      t.timestamps
    end
  end
end
