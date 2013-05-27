class CreateConversionsTable < ActiveRecord::Migration
  def change
    create_table :conversions do |t|
      t.string :image
    end
  end
end
