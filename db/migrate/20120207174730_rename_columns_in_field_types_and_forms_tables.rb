class RenameColumnsInFieldTypesAndFormsTables < ActiveRecord::Migration
  def up
    rename_column :forms, :name, :label
    rename_column :forms, :url, :name
    rename_column :field_types, :name, :label
    rename_column :field_types, :html_type, :rails_type
  end

  def down
    rename_column :forms, :name, :url
    rename_column :forms, :label, :name
    rename_column :field_types, :label, :name
    rename_column :field_types, :rails_type, :html_type
  end
end
