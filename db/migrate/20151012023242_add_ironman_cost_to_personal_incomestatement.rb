class AddIronmanCostToPersonalIncomestatement < ActiveRecord::Migration
  def change
    add_column :personal_incomestatements, :ironman_costs, :integer
  end
end
