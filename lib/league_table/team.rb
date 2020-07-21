class LeagueTable::Team
  attr_accessor :position, :name, :points, :games_played, :games_won, :games_drawn, :games_lost, :goal_differential,:position_moved
  @@all = []

  def self.all
    @@all
  end

  def self.fetch_teams
    LeagueTable::Scraper.scrape_teams
  end

  def initialize(position,name,points,games_played,games_won,games_drawn,games_lost,goal_differential,position_moved)
    @position = position
    @name = name
    @points = points
    @games_played = games_played
    @games_won = games_won
    @games_drawn = games_drawn
    @games_lost = games_lost
    @goal_differential = goal_differential
    @position_moved = position_moved
    save
  end

  def save
    @@all << self
  end
end
