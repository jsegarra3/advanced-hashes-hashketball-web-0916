require "pry"
def game_hash
  the_game_hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black","White"],
      :players => {
        "Alan Anderson" => {
          :number =>0,
          :shoe =>16,
          :points =>22,
          :rebounds =>12,
          :assists =>12,
          :steals =>3,
          :blocks =>1,
          :slam_dunks =>1
        },
        "Reggie Evans" => {
          :number =>30,
          :shoe =>14,
          :points =>12,
          :rebounds =>12,
          :assists =>12,
          :steals =>12,
          :blocks =>12,
          :slam_dunks =>7
        },
        "Brook Lopez" => {
          :number =>11,
          :shoe =>17,
          :points =>17,
          :rebounds =>19,
          :assists =>10,
          :steals =>3,
          :blocks =>1,
          :slam_dunks =>15
        },
        "Mason Plumlee" => {
          :number =>1,
          :shoe =>19,
          :points =>26,
          :rebounds =>12,
          :assists =>6,
          :steals =>3,
          :blocks =>8,
          :slam_dunks =>5
        },
        "Jason Terry" => {
          :number =>31,
          :shoe =>15,
          :points =>19,
          :rebounds =>2,
          :assists =>2,
          :steals =>4,
          :blocks =>11,
          :slam_dunks =>1
        }
      }
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise","Purple"],
      :players => {
        "Jeff Adrien" => {
          :number =>4,
          :shoe =>18,
          :points =>10,
          :rebounds =>1,
          :assists =>1,
          :steals =>2,
          :blocks =>7,
          :slam_dunks =>2
        },
        "Bismak Biyombo" => {
          :number =>0,
          :shoe =>16,
          :points =>12,
          :rebounds =>4,
          :assists =>7,
          :steals =>7,
          :blocks =>15,
          :slam_dunks =>10
        },
        "DeSagna Diop" => {
          :number =>2,
          :shoe =>14,
          :points =>24,
          :rebounds =>12,
          :assists =>12,
          :steals =>4,
          :blocks =>5,
          :slam_dunks =>5
        },
        "Ben Gordon" => {
          :number =>8,
          :shoe =>15,
          :points =>33,
          :rebounds =>3,
          :assists =>2,
          :steals =>1,
          :blocks =>1,
          :slam_dunks =>0
        },
        "Brendan Haywood" => {
          :number =>33,
          :shoe =>15,
          :points =>6,
          :rebounds =>12,
          :assists =>12,
          :steals =>22,
          :blocks =>5,
          :slam_dunks =>12
        },
      }
    },
  }
end

def num_points_scored(name)
  score = 0
  game_hash.each do |key,teams|
#    binding.pry
    game_hash[key][:players].each do |player_name,stats|
#      binding.pry
      if player_name == name
        score = game_hash[key][:players][player_name][:points]
      end
    end
  end
  score
end

#puts num_points_scored("Brendan Haywood")

def shoe_size(name)
  shoe = 0
  game_hash.each do |key,teams|
#    binding.pry
    game_hash[key][:players].each do |player_name,stats|
#      binding.pry
      if player_name == name
        shoe = game_hash[key][:players][player_name][:shoe]
      end
    end
  end
  shoe
end

def team_colors(team)
  color = []
  game_hash.each do |key,teams|
#    binding.pry
    if team == teams[:team_name]
      color = teams[:colors]
    end
  end
  color
end

def team_names()
  name = []
  game_hash.each do |key,teams|
#    binding.pry
    name << teams[:team_name]
  end
  name
end
#puts team_names("Brooklyn Nets")

def player_numbers(team_name)
  numbers = []
  game_hash.each do |key,teamAttributes|
    game_hash[key][:players].each do |player_name,stats|
      if team_name == teamAttributes[:team_name]
#        binding.pry
        numbers << game_hash[key][:players][player_name][:number]
      end
    end
  end
  numbers
end
#puts player_numbers("Brooklyn Nets")

def player_stats(givenPlayer)
  playerStats = {}
  game_hash.each do |side,teamAttributes|
    teamAttributes[:players].each do |name,stats|
      if givenPlayer == name
        playerStats = stats
      end
    end
  end
  playerStats
end

def big_shoe_rebounds
  biggestShoe = 0
  biggestRebounds = 0
  game_hash.each do |side,teamAttributes|
    teamAttributes[:players].each do |name,stats|
      if stats[:shoe] > biggestShoe
        biggestShoe = stats[:shoe]
        biggestRebounds = stats[:rebounds]
      end
    end
  end
  biggestRebounds
end

def most_points_scored
  biggestPlayer = ""
  biggestPoints = 0
  game_hash.each do |side,teamAttributes|
    teamAttributes[:players].each do |name,stats|
      if stats[:points] > biggestPoints
        biggestPoints = stats[:points]
        biggestPlayer = name
      end
    end
  end
  biggestPlayer
end
#puts most_points_scored

def winning_team
  winrar = ""
  scoreHome = 0
  scoreAway = 0

  #Sets the scores
  game_hash.each do |side,teamAttributes|
    if side == :home
      teamAttributes[:players].each do |name,stats|
        scoreHome += stats[:points]
      end
    end
    if side == :away
      teamAttributes[:players].each do |name,stats|
        scoreAway += stats[:points]
      end
    end
  end#Scores set

  #Determine Winner
  if scoreHome > scoreAway
    winrar = game_hash[:home][:team_name]
  else
    winrar = game_hash[:away][:team_name]
  end
  winrar
end
#puts winning_team

def player_with_longest_name
  longestName = ""
  game_hash.each do |side,teamAttributes|
    teamAttributes[:players].each do |name,stats|
      if name.length > longestName.length
        longestName = name
      end
    end
  end
  longestName
end
#puts player_with_longest_name

def long_name_steals_a_ton?
  longestSteals = 0
  thief = true
  #CopyPasta player_with_longest_name
  longestName = ""
  game_hash.each do |side,teamAttributes|
    teamAttributes[:players].each do |name,stats|
      if name.length > longestName.length
        longestName = name
        longestSteals = stats[:steals]
      end
    end
  end

  game_hash.each do |side,teamAttributes|
    teamAttributes[:players].each do |name,stats|
      if stats[:steals] > longestSteals
        thief = false
      end
    end
  end
  thief
end
