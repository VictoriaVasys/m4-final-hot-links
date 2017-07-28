require 'database_cleaner'

DatabaseCleaner.clean_with(:truncation)

class Seed
  def initialize
    generate_links
  end
  
  def generate_links
    20.times do |i|
      Link.create!(
        url: Faker::Internet.unique.url,
        reads: rand(1..20)
      )
      puts "#{i} link created"
    end
  end
  
end

Seed.new


