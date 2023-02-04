class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.date :date
      t.integer :smart_gas_meters_in_smart_mode
      t.integer :smart_gas_meters_in_traditional_mode
      t.integer :non_smart_gas_meters
      t.integer :smart_electricity_meters_in_smart_mode
      t.integer :smart_electricity_meters_in_traditional_mode
      t.integer :non_smart_electricity_meters
      t.integer :all_smart_meters_in_smart_mode
      t.integer :all_smart_meters_in_traditional_mode
      t.integer :all_non_smart_meters
      t.integer :total_meters

      t.timestamps
    end
  end
end
