json.array!(@income_statements) do |income_statement|
  json.extract! income_statement, :id, :date, :ses_business_revenue, :representative_reward, :personnel_expenses, :sales_support_fee, :social_insurance_costs, :tax_expense, :business_tax, :delay_loss, :communications_expenses, :transportation_cost, :capital_investment, :advertising_expenses, :entertainment_expenses, :affairs_costs, :shareholder_costs, :lower_costs, :debt_costs, :realestate
  json.url income_statement_url(income_statement, format: :json)
end
