# Alphabet Catching Game

## Overview

The Alphabet Catching Game is an interactive assembly language game designed for DOS environments. Players navigate a cursor to catch falling alphabetic characters on the screen to score points. The game features colorful backgrounds, real-time keyboard input, and a scoring system that tracks successful catches and misses.

## Prerequisites

DOS Environment: Requires a DOS operating system or emulator (e.g., DOSBox).
Assembler: 16-bit assembler like NASM or TASM.
Hardware: VGA-compatible system/emulator supporting 80x25 text mode.

## Installation

Clone or Download: Obtain the source code (alphabetcatching.asm).

## Assemble the Code:

nasm -f bin -o alphabetcatching.com alphabetcatching.asm

This creates a .com executable.

## Run in DOS:

Open DOSBox or a similar emulator.

Navigate to the directory with alphabetcatching.com.

Execute:
alphabetcatching.com

## Gameplay

Starting:
Launch the game and press Enter to begin.

Objective:
Use left arrow (scan code 0x4B) and right arrow (scan code 0x4D) keys to move the cursor at the bottom of the screen.
Catch falling letters by aligning the cursor directly beneath them as they reach the bottom row.

Scoring:
Score: Increments by 1 for each letter caught.
Misses: Increments by 1 for each letter missed, up to a maximum of 10.
The game ends when 10 letters are missed.

Game Over:
Displays "Game Over!" and the final score when 10 misses are reached.

## Features

Colorful Interface: Screen divided into sections with green, purple, red, orange, and blue backgrounds.
Real-Time Input: Custom keyboard interrupt handler for smooth left/right cursor movement.
Random Letters: Letters appear at random columns and fall at varying speeds.
Score Display: Real-time display of score and miss count.
End Screen: Shows "Game Over!" message and final score.

## Technical Details

Memory Model: COM file format, starting at org 0x100.
Video Mode: Uses 80x25 text mode, writing directly to video memory at segment 0xB800.
Interrupts:
INT 9: Custom keyboard handler for arrow key detection.
INT 8: Timer interrupt for controlling letter movement timing.

Randomization: Linear Congruential Generator (LCG) seeded with system time for random letter positioning.
Data Structures:
buffer: Array of letters A-Z.
num: Initial column positions for falling letters.
alpha: Tracks current letter indices.
tick: Timers for controlling letter movement speed.
score, miss: Track player performance.

## File Structure

alphabetcatching.asm: The main assembly source code.
alphabetcatching.com: The compiled executable (generated after assembling).

## Limitations

Platform: Only runs in 16-bit DOS environments or emulators.
Input: Limited to left and right arrow keys for cursor movement.
Game Over: Ends after 10 misses with no option to restart without relaunching.

## Future Enhancements

Add a restart option after game over.
Support additional input keys for enhanced gameplay.
Include sound effects for catching letters or game over.
Implement difficulty levels with increasing letter fall speeds.

## Troubleshooting

Game Won’t Start: Ensure the .com file is correctly assembled and running in a DOS environment.
Keyboard Issues: Verify that DOSBox or your emulator is configured to capture keyboard input.
Display Errors: Confirm VGA text mode compatibility in your emulator settings.

## License

This project is provided as-is for educational purposes under the MIT License. Feel free to modify and distribute.

## Acknowledgments

Built using 8086 assembly for learning and nostalgia.
Inspired by classic DOS-based arcade games.
