require 'json'
require 'nokogiri'
require 'axlsx'
require 'csv'

slahdot_articles = []

File.open('slashdot.xml', 'r') do |f|
  doc = Nokogiri::XML(f)
  slahdot_articles = doc.css('item').map { |i|
    {
      title: i.at_css('title').content,
      link: i.at_css('link').content,
      summary: i.at_css('description').content
    }
  }
end

slahdot_articles.each do |article|
  puts "Title: #{article[:title]}"
  puts ""
end

feedzilla_articles = []

File.open('feedzilla.json', 'r') do |f|
  items = JSON.parse(f.read)
  feedzilla_articles = items['articles'].map { |a|
    {
      title: a['title'],
      link: a['url'],
      summary: a['summary']
    }
  }
end

feedzilla_articles.each do |article|
  puts "Feedzilla Title: #{article[:title]}"
  puts ''
end

sorted_articles = (slahdot_articles + feedzilla_articles).sort_by { |a| a[:title]}

sorted_articles.each do |article|
  puts article[:title]
end
