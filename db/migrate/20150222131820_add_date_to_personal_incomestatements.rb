class AddDateToPersonalIncomestatements < ActiveRecord::Migration
  def change
    add_column :personal_incomestatements, :date, :date
  end
end
