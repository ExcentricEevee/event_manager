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

def peak_time(hash, time)
  hash[time] = 0 if hash[time].nil?
  hash[time] += 1
end

contents = CSV.open(
  'event_attendees.csv',
  headers: true,
  header_converters: :symbol
)

peak_hours = {}
peak_weekday = {}
contents.each do |row|
  # p clean_phone(row[:homephone])
  regtime = Time.strptime(row[:regdate], "%m/%d/%Y %H:%M")
  peak_time(peak_hours, regtime.hour)
  peak_time(peak_weekday, regtime.wday)
end

p peak_hours
p peak_weekday
