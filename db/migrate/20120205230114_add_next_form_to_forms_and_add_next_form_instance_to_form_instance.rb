class AddNextFormToFormsAndAddNextFormInstanceToFormInstance < ActiveRecord::Migration
  def change
    add_column :forms, :next_form_id, :integer
    add_column :form_instances, :next_form_instance_id, :integer
  end
end
