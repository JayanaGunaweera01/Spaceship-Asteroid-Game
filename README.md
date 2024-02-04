# Spaceship-Asteroid-Game

This project is developing a B specification of an Asteroids arcade game, using the B tools Atelier B & ProB.

![Screenshot 2024-02-04 221357](https://github.com/JayanaGunaweera01/Spaceship-Asteroid-Game/assets/79576139/0970f6d5-d170-457c-8752-71b62d54abe7)

•
Space is made up of regions (squares of the grid) 12 wide by 7 high.
•
The regions of space are populated by 11 asteroids, each in one region of space, and located as shown in Figure 1.
•
The Spaceship occupies only one square at a time which must be either an "empty space square" or the Starbase in its square (6,4).
For example, the Spaceship can be in region (5, 3), but not (8, 3) as it is occupied by an asteroid.
•
The Spaceship is initially in its homebase, i.e. the bottom left square (1, 1).
•
The spaceship can make a normal move, i.e. from one region of space (grid square) to an adjacent one, in one of four directions: Up, Down, Left and Right.
•
It uses up 5 units of power when it makes a normal move.
•
The spaceship can engage its warp-drive to “jump” to any region of space, except one occupied by an asteroid. It must not travel outside known space, i.e. outside the grid.
•
It uses up 20 units of power when it engages its warp-drive, no matter how far it moves.
•
If the spaceship crashes into one of the asteroids it loses 10 units of power and bounces back into the square it came from.
•
It cannot do a move for which it does not have the required amount of power.

The state of the game is one of the following:
•
the spaceship docks at the Starbase, in which case the game has been Won.
•
the spaceship is not docked at the Starbase & can not move because it has run out of power, in which case the game is Lost.
•
otherwise the game is not over.

## 2 Develop a B Specification of the Regions of Space, Spaceship & Asteroids

### 2.1 Sets and Constants
Any sets and constants that are required to define the data and state of the spaceship, space, asteroids and their properties

### 2.2 System State
The state variables required to represent space, asteroids and the spaceship. Including the state invariant and initialisation.
You can assume that the spaceship starts at its homebase, has no power yet, has not had any collisions and it has only visited the regions of space its homebase is located in.

### 2.3 New Game
To start or re-start the game use the NewGame( power ) operation. This should reset the spaceship to the initial state, except that it sets its power level to the value of the power parameter.

### 2.4 Spaceship Movements in Space
Note that all movement operations must report the outcome of an attempted movement. That is, either it was successful, failed due to space boundary issues, failed due to an asteroid, or failed for some other reason.

### 2.4.1 Normal Spaceship Movements
The following operations are the basic movements that all move the spaceship one region (square) in the appropriate direction in space and uses up 5 units of the spaceship's power:

•
MoveUp
•
MoveDown
•
MoveLeft
•
MoveRight

If the move results in the spaceship hitting an asteroid the spaceship remains in its current location, but its power is reduced by 10 units.
If any attempted movement cannot be performed because of the boundary of space or insufficient power then an error is reported.

### 2.4.2 Warp-drive Spaceship Movement
The movement operation:
•
WarpDrive( newposition )
where the player enters the newposition parameter, the region of space (i.e. grid co-ordinates) that the spaceship should warp jump to. Engaging the warp-drive uses up 20 units of the spaceship's power.

If the warp-drive cannot be used because the destination region input is either not within the known regions of space or is occupied by an asteroid or if there is insufficient power to use the warp-drive then an appropriate error message should be reported.
2.5 Spaceship's Mission Status
An enquiry operation MissionStatus that reports the current status of the spaceship:
•
the game status (WON, LOST, or NOT_OVER),
•
its current location,
•
its current power reserves,
•
how many asteroid collisions it has had.

### 2.6 Spaceship's Mission Route
An enquiry operation RegionsVisited that reports the regions of space that the spaceship has travelled through.

