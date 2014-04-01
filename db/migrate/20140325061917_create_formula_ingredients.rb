class CreateFormulaIngredients < ActiveRecord::Migration
  def change
    create_table :formula_ingredients do |t|
      t.belongs_to :formula, null: false
      t.belongs_to :ingredient, null: false
      t.decimal :max, precision: 12, scale: 6
      t.decimal :min, precision: 12, scale: 6
      t.decimal :actual, null: false, default: 0, precision: 12, scale: 6
      t.decimal :weight, precision: 12, scale: 6
      t.decimal :shadow, null: false, default: 0, precision: 12, scale: 6
    end
    add_index :formula_ingredients, [:ingredient_id, :formula_id], unique: true
  end
end