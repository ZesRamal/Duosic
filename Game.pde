import processing.sound.*;
static Level level;
static Level[] levels;
static int levelNumber = 0;
static int windowNumber = 0;
static int score = 0;

Button[] buttons;

void setup() {
    frameRate(60);
    size(800,600);
    // fullScreen();
    createLevels();
    createButtons();
    loadImages();
    loadAudio();
    windowNumber = 0;
    keyValid[0] = true;
    keyValid[1] = true;
    keyValid[2] = true;
}

void draw() {
    background(0,0,0);
    //Will draw the game according to the variable windowNumber 
    switch(windowNumber) {
        case 0 : // Main Menu
            menu();
            break;
        case 1 : // Levels
            level = levels[levelNumber];buttons[0] = new Button(width / 2 - resizeX(800), height - resizeY(250), resizeX(400), resizeY(80), "Main Menu");
            levels[levelNumber].plays();
            break;
        case 2 : // Level Selector
            chooseLevel();
            break;
        case 3 : // Instructions Screen
            help();
            break;
        case 4:
            levelCompleted(); // Results Screen
            break;
    }
    //Needs to be called on the end of this function  
    disableKeys();
    
    menuMusicSystem();
    //text(frameRate, width/2, height/2);
}


// Controls (Multiple Controls)  
//I made this controls system, so it gives you multiple controls, example: you can press W and D at the same time to move the player in the diagonal
static boolean[] keys = new boolean[5];
static boolean[] keyValid = new boolean[3];

void keyPressed() {    
    if (key == 'a' && keyValid[0] == true) {
        keys[0] = true;
        keyValid[0] = false;
    }
    if (key == 's' && keyValid[1] == true) {
        keys[1] = true;
        keyValid[1] = false;
    }
    if (key == 'd' && keyValid[2] == true) {
        keys[2] = true;
        keyValid[2] = false;
    }
}

void keyReleased() {
    if (key == 'a') {
        keys[0] = false;
        keyValid[0] = true;
    }
    
    if (key == 's') {
        keys[1] = false;
        keyValid[1] = true; 
        
    } 
    if (key == 'd') {
        keys[2] = false;
        keyValid[2] = true;
    }
}

void mousePressed() {    
    if (mouseButton ==  LEFT)
        keys[3] = true;
    if (mouseButton ==  RIGHT)
        keys[4] = true;
    
    if (windowNumber == 3) {
        windowNumber = 0;
        keys[3] = false;
    }
}

void disableKeys() {
    //Will disable the keys, after you press it will automaticly disable making you press only one time.
    if (keys[3])
        keys[3] = false;
    
    if (keys[4])
        keys[4] = false;
    
    if (keys[0]) {
        keys[0] = false;
    }
    
    if (keys[1]) {
        keys[1] = false;
    }
    
    if (keys[2]) {
        keys[2] = false;
    }
}


// Global Function  

//in case you are playing in a different resolution it will automatically set all the scales according to your resolution, even in fullscreen!
float resizeX(float value) {
    float newValue = (width * value) / 1920;
    return newValue;
}

float resizeY(float value) {
    float newValue = (height * value) / 1080;
    return newValue;
}

int secondsToFrames(int value) {
    int frames = value * 60;
    return frames;
}