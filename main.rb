require 'ruby-progressbar'

progressbar = ProgressBar.create

paragraphs = File.readlines("article.txt").map(&:chomp)
cities = File.readlines('places.txt').map(&:chomp)
output = File.open( "output.txt","w" )
count = 0
chunks = paragraphs.count/100

p "Starting.."

paragraphs.each do |paragraph|
  if (count > chunks)
    progressbar.increment
    count = 0
  end
  output << "========"
  output << "\n"
  output << paragraph
  output << "\n"
  output << "--"
  output << "\n"
  contains = []
  cities.each_with_index do |city,index|
    if paragraph[/\b#{city}\b/]
      contains << "#{city} (#{index})" unless city.empty?
    end
  end
  # output << "Found these cities: " + contains.uniq.reject {|c| c.empty?}.join(", ")
  output << "Found these cities: " + contains.join(", ")
  output << "\n"
  count += 1
end
p "Done!"
output.close