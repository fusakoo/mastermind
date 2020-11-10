# Mastermind
CLI-based [Mastermind](https://en.wikipedia.org/wiki/Mastermind_(board_game)) game built in Ruby.

---

### Features
V1: Codebreaker mode now available (10/06/2020)
- 12-turn based Mastermind game with feedback mechanism
- Colorized pegs using the Colorize gem

### TODO
- Implement Codemaker mode (vs Computer)

---

### Gems used
- [Colorize](https://github.com/fazibear/colorize): Ruby string extension using ANSI escape sequence to color texts.

---

### Bug Log
10/10/2020 Current State - vs CPU Codebreaker
There's currently a conflict between the computer codebreaker logic vs board feedback logic
Example: if the secret code is 'red yellow red yellow', the feedback for 'red red yellow yellow' is two red pegs (2 correct position)
The current computer logic will not be able to guess/resolve if the feedback isn't 2 red pegs, 2 white pegs
- This currently prevents any secret code that switches the order of color from the provided color scheme
- i.e. 'red red blue blue' can be solved, but 'blue red red red' cannot be solved.

### Things I learned
- Better understanding of accessing variables in different classes (@ and @@ variables)
- Leveraging gem to implement feature (i.e. CLI colorization)
- Writing overall structure as pseudocode to better gain overall understanding of logic
- Instance method vs Class Method, and how module method interacts/merges into one another
- sleep(*args) to 'animate' the computer thought process

