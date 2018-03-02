# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'
require 'nokogiri'

url = 'http://1000mostcommonwords.com/1000-most-common-german-words/'
doc = Nokogiri::HTML(open(url))
doc.css('.entry-content table tbody tr').each_with_index do |row, index|
  next if index.zero?
  Card.create({
      original_text: row.search('td')[1].text.strip,
      translated_text: row.search('td')[2].text.strip })
end
