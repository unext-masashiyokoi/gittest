class AddIncomeTaxToPersonalIncomestatements < ActiveRecord::Migration
  def change
    add_column :personal_incomestatements, :income_tax, :integer
  end
end
