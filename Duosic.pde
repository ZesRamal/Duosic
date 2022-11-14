import processing.sound.*;
static Level level;
static Level[] levels;
static int levelNumber = 0;
static int windowNumber = 0;
static int score = 0;
static int fr = 45;
static int combo = 0;

Button[] buttons;
NotePlayer[] test;

void setup() {
    loadAudio();
    loadImages();
    frameRate(fr);
    size(718, 512);
    //fullScreen();
    createLevels();
    createButtons();
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
            image(songBg, 0, 0);
            buttons[0].draws(); // Home
            if (buttons[0].getIsPressed()) {
                levelNumber = 0;
                windowNumber = 0;
                s_button.play();
            }
            buttons[4].draws(); // Back
            if (buttons[4].getIsPressed()) {
                beneathTheMask.stop();
                mirrorTemple.stop();
                sweden.stop();
                createLevels();
                s.volume(1);
                s_button.play();
                windowNumber = 2;
            }
            buttons[5].draws(); // Retry
            if (buttons[5].getIsPressed()) {
                beneathTheMask.stop();
                mirrorTemple.stop();
                sweden.stop();
                createLevels();
                s.volume(1);
                s_button.play();
                score = 0;
                combo = 0;
            }
            level = levels[levelNumber];
            levels[levelNumber].plays();
            fill(194,74,178);
            textSize(resizeX(120));
            textAlign(LEFT);
            text(String.valueOf(score),resizeX(960),resizeY(160));
            textAlign(CENTER);
            text(String.valueOf(combo),resizeX(240),resizeY(630));
            break;
        case 2 : // Level Selector
            chooseLevel();
            break;
        case 3 : // Controls Screen
            help();
            break;
        case 4 : // Result Screen
            levelCompleted(); // Results Screen
            fill(194,74,178);
            textSize(resizeX(150));
            textAlign(LEFT);
            text(String.valueOf(score),resizeX(990),resizeY(580));
            break;
    }
    //Needs to be called on the end of this function  
    disableKeys();
    
    menuMusicSystem();
    //text(frameRate, width/2, height/2);
    System.gc();
}


// Controls (Multiple Controls)  
//I made this controls system, so it gives you multiple controls, example: you can press W and D at the same time to move the player in the diagonal
static boolean[] keys = new boolean[5];
static boolean[] keyValid = new boolean[3];

void keyPressed() {    
    if ((key == 'a' || key == 'A') && keyValid[0] == true) {
        keys[0] = true;
        keyValid[0] = false;
    }
    if ((key == 's' || key == 'S') && keyValid[1] == true) {
        keys[1] = true;
        keyValid[1] = false;
    }
    if ((key == 'd' || key == 'D') && keyValid[2] == true) {
        keys[2] = true;
        keyValid[2] = false;
    }
}

void keyReleased() {
    if (key == 'a' || key == 'A') {
        keys[0] = false;
        keyValid[0] = true;
    }
    
    if (key == 's' || key == 'S') {
        keys[1] = false;
        keyValid[1] = true; 
        
    } 
    if (key == 'd' || key == 'D') {
        keys[2] = false;
        keyValid[2] = true;
    }
}

void mousePressed() {    
    if (mouseButton ==  LEFT)
        keys[3] = true;
    if (mouseButton ==  RIGHT)
        keys[4] = true;
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
    int frames = value * fr;
    return frames;
}
