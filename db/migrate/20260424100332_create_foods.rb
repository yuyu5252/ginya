class CreateFoods < ActiveRecord::Migration[7.2]
  def change
    create_table :foods do |t|
      t.date :date
      t.string :title
      t.text :about

      t.timestamps
    end
  end
end
