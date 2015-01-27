require 'csv'
require 'sunlight/congress'
require 'erb'
require 'date'

Sunlight::Congress.api_key = "e179a6973728c4dd3fb1204283aaccb5"

def clean_zipcode(zipcode)
	zipcode.to_s.rjust(5, "0")[0..4]
end

def clean_phonenum(phonenum)
	#returns nil if bad number
	phonenum = phonenum.gsub(/[^0-9]/,'')
	out = nil
	if phonenum.length == 10
		out = phonenum
	elsif phonenum.length == 11 && phonenum[0] == 1
		out = phonenum[1..-1]
	end
	out
end

def legislators_by_zipcode(zipcode)
	legislators = Sunlight::Congress::Legislator.by_zipcode(zipcode)
end

def save_thank_you_letters(id, form_letter)
	Dir.mkdir("output") unless Dir.exists?("output")
	filename = "output/thanks_#{id}.html"

	File.open(filename, 'w') do |file|
		file << form_letter
	end
end

puts "EventManager Initialized!"
template_letter = File.read("form_letter.erb")
erb_template = ERB.new template_letter
weekdays = {
	0 => [:Sunday, 0],
	1 => [:Monday, 0],
	2 => [:Tuesday, 0],
	3 => [:Wednesday, 0],
	4 => [:Thursday, 0],
	5 => [:Friday, 0],
	6 => [:Saturday, 0]
}

contents = CSV.open("event_attendees.csv", headers: true, header_converters: :symbol)
contents.each do |row|
	id = row[0]
	name = row[:first_name]
	phonenum = clean_phonenum(row[:homephone])
	zipcode = clean_zipcode(row[:zipcode])
	time = DateTime.strptime(row[:regdate].to_s,'%m/%d/%Y %H:%M')
	weekdays[time.wday][1] += 1
	legislators = legislators_by_zipcode(zipcode)
	form_letter = erb_template.result(binding)
	save_thank_you_letters(id, form_letter)
end

puts weekdays