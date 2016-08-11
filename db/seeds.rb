# Doorkeeper::Application.destroy_all
# Doorkeeper::Application.create(name: "rg_web", redirect_uri: "http://localhost:3000/")

user = User.last

[3.months.ago, 2.months.ago, 1.month.ago, Date.today].each do |date|
  3.times do
    user.balance_changes.create!(entry_date: date, value: rand(160..250)*100, change_type: :income)
    user.balance_changes.create!(entry_date: date, value: rand(130..200)*100, change_type: :expense)
  end
end