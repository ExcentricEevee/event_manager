require 'csv'
require 'time'

puts 'assignment.rb Initialized'

def clean_phone(phone)
  nums = phone.split("").reduce(Array.new) do |ary, char|
    char.match?(/[0-9]/) ? ary.push(char) : ary
  end

  if nums.length == 10
    nums.join
  elsif nums.length == 11 && nums[0] == "1"
    nums.shift
    nums.join
  else
    "Invalid Phone Number"
  end
end

contents = CSV.open(
  'event_attendees.csv',
  headers: true,
  header_converters: :symbol
)

peak_hours = {}
contents.each do |row|
  #p clean_phone(row[:homephone])
  hour = Time.strptime(row[:regdate], "%m/%d/%Y %H:%M").hour
  peak_hours[hour] = 0 if peak_hours[hour].nil?
  peak_hours[hour] += 1
end

p peak_hours
