require 'csv'

puts 'assignment.rb Initialized'

contents = CSV.open(
  'event_attendees.csv',
  headers: true,
  header_converters: :symbol
)

contents.each do |row|
  phone = row[:homephone]

  chars = phone.split("")
  clean_phone = chars.reduce(Array.new) do |ary, char|
    if char.match?(/[0-9]/)
      ary.push(char)
    else
      ary
    end
  end

  if clean_phone.length == 10
    p clean_phone.join
  elsif clean_phone.length == 11 && clean_phone[0] == "1"
    clean_phone.shift
    p clean_phone.join
  end
end
