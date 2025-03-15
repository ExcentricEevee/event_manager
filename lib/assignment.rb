require 'csv'

puts 'assignment.rb Initialized'

contents = CSV.open(
  'event_attendees.csv',
  headers: true,
  header_converters: :symbol
)

contents.each do |row|
  phone = row[:homephone]

  clean_phone = phone.split('').reduce do |result, char|
    result.push char if char.match?(/[0-9]/)
  end

  p clean_phone

  # if phone.size == 10
  #   puts "#{phone} --- valid"
  # else
  #   puts "#{phone} --- invalid"
  # end
end
