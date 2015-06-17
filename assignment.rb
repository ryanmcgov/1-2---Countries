puts "What file would you like to use?"
print ">> "
file_name = gets.chomp

new_file_arr = []
exclusion_words = ['and', 'of', 'the']

# Adds content from countries.txt to a local array
File.open(file_name, "r").each do |line|
  new_file_arr.push(line)
end

new_file_index = 0
new_file_arr.each do |line|
  line.gsub!(' | ', ' - ')
  file_line = line.split(' ')

  index = 0
  file_line.each do |word|
    unless exclusion_words.include?(word)
      word.capitalize!
    end

    line = file_line.join(' ')
    new_file_arr[new_file_index] = line
    index += 1
  end
  new_file_arr[0].upcase!
  new_file_index += 1
end

##Writes to new file.  Works correctly
# File.new("updated_#{file_name}", "w+")
# File.open("updated_#{file_name}", "w+") do |write|
#   write.puts(new_file_arr)
# end

new_file_arr.each { |line| puts line }

puts "Number of countries is #{new_file_arr.length}"


