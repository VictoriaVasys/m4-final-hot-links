class Seed
  def initialize
    generate_links
  end
  
  def generate_links
    8.times do |i|
      Link.create!(
        url: Faker::Internet.unique.url,
        reads: rand(1..3)
      )
      puts "#{i} link created"
    end
  end
  
end

Seed.new


