# v1.5 - Current Version

- Implemented an updated move function
	- Move restrictions
	- Move canceling

# v1.4

- Implemented an automatic turn-based system
	- After every move, it switches turns
- Implemented Aiden's attack function to my code

# v1.3

- Initialized enemy characters
- Created a randomization for both friendly and enemy characters
	- No character will be in the same square
- Updated cursor behavior
	- Cursor will not turn green when on enemy characters, but will turn green when on friendly characters
	- Cursor will not select enemy characters, only friendly characters
	- Added different colour to cursor when currently moving a friendly character
- Friendly characters now have collide checking with other characters, including enemy characters
- Changed colour of characters
	- Friendly: Red &rarr; Blue
	- Enemy: Green &rarr; Red
- Added tons of comments for readability

# v1.2

- Initialized cursor colouring when on a character

# v1.1

- Updated further simplified code by using `box_size`
- Changed colour for dead character (from `0, 0, 0` to `100, 100, 100`)
- Added prototype to character randomization
- Fixed minor bug
	- Changed `if (!dead)` into `if (dead)`

# v1.0

**This is the first version of Jovian's version of the Processing RPG.**

This contains some simplified code of the already previous code that exists in this repository.
It contains all the good stuff:

- Prototype grid
- Character selection
	- Drag
	- Drop
- Collision Detection
	- Character and border
	- Character and character 
- Health points and death checking

There will be more to come: this is far from done...

## Game created...
