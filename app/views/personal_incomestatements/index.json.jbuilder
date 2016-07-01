json.array!(@personal_incomestatements) do |personal_incomestatement|
  json.extract! personal_incomestatement, :id, :car_loan, :lower, :credit, :shopping_loan, :yokoi_info, :friend, :family, :health_care, :basic_costs, :clothes_costs, :reisure_costs, :car_tax, :car_insurance, :social_insurance, :life_insurance, :housing_costs, :saraly
  json.url personal_incomestatement_url(personal_incomestatement, format: :json)
end
