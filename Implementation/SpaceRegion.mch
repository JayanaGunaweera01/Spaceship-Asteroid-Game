/* Spaceship
 * Author: Jayana
 * Creation date: 1/1/2024
 */
MACHINE
    SpaceRegion

CONSTANTS
    MAX_X_AXIS,               // Maximum value for the X-axis in the space region
    MAX_Y_AXIS,               // Maximum value for the Y-axis in the space region
    SPACE_REGION_COORDINATES, // Set of all coordinates in the space region
    ASTEROID_COORDINATES,     // Set of coordinates occupied by asteroids
    EMPTY_SPACE_COORDINATES,  // Set of coordinates available for spaceship movement
    HOME_BASE_COORDINATE,     // Coordinate of the home base
    STAR_BASE_COORDINATE      // Coordinate of the star base
    
PROPERTIES
    // Width and height of the SpaceRegion
    MAX_X_AXIS <: NATURAL1 & MAX_X_AXIS = 1..12 &
    MAX_Y_AXIS <: NATURAL1 & MAX_Y_AXIS = 1..7 &
     
    // Relationship of the SpaceRegion with axis
    SPACE_REGION_COORDINATES : MAX_X_AXIS <-> MAX_Y_AXIS &
    SPACE_REGION_COORDINATES = MAX_X_AXIS * MAX_Y_AXIS &

    // Subset of ASTEROID_COORDINATES of SpaceRegion
    ASTEROID_COORDINATES <: SPACE_REGION_COORDINATES &
    ASTEROID_COORDINATES = {(3 |-> 2), (3 |-> 5), (5 |-> 4), (6 |-> 7), (7 |-> 1), (7 |-> 5), (7 |-> 7), (8 |-> 3), (10 |-> 6), (11 |-> 2), (12 |-> 5)} &

    // Empty space that spaceship can move without asteroid collision
    EMPTY_SPACE_COORDINATES = SPACE_REGION_COORDINATES - ASTEROID_COORDINATES &
    EMPTY_SPACE_COORDINATES /\ ASTEROID_COORDINATES = {} & EMPTY_SPACE_COORDINATES \/ ASTEROID_COORDINATES = SPACE_REGION_COORDINATES &
 
    // Relationship with empty space and their definitions 
    HOME_BASE_COORDINATE : EMPTY_SPACE_COORDINATES & HOME_BASE_COORDINATE = (1 |-> 1) &
    STAR_BASE_COORDINATE : EMPTY_SPACE_COORDINATES & STAR_BASE_COORDINATE = (6 |-> 4)

END
