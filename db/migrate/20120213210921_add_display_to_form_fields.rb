class AddDisplayToFormFields < ActiveRecord::Migration
  def change
    add_column :form_fields, :display, :string

  end
end
