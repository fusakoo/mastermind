# Mastermind
CLI-based [Mastermind](https://en.wikipedia.org/wiki/Mastermind_(board_game)) game built in Ruby.

---

### Features
V2: Codemaker mode now available (10/11/2020)
- Players can now come up with a code and challenge Computer to guess the secret code

V1: Codebreaker mode now available (10/06/2020)
- 12-turn based Mastermind game with feedback mechanism
- Colorized pegs using the Colorize gem

### TODO
- Optimize CPU codebreaker algorithm  
Currently it's not the smartest. It will shuffle through the guess with 4 red/white peg feedback thus there is a possibility it will not be able to guess the secret code within 12 turns.
- Organize/clean-up code and add more documentation

---

### Gems used
- [Colorize](https://github.com/fazibear/colorize): Ruby string extension using ANSI escape sequence to color texts.

---

### Bug Log
10/10/2020 Current State - vs CPU Codebreaker  
<s>There's currently a conflict between the computer codebreaker logic vs board feedback logic.
Updated feedback logic now supports support for variants ordered differently than suggested list of colors (i.e. cyan blue, magenta red).  
However, there seems to be an issue with computer algorithm side that isn't effectively utilizing the feedbacks.</s>  
Resolved as of 10/11/2020

### Things I learned
- Better understanding of accessing variables in different classes (@ and @@ variables)
- Leveraging gem to implement feature (i.e. CLI colorization)
- Writing overall structure as pseudocode to better gain overall understanding of logic
- Instance method vs Class Method, and how module method interacts/merges into one another
- sleep(*args) to 'animate' the computer thought process
- There is a rails feature for enumerable (i.e. exclude?) that I wanted to use in this project, but decided to code with pure Ruby for the learning purpose
