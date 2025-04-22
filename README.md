Alphabet Catching Game
Overview
The Alphabet Catching Game is an interactive assembly language game designed for DOS environments. Players navigate a cursor to catch falling alphabetic characters on the screen to score points. The game features colorful backgrounds, real-time keyboard input, and a scoring system that tracks successful catches and misses.
Prerequisites

DOS Environment: The game is designed to run on a DOS operating system or a DOS emulator like DOSBox.
Assembler: A 16-bit assembler such as NASM or TASM to compile the assembly code.
Hardware: A system or emulator supporting 80x25 text mode video (VGA-compatible).

Installation

Clone or Download: Obtain the source code (alphabetcatching.asm).
Assemble the Code:
Use an assembler like NASM:nasm -f bin -o alphabetcatching.com alphabetcatching.asm

This generates a .com executable file.

Run in DOS:
Launch DOSBox or a similar emulator.
Navigate to the directory containing alphabetcatching.com.
Run the game by typing:alphabetcatching.com

How to Play

Start the Game:
Run the executable.
Press Enter to begin.

Objective:
Use the left arrow (scan code 0x4B) and right arrow (scan code 0x4D) keys to move the cursor at the bottom of the screen.
Catch falling letters by positioning the cursor directly beneath them as they reach the bottom row.

Scoring:
Score: Increments by 1 for each letter caught.
Misses: Increments by 1 for each letter missed, up to a maximum of 10 misses.
The game ends when 10 letters are missed.

Game Over:
When 10 misses are reached, the screen displays "Game Over!" and the final score.

Features

Colorful Display: The screen is divided into sections with different background colors (green, purple, red, orange, blue) for visual appeal.
Real-Time Input: Custom keyboard interrupt handler for smooth left/right cursor movement.
Random Letter Generation: Letters appear at random columns and fall at varying speeds.
Score Tracking: Displays current score and number of misses in real-time.
Game Over Screen: Shows final score and "Game Over!" message when the game ends.

Technical Details

Memory Model: COM file format, starting at org 0x100.
Video Mode: Uses 80x25 text mode, writing directly to video memory at segment 0xB800.
Interrupts:
Custom keyboard interrupt (INT 9) for arrow key detection.
Timer interrupt (INT 8) for controlling letter movement timing.

Random Number Generation: Linear Congruential Generator (LCG) seeded with system time for random letter positioning.
Data Structures:
buffer: Array of letters A-Z.
num: Initial column positions for falling letters.
alpha: Tracks current letter indices.
tick: Timers for controlling letter movement speed.
score and miss: Track player performance.

File Structure

alphabetcatching.asm: The main assembly source code.
alphabetcatching.com: The compiled executable (generated after assembling).

Limitations

Platform: Only runs in a 16-bit DOS environment or emulator.
Input: Limited to left and right arrow keys for cursor movement.
Game Over: Ends after 10 misses with no option to restart without relaunching.

Future Improvements

Add a restart option after game over.
Support additional input keys for enhanced gameplay.
Include sound effects for catching letters or game over.
Implement difficulty levels with increasing letter fall speeds.

Troubleshooting

Game Doesn’t Start: Ensure the .com file is correctly assembled and you’re running it in a DOS environment.
Keyboard Issues: Verify that DOSBox or your emulator is configured to capture keyboard input.
Display Problems: Confirm VGA text mode compatibility in your emulator settings.

License
This project is provided as-is for educational purposes. Feel free to modify and distribute under the terms of the MIT License.
Acknowledgments

Built using 8086 assembly for learning and nostalgia.
Inspired by classic DOS-based arcade games.
