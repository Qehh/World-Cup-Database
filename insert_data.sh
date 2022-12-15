#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do 
   
  if [[ $WINNER != "winner" ]]
  then
    TEAM=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")

    if [[ $TEAM == "INSERT 0 1" ]]
      then
        echo Inserted into team, $WINNER
    fi
     
  fi

  if [[ $OPPONENT != "opponent" ]]
  then
    TEAM2=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")

    if [[ $OPPONENT == "INSERT 0 1" ]]
      then
        echo Inserted into team, $OPPONENT
    fi
  fi

  WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER'")
  OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT'")

  if [[ $WINNER_ID != $OPPONENT_ID ]]
  then
    if [[ $YEAR != 'year' ]]
    then 
      INSERT_VALUE=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR,  '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS)")
    fi
  fi
done