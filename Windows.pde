import processing.sound.*;

//Everything inside this is dedicated to draw the windows and other functionality

// Variables
PImage menuImg;
PImage levelSelectionImg;
PImage levelCompletedImg;
PImage helpImg;

SoundFile menuMusic, beneathTheMask, mirrorTemple, sweden, s_button;
Sound s = new Sound(this);

// Create/Load Functions
void createButtons() {
    buttons = new Button[20];
    buttons[0] = new Button(width / 2 - resizeX(800), height - resizeY(250), resizeX(400), resizeY(80), "Main Menu");
    buttons[1] = new Button(resizeX(760), resizeY(630), resizeX(380), resizeY(120), "Play"); // Open Song Selector Button
    buttons[2] = new Button(resizeX(760), resizeY(770), resizeX(380), resizeY(120), "Help"); // Instructions Screen Button
    buttons[3] = new Button(resizeX(760), resizeY(910), resizeX(380), resizeY(120), "Exit"); // Close Game Button
    buttons[4] = new Button(resizeX(200), height - resizeY(250), resizeX(650), resizeY(160), "Back"); // Return Button
    buttons[5] = new Button(resizeX(200), resizeY(650), resizeX(400), resizeY(80), "Play again"); // Retry Song Button
    
    // Song Selection Buttons.
    buttons[6] = new Button(resizeX(200), resizeY(300), resizeX(250), resizeY(80), "Beneath the Mask - Lyn"); // Behind the Mask Button
    buttons[7] = new Button(resizeX(200), resizeY(400), resizeX(250), resizeY(80), "Mirror Temple (Remix) - 2 Mello"); // Out of Touch Button
    buttons[8] = new Button(resizeX(200), resizeY(500), resizeX(250), resizeY(80), "Sweden - C418"); // Sweden Song Button
    
    
    buttons[17] = new Button(width - resizeX(500), resizeY(850), resizeX(400), resizeY(150), "Main Menu"); // Results Main Menu Button
    buttons[18] = new Button(0, resizeY(50), resizeX(150), resizeY(65), "Pause"); // Pause Button
}

void createLevels() {
    levels = new Level[3];
    levels[0] = new Level(5, 0);
    levels[1] = new Level(5, 1);
    levels[2] = new Level(5, 2);
}

void loadImages() {
    menuImg = loadImage("Images/MainMenu.png");
    menuImg.resize(width, height);
    
    levelSelectionImg = loadImage("Images/LevelSelection.png");
    levelSelectionImg.resize(width, height);
    
    levelCompletedImg = loadImage("Images/LevelCompleted.png");
    levelCompletedImg.resize(width, height);
    
    helpImg = loadImage("Images/Help.png");
    helpImg.resize(width, height);
}

void loadAudio() {
    menuMusic = new SoundFile(this, sketchPath("Sounds/MainMenu.wav"));
    beneathTheMask = new SoundFile(this, sketchPath("Sounds/BeneathTheMask.wav"));
    mirrorTemple = new SoundFile(this, sketchPath("Sounds/MirrorTemple.wav"));
    sweden = new SoundFile(this, sketchPath("Sounds/Sweden.wav"));
    s_button = new SoundFile(this, sketchPath("Sounds/ButtonEffect.wav"));
}

void menuMusicSystem() {
    if (!menuMusic.isPlaying() && windowNumber == 0) {
        menuMusic.stop();
        s.volume(1);
        menuMusic.play();
    } else if (!menuMusic.isPlaying() && windowNumber >= 2) {
        menuMusic.stop();
        menuMusic.play();
    }
    if (menuMusic.isPlaying() && windowNumber == 1) {
        menuMusic.stop();
    }
    
    
    if (!mirrorTemple.isPlaying() && windowNumber == 1 && levelNumber == 1) {
        mirrorTemple.stop();
        mirrorTemple.play();
    }
    if (!sweden.isPlaying() && windowNumber == 1 && levelNumber == 2) {
        sweden.stop();
        sweden.play();
    }
    if (windowNumber == 0) {
        beneathTheMask.stop();
        sweden.stop();
        mirrorTemple.stop();
    }
}
// Windows Functions
void menu() {
    image(menuImg, 0, 0);
    
    buttons[1].draws();
    if (buttons[1].getIsPressed()) {
        windowNumber = 2;
        s_button.play();
    }  
    
    buttons[2].draws();
    if (buttons[2].getIsPressed()) {
        windowNumber = 3;
        s_button.play();
    }  
    
    buttons[3].draws();
    if (buttons[3].getIsPressed()) {
        exit();
    }
}

void chooseLevel() {
    image(levelSelectionImg, 0, 0);
    
    buttons[4].draws();
    if (buttons[4].getIsPressed()) {
        windowNumber = 0;
        s_button.play();
    }
    
    buttons[6].draws();
    if (buttons[6].getIsPressed()) {
        levelNumber = 0;
        windowNumber = 1;
        score = 0;
        s_button.play();
    }
    buttons[7].draws();
    if (buttons[7].getIsPressed()) {
        levelNumber = 1;
        windowNumber = 1;
        score = 0;
        s_button.play();
    }
    buttons[8].draws();
    if (buttons[8].getIsPressed()) {
        levelNumber = 2;
        windowNumber = 1;
        score = 0;
        s_button.play();
    }
}

void help() {
    image(helpImg, 0, 0);
}

void levelCompleted() {
    image(levelCompletedImg, 0, 0);
    
    buttons[17].draws();
    if (buttons[17].getIsPressed()) {
        levelNumber = 0;
        windowNumber = 0;
    }
}


// HEAD - UP DISPLAY
//hud means head-up display, it is basically the interface that shows when you are playing, like the number of bullets you have, it shows information while in - game.
void hud() {
    
    buttons[18].draws();
    if (buttons[18].getIsPressed()) {
        levelNumber = 0;
        windowNumber = 0;
    }
    
}