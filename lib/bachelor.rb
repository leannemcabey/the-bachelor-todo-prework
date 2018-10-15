def get_first_name_of_season_winner(data, season)
  winner_name = ""
  data.each do |season_number, contestants|
    if season_number == season
      contestants.each do |contestant|
        contestant.each do |attribute, value|
          if attribute == "status" && value == "Winner"
            contestant.each do |attribute, value|
              if attribute == "name"
                winner_name = value
              end
            end
          end
        end
      end
    end
  end
  winner_name.split[0]
end

def get_contestant_name(data, occupation)
  contestant_name = ""
  data.each do |season_number, contestants|
    contestants.each do |contestant|
      contestant.each do |attribute, value|
        if attribute == "occupation" && value == occupation
          contestant.each do |attribute, value|
            if attribute == "name"
              contestant_name = value
            end
          end
        end
      end
    end
  end
  contestant_name
end

def count_contestants_by_hometown(data, hometown)
  count = 0
  data.each do |season_number, contestants|
    contestants.each do |contestant|
      contestant.each do |attribute, value|
        if attribute == "hometown" && value == hometown
          count +=1
        end
      end
    end
  end
  count
end

def get_occupation(data, hometown)
  contestant_occupation = ""
  data.each do |season_number, contestants|
    contestants.each do |contestant|
      contestant.each do |attribute, value|
        if attribute == "hometown" && value == hometown
          contestant.each do |attribute, value|
            if attribute == "occupation"
              while contestant_occupation == ""
                contestant_occupation = value
              end
            end
          end
        end
      end
    end
  end
  contestant_occupation
end

def get_average_age_for_season(data, season)
  age_sum = 0
  contestant_count = 0
  data.each do |season_number, contestants|
    if season_number == season
      contestants.each do |contestant|
        contestant.each do |attribute, value|
          if attribute == "age"
            age_sum = age_sum + value.to_f
            contestant_count += 1
          end
        end
      end
    end
  end
  avg = age_sum / contestant_count
  avg.round
end
