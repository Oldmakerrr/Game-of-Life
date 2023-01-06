# Game-of-Life

The Game of Life, also known simply as Life, is a cellular automaton devised by the British mathematician John Horton Conway in 1970. 
It is a zero-player game, meaning that its evolution is determined by its initial state, requiring no further input. 
One interacts with the Game of Life by creating an initial configuration and observing how it evolves.

![Simulator Screen Recording - iPhone 14 Pro - 2023-01-06 at 16 54 21](https://user-images.githubusercontent.com/92182846/211017284-96b32f1a-4db3-490d-9db9-a059fa216eda.gif)

<img src="https://user-images.githubusercontent.com/92182846/211017284-96b32f1a-4db3-490d-9db9-a059fa216eda.gif" width=30% height=30%"/>

<p float="left">
<img src="https://user-images.githubusercontent.com/92182846/205901816-d1d2c614-19c0-4f07-8061-527a9965a724.png" width=30% height=30%>
 
</p>

# Rules

The universe of the Game of Life is an infinite, two-dimensional orthogonal grid of square cells, each of which is in one of two possible states, 
live or dead (or populated and unpopulated, respectively). Every cell interacts with its eight neighbours, which are the cells that are horizontally, 
vertically, or diagonally adjacent. At each step in time, the following transitions occur:

 - Any live cell with fewer than two live neighbours dies, as if by underpopulation.
 - Any live cell with two or three live neighbours lives on to the next generation.
 - Any live cell with more than three live neighbours dies, as if by overpopulation.
 - Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.
