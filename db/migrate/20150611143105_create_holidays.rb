class CreateHolidays < ActiveRecord::Migration
  def change
    create_table :holidays do |t|
      t.date :h_date

      t.timestamps null: false
    end
    add_index :holidays, :h_date, unique: true

  end
end
