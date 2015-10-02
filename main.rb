paragraphs = File.read("article.txt").split("\n")
cities = File.readlines('places.txt').map(&:chomp)
paragraphs.each do |paragraph|
  p "========"
  p paragraph
  p "--"
  contains = []
  cities.each do |city|
    if paragraph.include? city
      contains << city
    end
  end
  p "Found these cities: " + contains.uniq.reject {|c| c.empty?}.join(", ")
end