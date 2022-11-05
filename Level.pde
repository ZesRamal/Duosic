import processing.sound.*;
class Level {
    //Variables
    int notesQuantity, level;
    int frameCount = 0;
    int fadeoutSec = 0;
    boolean[] played;
    boolean[] priority;
    Note[] notes;
    
    NotePlayer actionerL = new NotePlayer(resizeX(560),resizeY(810), resizeX(200), 'l');
    NotePlayer actionerM = new NotePlayer(resizeX(860),resizeY(810), resizeX(200), 'm');
    NotePlayer actionerR = new NotePlayer(resizeX(1160),resizeY(810), resizeX(200), 'r');
    NotePlayer bad = new NotePlayer(resizeX(560),resizeY(810), resizeX(200), 'l');
    NotePlayer good = new NotePlayer(resizeX(560),resizeY(810), resizeX(200), 'l');
    NotePlayer perfect = new NotePlayer(resizeX(560),resizeY(810), resizeX(200), 'l');
    
    //Constructor
    Level(int notesQuantity, int level) {
        this.notesQuantity = notesQuantity;
        this.level = level;
        notes = new Note[notesQuantity];
        
        played = new boolean[notesQuantity];
        for (int i = 0; i < played.length; i++) {
            played[i] = false;
        }
        
        priority = new boolean[notesQuantity];
        for (int i = 0; i < priority.length; i++) {
            priority[i] = false;
        }
        
        priority[0] = true;
    } 
    
    //Functionality
    void plays() {
        buttons[17].draws();
        if (buttons[17].getIsPressed()) {
            levelNumber = 0;
            windowNumber = 0;
            createLevels();
        }
        actionerL.draws();
        actionerM.draws();
        actionerR.draws();
        //bad.draws();
        //good.draws();
        //perfect.draws();
        
        switch(level) {
            case 0:
                level1();
        }
        frameCount++;
    }
    
    // Create Level
    void level1() {
        // Notes Sheet
        playSong(beneathTheMask, 0.2, 2, 5); // playSong(songName,volume,startTime,endTime) 96
        drawNote(0, 0, 2, 0); // drawNote(position, second, speed, noteNum)
        drawNote(1, 1, 2, 1); 
        drawNote(2, 2, 2, 2);
    }
    
    void drawNote(int rml, int spawnSecond, float speed, int notePos) {
        if (!played[notePos]) { // If not been played.
            int x = 0;
            switch(rml) {
                case 0:
                    x = 575;
                    break;	
                case 1:
                    x = 960;
                    break;	
                case 2:
                    x = 1150;
                    break;	
            }
            if (frameCount >= secondsToFrames(spawnSecond)) { // Conditional for spawn time.
                notes[notePos] = new Note(resizeX(x),resizeY(270 + (frameCount - secondsToFrames(spawnSecond)) * speed),resizeX(200),rml);
                if (priority[notePos]) {
                    scoreNotation(notes[notePos], rml, notePos);
                }
                notes[notePos].draws();
                //!keys[0] && keyValid[0] // Se activa cuando se esta presionando.
            }
        }
    }
    
    void playSong(SoundFile song, float volume, int timeStart, int timeEnd) {
        if (frameCount >= secondsToFrames(timeStart) && frameCount < secondsToFrames(timeEnd)) {
            if (!song.isPlaying()) {
                song.stop();
                s.volume(volume);
                song.play();
            }
        } 
        if (frameCount == secondsToFrames(timeEnd + fadeoutSec) && volume - (volume / 10) * fadeoutSec > 0.0) {
            s.volume(volume - (volume / 10) * fadeoutSec);
            fadeoutSec++;
            System.out.println(volume - (volume / 10) * fadeoutSec);
        }
        if (volume <= 0.0) {
            s.volume(0);
            song.stop();
            levelCompleted();
            System.out.println(score);
        }
    }
    
    void scoreNotation(Note note, int keyPos, int arrayPos) {
        if (note.getPosY() <= resizeY(610) && keys[keyPos] || otherKeyPressed(keyPos) || note.getPosY() >= resizeY(980)) {
            System.out.println("Bad!");
            System.out.println(note.getPosY());
            priority[arrayPos] = false;
            priority[arrayPos + 1] = true;
            played[arrayPos] = true;
            disableKeys();
        } else if (note.getPosY() >= resizeY(611) && keys[keyPos] && note.getPosY() <= resizeY(729)) {
            System.out.println("Good!");
            System.out.println(note.getPosY());
            priority[arrayPos] = false;
            priority[arrayPos + 1] = true;
            played[arrayPos] = true;
            score += 100;
            disableKeys();
        } else if (note.getPosY() >= resizeY(730) && keys[keyPos] && note.getPosY() <= resizeY(765)) {
            System.out.println("Perfect!");
            System.out.println(note.getPosY());
            priority[arrayPos] = false;
            priority[arrayPos + 1] = true;
            played[arrayPos] = true;
            score += 200;
            disableKeys();
        }
    }
    
    boolean otherKeyPressed(int keyPos) {
        switch(keyPos) {
            case 0:
                if (keys[1] || keys[2]) {
                    return true;
                }
                break;
            case 1:
                if (keys[0] || keys[2]) {
                    return true;
                }
                break;	
            case 2:
                if (keys[1] || keys[0]) {
                    return true;
                }
                break;	
        }
        return false;
    }
}