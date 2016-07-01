class AddPartnerToPersonalIncomestatement < ActiveRecord::Migration
  def change
    add_column :personal_incomestatements, :partner, :integer, default: 0
  end
end
