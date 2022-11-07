import processing.sound.*;

//Everything inside this is dedicated to draw the windows and other functionality

// Variables
PImage menuImg;
PImage levelSelectionImg;
PImage levelCompletedImg;
PImage helpImg;
PImage songBg;
PImage rankS;
PImage rankA;
PImage rankB;
PImage rankC;
PImage rankD;
PImage rankF;
PImage perfect;
PImage good;
PImage bad;
PImage miss;

SoundFile menuMusic, beneathTheMask, mirrorTemple, sweden, s_button;
Sound s = new Sound(this);

// Create/Load Functions
void createButtons() {
    buttons = new Button[10]; // |     Position       |           Size            |   Type    | 
    buttons[0] = new Button(resizeX(185), resizeY(0), resizeX(175), resizeY(145), "Home");
    buttons[1] = new Button(resizeX(735), resizeY(630), resizeX(430), resizeY(145), "Play"); // Open Song Selector Button
    buttons[2] = new Button(resizeX(735), resizeY(770), resizeX(430), resizeY(145), "Help"); // Instructions Screen Button
    buttons[3] = new Button(resizeX(735), resizeY(910), resizeX(430), resizeY(145), "Quit"); // Close Game Button
    buttons[4] = new Button(resizeX(15), resizeY(0), resizeX(175), resizeY(145), "Back"); // Back Button
    buttons[5] = new Button(resizeX(1750), resizeY(0), resizeX(175), resizeY(145), "Retry"); // Retry Song Button
    
    // Song Selection Buttons.
    buttons[6] = new Button(resizeX(610), resizeY(400), resizeX(700), resizeY(200), "Beneath the Mask - Lyn"); // Behind the Mask Button
    buttons[7] = new Button(resizeX(610), resizeY(600), resizeX(700), resizeY(200), "Mirror Temple (Remix) - 2 Mello"); // Out of Touch Button
    buttons[8] = new Button(resizeX(610), resizeY(800), resizeX(700), resizeY(200), "Sweden - C418"); // Sweden Song Button
    test = new NotePlayer[3];
    test[0] = new NotePlayer(resizeX(630),resizeY(620), resizeX(130), 'l');
    test[1] = new NotePlayer(resizeX(630),resizeY(740), resizeX(130), 'm');
    test[2] = new NotePlayer(resizeX(1230),resizeY(620), resizeX(130), 'r');
}

void createLevels() {
    levels = new Level[3];
    levels[0] = new Level(150, 0);
    levels[1] = new Level(200, 1);
    levels[2] = new Level(500, 2);
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
    
    songBg = loadImage("Images/SongBackground.png");
    songBg.resize(width, height);
    
    rankS = loadImage("Images/RankS.png");
    rankS.resize(round(resizeX(430)), round(resizeY(430)));
    
    rankA = loadImage("Images/RankA.png");
    rankA.resize(round(resizeX(430)), round(resizeY(430)));
    
    rankB = loadImage("Images/RankB.png");
    rankB.resize(round(resizeX(430)), round(resizeY(430)));
    
    rankC = loadImage("Images/RankC.png");
    rankC.resize(round(resizeX(430)), round(resizeY(430)));
    
    rankD = loadImage("Images/RankD.png");
    rankD.resize(round(resizeX(430)), round(resizeY(430)));
    
    rankF = loadImage("Images/RankF.png");
    rankF.resize(round(resizeX(430)), round(resizeY(430)));
    
    perfect = loadImage("Images/Perfect.png");
    perfect.resize(round(resizeX(480)), round(resizeY(240)));
    
    good = loadImage("Images/Good.png");
    good.resize(round(resizeX(480)), round(resizeY(240)));
    
    bad = loadImage("Images/Bad.png");
    bad.resize(round(resizeX(480)), round(resizeY(240)));
    
    miss = loadImage("Images/Miss.png");
    miss.resize(round(resizeX(480)), round(resizeY(240)));
}

void loadAudio() {
    menuMusic = new SoundFile(this, sketchPath("Sounds/MainMenu.wav"));
    beneathTheMask = new SoundFile(this, sketchPath("Sounds/BeneathTheMask.wav"));
    mirrorTemple = new SoundFile(this, sketchPath("Sounds/MirrorTemple.wav"));
    sweden = new SoundFile(this, sketchPath("Sounds/Sweden.wav"));
    s_button = new SoundFile(this, sketchPath("Sounds/ButtonEffectLow.wav"));
}

void menuMusicSystem() {
    if (!menuMusic.isPlaying() && windowNumber == 0 || !menuMusic.isPlaying() && windowNumber == 4) {
        menuMusic.stop();
        s.volume(1);
        menuMusic.play();
    } else if (!menuMusic.isPlaying() && windowNumber >= 2) {
        menuMusic.stop();
        s.volume(1);
        menuMusic.play();
    }
    if (menuMusic.isPlaying() && windowNumber == 1) {
        menuMusic.stop();
    }
    
    if (windowNumber != 1) {
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
        s_button.play();
        windowNumber = 2;
    }  
    
    buttons[2].draws();
    if (buttons[2].getIsPressed()) {
        s_button.play();
        windowNumber = 3;
    }  
    
    buttons[3].draws();
    if (buttons[3].getIsPressed()) {
        s_button.play();
        exit();
    }
}

void chooseLevel() {
    image(levelSelectionImg, 0, 0);
    
    buttons[4].draws();
    if (buttons[4].getIsPressed()) {
        s_button.play();
        windowNumber = 0;
    }
    
    buttons[6].draws();
    if (buttons[6].getIsPressed()) {
        createLevels();
        s_button.play();
        levelNumber = 0;
        windowNumber = 1;
        score = 0;
        combo = 0;
    }
    buttons[7].draws();
    if (buttons[7].getIsPressed()) {
        createLevels();
        s_button.play();
        levelNumber = 1;
        windowNumber = 1;
        score = 0;
        combo = 0;
    }
    buttons[8].draws();
    if (buttons[8].getIsPressed()) {
        createLevels();
        s_button.play();
        levelNumber = 2;
        windowNumber = 1;
        score = 0;
        combo = 0;
    }
}

void help() {
    image(helpImg, 0, 0);
    buttons[4].draws();
    if (buttons[4].getIsPressed()) {
        levelNumber = 0;
        windowNumber = 0;
        s_button.play();
    }
    test[0].draws();
    test[1].draws();
    test[2].draws();
    textSize(resizeX(84));
    textAlign(LEFT);
    text("Created by: Cesar Ramos.",resizeX(0),resizeY(1070));
}

void levelCompleted() {
    image(levelCompletedImg, 0, 0);
    scoreRank();
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
        windowNumber = 1;
    }
}

void scoreRank() {
    switch(levelNumber) {
        case 0 :
            if (score > 1200) {
                image(rankS, round(resizeX(1000)), round(resizeY(550)));
            } else if (score > 1000) {
                image(rankA, round(resizeX(1000)), round(resizeY(550)));
            } else if (score > 800) {
                image(rankB, round(resizeX(1000)), round(resizeY(550)));
            } else if (score > 600) {
                image(rankC, round(resizeX(1000)), round(resizeY(550)));
            } else if (score > 400) {
                image(rankD, round(resizeX(1000)), round(resizeY(550)));
            } else if (score < 400) {
                image(rankF, round(resizeX(1000)), round(resizeY(550)));
            }
            break;	
        case 1 :
            if (score > 1200) {
                image(rankS, round(resizeX(1000)), round(resizeY(550)));
            } else if (score > 1000) {
                image(rankA, round(resizeX(1000)), round(resizeY(550)));
            } else if (score > 800) {
                image(rankB, round(resizeX(1000)), round(resizeY(550)));
            } else if (score > 600) {
                image(rankC, round(resizeX(1000)), round(resizeY(550)));
            } else if (score > 400) {
                image(rankD, round(resizeX(1000)), round(resizeY(550)));
            } else if (score < 400) {
                image(rankF, round(resizeX(1000)), round(resizeY(550)));
            }
            break;	
        case 2 :
            if (score > 1200) {
                image(rankS, round(resizeX(1000)), round(resizeY(550)));
            } else if (score > 1000) {
                image(rankA, round(resizeX(1000)), round(resizeY(550)));
            } else if (score > 800) {
                image(rankB, round(resizeX(1000)), round(resizeY(550)));
            } else if (score > 600) {
                image(rankC, round(resizeX(1000)), round(resizeY(550)));
            } else if (score > 400) {
                image(rankD, round(resizeX(1000)), round(resizeY(550)));
            } else if (score < 400) {
                image(rankF, round(resizeX(1000)), round(resizeY(550)));
            }
            break;	
    }
}