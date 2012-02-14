class AddNextSectionFormIdToForms < ActiveRecord::Migration
  def change
    add_column :forms, :next_section_form_id, :integer

  end
end
