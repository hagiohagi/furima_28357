class CreateItemInformations < ActiveRecord::Migration[6.0]
  def change
    create_table :item_informations do |t|

      t.timestamps
    end
  end
end
