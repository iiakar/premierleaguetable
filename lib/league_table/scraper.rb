require 'nokogiri'
require 'pry'
require 'open-uri'

class LeagueTable::Scraper

  def self.scrape_teams
    url = "https://www.bbc.com/sport/football/premier-league/table"
    doc = Nokogiri::HTML(open(url))

    body = doc.css("tbody.gel-long-primer")

    rows = body.css('tr')
    rows.each do |row|
      cols = row.css('td')
      position_moved = cols[1].text #team hasn't moved
      position = cols[0].text
      name = cols[2].text
      played = cols[10].text
      win = cols[4].text
      draw = cols[5].text
      lost = cols[6].text
      goal_difference = cols[9].text
      points = cols[10].text
      LeagueTable::Team.new(position, name, points, played, win, draw, lost, goal_difference,position_moved)
    end
  end
end
