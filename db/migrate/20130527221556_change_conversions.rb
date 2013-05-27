class ChangeConversions < ActiveRecord::Migration
  def change
    rename_column :conversions, :image, :url
    add_column :conversions, :public_id, :string
    add_column :conversions, :format, :string
  end
end
