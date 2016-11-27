# Semester-1-Assignment
Thomas Delaney DT228/2 Assignment for Semester 1 Object Orientated Programming
YouTube video demonstrating the project - https://www.youtube.com/watch?v=QOrg6sqlTO8

My UI is based off the Blizzard video game Overwatch!
It is inspired by the AI in the game called Athena which helps keep track of all the heroes in the game.

The background throughout the UI was procedurally drawn using lerpColor and small rects,
the background is drawn once via function in main and is called in setup() at the end of this function the background
is saved into a jpg file which is then called at the start of draw(), it is saved into a photo because if the background was 
continuesly being drawn every fps then the general fps slows down to an unusuable amount, this was the background can be displayed
without slowing down the system. Throughout the program being executed there is a song being played in the background.

There is an int value which will hold the state variable of the UI and an if statement in draw() will check and display the current state every FPS.
Each state/screen has its own class.

When the program is ran there involves a loading screen involving a procedurally drawn shape which is the
"Athena" logo with some text which then brings the user to a log in screen (which is a class) where the user can log in to the system.
There are 4 boxes on the screen, a box for the user to enter their username and a box for password, there is a box labelled
'register' and one labelled 'log in'. If the user hovers over any box the box is scaled by 1.1 and handelled with push/popMatrix().
If the user clicks on the username or password box the box is filled grey and will stay scaled until the user clicks anywhere else on the page.
The user can switch between these boxes with the up and down arrows as well as the shift button.
If either box is clicked the user can now enter their username/password, there is a class called "Creds" which handles this input, some keys are
checked like the DELETE key etc to avoid unwanted user input. Creds contains 2 simple attributes of a float x and a character c.
The key entered after going through error checking will then be added to an object of Creds and there will be a general X value for the intro screen which will
be added to this object and then incremented by a certain amount. If the backspace key is pressed then the last added Cred will be removed from the Creds array list
and the general X will be decremented, error checked applies to avoid an array out of bounds exception.
A function in the login/intro screen will then loop through an array list of Creds which holds 
every object created for the username or password, the character variable is from each object is then displayed to the screen at their corresponding x value.
For the password however dots are displayed since its a password, the characters are still in the array list though which will be used to confirm the login 
once the login button is clicked, the enter key can also be pressed to trigger the login button. 

If the login button is clicked then a function is called which puts each character from the array list of Creds into a character array, there is 
then a built in java function called String.valueOf() which converts character arrays into strings. There is a class called User which will be used to 
hold the informtation from the logins.txt file which is a tsv file which contains a username and a password, these are all the currently registered users
that are allowed use Athena. An array list of type User is created back in main and a Table in the login screen which will store all info from the logins.txt file.
The number of rows are counted by getRowCount() and a for loop is used to check if the now String of the username and password matches any from the file, this is done by loading
a username and password from a file into a new User object then comparing its attributes (which is a username and password) to the users entered username and password, if there
is a match then the state is changed and the home screen is then loaded in.
Else a 'User not found' message is displayed to the user.

I imported 2 java libraries called java.awt.Toolkit and java.awt.event.KeyEvent which will be used to check, in this case, if the caps lock key has been pressed.
If so then a message is displayed to the user so they know the Caps lock key is pressed, to ensure better user input.

If the user clicks the register page, then the state is changed and new screen with 4 boxes appear, one to take input for the users password and username they want to
register (input functionality is the same as the input boxes on the login screen except the password characters are displayed instead of dots) and a box labelled 'create' 
which will write to the logins.txt file if the username is not already being used, and one labelled 'return' which will just bring the user back to the login page. I imported 
the java library java.io.FileWriter which is used to create a FileWriter object which will write the users entered username and password to the logins.txt file. 
A loop is used to check before hand to see if the user entered username is not already in the logins.txt file, if it is then a message is displayed to the user, else then 
the user is brought back to the login page after a slight delay.

If the user passes the login successfully then the state is changed and the home screen is loaded in.

The home screen contains a lot of stuff. Theres a clock with date on the top left and beside it theres a button labbeled 'Hero Database'. Most of the screen is taken up
by the big 2D world map with these red circles and red arcs spinning around them. There is a button labelled 'logout' at the bottom left of the screen, there is a graphic at the
right handside of the screen with moving horizontal lines with the users username along with a procedurally drawn Overwatch logo beside it (the Athena and Overwatch logo
are apart of a class called Logo). The graphic is scalled depending on the length of the username, which has a max length of 12. 

The clock/date is made with the built in functions day(), minute(), second() etc, this will just get SYSDATE info. They are then displayed to the user along with an extra 0 
if the numbers are less than 10. The logout button when clicked will clear the username and password and its array lists associated with their respective Creds and will change the
state back to the login state thus bringing the user back to the login/intro screen. The hero database box when clicked will change the state and bring the user to the hero database
page. The moving lines are stored in an array list of type movingLine which is a class which contains an x and y value and a variable called inc, this will just be used to increase
the lines y value until it reaches the end of the screen then is reset. 

The map and circles are related to the Overwatch heroes. There is a file called heroes.txt which hold hero information including 2 latitude and longitude values. The hero info for
each hero is stored in an array list of Hero objects which is loaded via for loop in setup(); the Hero class is used to store this information from the txt file. The latitude and 
longitude values for each hero are mapped using the map function between the x and y value of the world map, a red ellipse is then drawn at this x and y value with an arc but 
with an increased radius. The arc moves depending on a lastAngle variable which gets increased by a variable theta every fps and is reset to 0 at 2PI. If the users hovers over 
any of the ellipses then another circle is drawn at the respective x and y value but with a larger radius and the color is now yellow to indicate that you are currently over
this hero. If a dot is clicked then the yellow ellipse will stay but the red arc will remain until anywhere else on the screen is clicked, the heroes name is displayed beside 
the ellipse and a sound for each hero is played. This sound is stored in the data folder and is named 'hero name'.mp3, so the Hero class has an attribute of type SoundFile called 
greeting, when a Hero object is created its name is then concatinated with .mp3 and that file is stored in greeting. 

If the user clicks the hero database button then the state will be changed to display the hero database. This will involve two classes, heroBox and heroDatabase.
heroDatabase will display all the heroBoxes as well as a return button back to the home page and display an Overwatch logo. heroBox is a class which constructor takes in 
a Hero object. Every Hero from the Hero array list is loaded into a heroBox array list on the heroDatabase page, also on this page there is a general x and y value which will
increase in the y axis until the next box would go off the screen, it is then reset and the x value is then increased. This will print a clickable
box labelled by every hero name in the Hero array list. Each hero has a specific index number which is assigned by i in the for loop where they are loaded from the heroes.txt file
from setup(). The main program has a variable called heroIndex, when the mouse hovers over any of the heroBoxes the heroIndex is assigned the index from the Hero which represents
that heroBox (this will be easier to understand in the youtube video). When the box is clicked the state is changed and a heroPage is displayed, a heroPage function takes in
a hero index, ONE heroPage is created in main, the function (called printPage) will take in the index of the hero of the hero from the heroBox. Here's the cool part.. since 
the heroPage knows the hero index, it can use that to get the Hero object related to that index from the Hero array list, this will allow the page to display that specific heroes
information. Each hero page contains a return button back to the heroDatabase and information related to that hero which was taken from the heroes.txt file as well as a jpg image
of the hero which is an attribute to every Hero class.

As well there is some graphs related to that hero (the numbers are randomised they are not taken from a file), this involves a bar graph with a constantly increasing and decreasing width,
a spinning pie chart with text, and a graph with 4 sine waves (Each graph is an object of a class for each graph and involve 4 types of info, breating rate, blood pressure, power 
and brain activity, all with its different colors). The sine wave class takes in parameters for how fast theta is incremented and how high the wave is, this is randomised for 
each hero, the sine waves are stored in an array list contained in each Hero class (same with the bar chart, the spinning pie chart however is static to every heroPage).

So thats it, thats my UI! Have fun with it :)

