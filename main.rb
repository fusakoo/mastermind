# Mastermind
# Codemaker: create 4 color combination (color can be repeated ; 6^4 = 1296 possibilities)
# Codebreaker: guess within 12 turns the combination

# 6 color codepegs: red, orange, blue, teal, green, purple
# Clues: ! for correct position/color, ? for correct color/wrong position, blank for incorrect
# - Q: should the feedback be provided in order, or at random? (if latter, need to randomnize response)

# Computer algorithm
# Codemaker: just create a random 4 color combination
# - need an algorithm to properly provide feedback/clues

# Codebreaker: can start off by 2-2 pattern

# Initial ideas
# 4 color combo will be an array (i.e. ["red", "red", "teal", "purple"]
# CPU as CM: Take user input with gets (either one color per line, or all at once)
# - store the user input into temporary array
# - reset the temporary array if not correct

# Gameplay
# Phase1: vs CPU CM
# 1. Provide game instruction
# 2. Gets the user inputs for 4 guesses
#   - Convert inputs into array
# 3. Compare the user inputs with the code
# 4. Provide feedback/clues
#   - IF guessed correct, game is finished (go to step 6)
#   - ELSE loop 2,3,4 until 5
# 5. Once 12 turns/loops are complete, game over
# 6. Ask user to play again or not

# Phase2: vs CPU CB
# 1. Provide game instruction
# 2. Gets user input for the code
# 3. Run CPU guessing algorithm for first guess
#   - IF bot guesses correctly, game is finished (go to step 7)
# 4. Let user provide feedback
# 5. Run CPU guessing algorithm again
#   - IF bot guesses correctly, game is finished
#   - ELSE loop 3,4,5 until 6
# 6. If 12 turns pass (which shouldn't be possible, shoudl be able to guess within <5 turns), game over
#   - Edge case would be that the user kept on providing wrong feedback (prevent w/ repeated instruction)
# 7. Ask user to play again or not