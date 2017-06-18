class CreateM01Statuses < ActiveRecord::Migration[5.0]
  def change
    create_table :m01_statuses do |t|
      t.string :status

      t.timestamps
    end
  end
end
