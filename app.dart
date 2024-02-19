import 'dart:io';
import 'dart:math';

void main() {

  while (true) {
    print("Press Enter to Play or Q and Enter to Exit");
    String? instr = stdin.readLineSync();
    
    if((instr == 'Q') || instr == 'q') {
      break;
    }

    int attempts = 5;
    int random_number = ranNumGen();

    for (int i = attempts; i > 0; i--){
      print("Guess the Random Number. You have $i attempts.");
      print("Enter Your Guess:");
      if(checkGuess(random_number)){
        print("Success!");
        break;
      }
    }

    print("Sorry Try Again. The Magic Number was: $random_number. \n");
  }
}

int ranNumGen() {
  Random random = Random();
  int ran = random.nextInt(100) + 1;
  return ran;
}

bool checkGuess(int ran) {
  String? guess = stdin.readLineSync();
  int intGuess = 0;

  while(true){
    if(guess==null || guess==""){
      print("Please Enter Your Guess or Ctrl C to Exit Game: ");
      guess = stdin.readLineSync();
    }
    else {
      try {
       intGuess = int.parse(guess.toString());
      }
      on Exception {
        print("Please Enter Your Guess or Ctrl C to Exit Game: \n");
        guess = stdin.readLineSync();
        continue;
      }
      break;
    }
  }

  if(ran==intGuess){
    return true;
  }
  else if (intGuess > ran) {
    print("Number Guessed > the Magic Number.\n");
  }
  else {
    print("Number Guessed < the Magic Number.\n");
  }
  return false;
}



