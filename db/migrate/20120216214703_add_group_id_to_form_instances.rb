class AddGroupIdToFormInstances < ActiveRecord::Migration
  def change
    add_column :form_instances, :group_id, :integer

  end
end
