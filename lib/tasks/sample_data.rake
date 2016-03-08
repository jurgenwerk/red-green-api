namespace :sample_data do
  task :generate => :environment do
    (Date.new(2014, 01, 01)..Date.today).each do |date|
      if rand < 0.05
        BalanceChange.create!(entry_date: date, value: rand(1300..2000)*100, change_type: :income)
      else
        BalanceChange.create!(entry_date: date, value: rand(1..200)*100, change_type: :expense)
      end
    end
  end
end
