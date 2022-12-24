# require 'colorize'
require 'terminal-table'

class LeagueTable::CLI
  def call
    puts "Welcome!".bold
    LeagueTable::Team.fetch_teams
    show_table
    table
    goodbye
  end

  def show_table
    puts "\nEnglish Premier League Table:\n".bold
    @teams = LeagueTable::Team.all
    @teams.each do |name|
      puts "      "
      puts "#{name.position}. ".bold + "#{name.name}".bold + " - " + "#{name.points} points".bold
    end
  end


  def table
    input = nil
    while input != "exit"
      a = "Enter a number between 1-20 ".red
      b= "table ".blue
      c= "exit ".blue
      puts "\n#{a}to see more details on a team, #{b} to show the table again, or #{c} to exit:\n".bold
      input = gets.strip.downcase

      if input.to_i > 0 && input.to_i < @teams.size
        team = @teams[input.to_i - 1]
        puts "-------------------------------------------------".bold
        puts "Team Name:          ".blue + "#{team.name}".light_red
        if team.position == "1"
          puts "Position:           ".blue + "#{team.position}st place".light_red
        elsif team.position == "2"
          puts "Position:           ".blue + "#{team.position}nd place".light_red
        elsif team.position == "3"
          puts "Position:           ".blue + "#{team.position}rd place".light_red
        else
          puts "Position:           ".blue + "#{team.position}th place".light_red
        end
        puts "Games Played:       ".blue + "#{team.games_played}".light_red
        puts "Games Won:          ".blue + "#{team.games_won}".light_red
        puts "Games Drawn:        ".blue + "#{team.games_drawn}".light_red
        puts "Games Lost:         ".blue + "#{team.games_lost}".light_red
        puts "Goal Differential:  ".blue + "#{team.goal_differential}".light_red
        puts "Points:             ".blue + "#{team.points}".light_red
        puts "Table Movement:     ".blue +  "#{team.position_moved}".bold #scraped from the website

        rows = []
        rows << ['Team'.bold,'Games Played'.bold, 'Game Won'.bold, 'Games Drawn'.bold, 'Games Lost'.bold, 'Goal Differential'.bold, 'Points'.bold]
        lines =  "----------------".bold
        rows << ['--------',lines,lines,lines,lines,lines,lines]
        rows << ["#{team.name}".red, "#{team.games_played}".bold, "#{team.games_drawn}".bold, "#{team.games_lost}".bold, "#{team.games_lost}".bold, "#{team.goal_differential}".bold, "#{team.points}".bold]

        table = Terminal::Table.new :rows => rows
          puts table

      elsif input == "table"
        puts "-------------------------------------------------"
        show_table
      elsif input == "exit"
      else
        puts "-------------------------------------------------"
        puts "Invalid entry, enter a valid position number, table, or exit.".red
      end
    end
  end

  def goodbye
    puts "Thank you. Goodbye!".bold
  end
end
