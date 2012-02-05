class AddWeightToFields < ActiveRecord::Migration
  def change
    add_column :fields, :weight, :integer
  end
end
