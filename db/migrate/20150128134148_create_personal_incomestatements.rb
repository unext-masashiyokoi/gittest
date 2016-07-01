class CreatePersonalIncomestatements < ActiveRecord::Migration
  def change
    create_table :personal_incomestatements do |t|
      t.integer :car_loan
      t.integer :lower
      t.integer :credit
      t.integer :shopping_loan
      t.integer :yokoi_info
      t.integer :friend
      t.integer :family
      t.integer :health_care
      t.integer :basic_costs
      t.integer :clothes_costs
      t.integer :reisure_costs
      t.integer :car_tax
      t.integer :car_insurance
      t.integer :social_insurance
      t.integer :life_insurance
      t.integer :housing_costs
      t.integer :saraly

      t.timestamps null: false
    end
  end
end
