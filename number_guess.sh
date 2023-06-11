#! /bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# This variable will hold a random number ranging from 1 to 1000
GENERATE_RANDOM_NUMBER=$(($(($RANDOM%1000-1+1))+1))
SECRET_NUMBER=$GENERATE_RANDOM_NUMBER

echo "Enter your username:"
read USERNAME

CHECK_USERNAME=$($PSQL "SELECT COUNT(*) FROM players WHERE username ILIKE '$USERNAME';")
# if username is not registered
if [[ ! $CHECK_USERNAME -eq 1 ]]
then
  # insert username into playes table
  INSERT_USERNAME_RESULT=$($PSQL "INSERT INTO players (username) VALUES ('$USERNAME');")
  if [[ "$INSERT_USERNAME_RESULT" = "INSERT 0 1" ]]
  then
    # get user_id
    USER_ID=$($PSQL "SELECT user_id FROM players WHERE username= '$USERNAME';")
    # ehco welcome new user
    echo "Welcome, $USERNAME! It looks like this is your first time here."
  fi
# if username is registered
else 
  # get user_id
  USER_ID=$($PSQL "SELECT user_id FROM players WHERE username= '$USERNAME';")
  # get games_played using username
  GAMES_PLAYED=$($PSQL "SELECT COUNT(*) FROM games_history WHERE user_id= $USER_ID;")
  # get best_game using username
  BEST_GAME=$($PSQL "SELECT MIN(number_of_guesses) FROM games_history WHERE user_id= $USER_ID;")
  # echo welcome back .....
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

# START GAME
# echo Guess the secret number between 1 and 1000:
echo "Guess the secret number between 1 and 1000:"
# read the guessed number 
  read GUESSED_NUMBER

# create variable number_of_guesses
NUMBER_OF_GUESSES=1
# WHILE LOOP end if guess is right
while [ $GUESSED_NUMBER != $SECRET_NUMBER ]
do
  # if input is not integer
  if [[ ! $GUESSED_NUMBER =~ ^[0-9]+$ ]]
  then
    # echo That is not an integer, guess again:
    echo "That is not an integer, guess again:"
  else
    # if guessed number > than actual
    if [[ $GUESSED_NUMBER -gt $SECRET_NUMBER ]]
    then
      # echo hint It's lower than that, guess again:
      echo "It's lower than that, guess again:"
    # if guessed number < than actual
    elif [[ $GUESSED_NUMBER -lt $SECRET_NUMBER ]]
    then
      # echo hint It's higher than that, guess again:
      echo "It's higher than that, guess again:"
    fi
  fi
  # read the guessed number 
  read GUESSED_NUMBER
  # increment number_of_guesses
  NUMBER_OF_GUESSES=$(($NUMBER_OF_GUESSES+1))
done

# if the number is guessed
# insert game into games_history table
INSERT_GAME_RESULT=$($PSQL "INSERT INTO games_history (user_id, number_of_guesses) VALUES($USER_ID, $NUMBER_OF_GUESSES);")
# echo You guessed it in <number_of_guesses> tries. The secret number was <secret_number>. Nice job!
echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"
