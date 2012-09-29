namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_cities
  end
end

def make_cities
  require 'open-uri'
  sta = ["OR","WA","CO","ID","UT","MT","NV","CA","AZ","NM","KS","NE","IA","ND","SD","MI","WI","TX","OK","AR","AK","HI","MO","FL","LA","AL","MS","GA","TN","OH","NC","SC","PA","NY","NJ","MN","IL","IN","KY","VT","NH","ME","RI","MA","CT","MD","VA","WV","WY","DE"]
  (1..sta.length).each do |j|
    st = sta[j-1]
    docname = "http://api.sba.gov/geodata/city_links_for_state_of/" + st + ".xml"
    doc = Nokogiri::XML(open(docname))
    cityname = doc.xpath("//name")
    citylat = doc.xpath("//primary_latitude")
    citylon = doc.xpath("//primary_longitude")
  
    (1..cityname.length).each do |i|
      cname = cityname[i-1].content.to_s + ", " + st
      clat = citylat[i-1].content.to_s
      clon = citylon[i-1].content.to_s
      City.create!(name: cname, state: st, lat: clat, lon: clon)
    end
  end
  
end  

