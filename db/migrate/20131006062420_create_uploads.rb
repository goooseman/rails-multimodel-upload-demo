class CreateUploads < ActiveRecord::Migration
  def change
    create_table :uploads do |t|
      t.string :item_id
      t.string :integer

      t.timestamps
    end
  end
end
