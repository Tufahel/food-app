class RemoveMeasurementUnitFromFoods < ActiveRecord::Migration[7.0]
  def change
    remove_column :foods, :measurement_unit, :float
  end
end
