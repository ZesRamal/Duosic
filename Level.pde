class Level {
    //Variables
    int notesQuantity, level;
    int frameCount = 0;
    int fadeoutSec = 0;
    int noteCount = 0;
    String str = "";
    boolean[] played;
    boolean[] priority;
    Note[] notes;
    int currentNum = 1;
    String[] sheet;
    
    NotePlayer actionerL = new NotePlayer(resizeX(560),resizeY(810), resizeX(200), 'l');
    NotePlayer actionerM = new NotePlayer(resizeX(860),resizeY(810), resizeX(200), 'm');
    NotePlayer actionerR = new NotePlayer(resizeX(1160),resizeY(810), resizeX(200), 'r');
    
    TimingText sign = new TimingText(resizeX(1450), resizeY(390), resizeX(480), resizeY(240));
    
    //Constructor
    Level(int notesQuantity, int level) {
        this.notesQuantity = notesQuantity;
        this.level = level;
        notes = new Note[notesQuantity];
        sheet = new String[notesQuantity];
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
    public void plays() {
        actionerL.draws();
        actionerM.draws();
        actionerR.draws();
        switch(level) {
            case 0:
                level1();
                break;
            case 1:
                level2();
                break;
            case 2:
                level3();
                break;
        }
        if (keys[0]) {
            sheet[noteCount] = "drawNote(" + 0 + ", " + (frameCount - 157) + ", " + 1.75 + ", " + noteCount + ");";
            noteCount++;
            disableKeys();
        }
        if (keys[1]) {
            sheet[noteCount] = "drawNote(" + 1 + ", " + (frameCount - 157) + ", " + 1.75 + ", " + noteCount + ");";
            noteCount++; 
            disableKeys();
        }
        if (keys[2]) {
            sheet[noteCount] = "drawNote(" + 2 + ", " + (frameCount - 157) + ", " + 1.75 + ", " + noteCount + ");";
            noteCount++;
            disableKeys();
        }
        frameCount++;
        sign.draws(str);
    }
    
    // Create Level
    public void level1() {
        // Notes Sheet
        playSong(beneathTheMask, 0.2, 2, 15 * fr); // playSong(songName,volume,startFrame,endFrame) 96
        // drawNote(position, frameStart, speed, noteNum)
        drawNote(1, 169, 1.75, 0);
    }
    
    void level2() {
        playSong(mirrorTemple, 0.2, 2, 96 * fr);
        
    }
    
    void level3() {
        playSong(sweden, 1, 2, 96 * fr);
    }
    
    public void drawNote(int rml, int spawnFrame, float speed, int notePos) {
        if (!played[notePos] && frameCount >= spawnFrame) { // If not been played.
            if (notes[notePos] == null) {
                int x = 0;
                switch(rml) {
                    case 0:
                        x = 585;
                        break;	
                    case 1:
                        x = 885;
                        break;	
                    case 2:
                        x = 1185;
                        break;	
                }
                if (currentNum > 5) {
                    currentNum = 1;
                }
                notes[notePos] = new Note(resizeX(x), resizeY(270), resizeX(150), rml, String.valueOf(currentNum));
                currentNum++;
            }
            if (priority[notePos]) {
                scoreNotation(notes[notePos], rml, notePos);
                if (notes[notePos].getPosY() >= resizeY(830) || notes[notePos].getPosY() <= resizeY(831)) {
                    
                }
            }
            notes[notePos].setPosY(resizeY(270) + (frameCount - spawnFrame) * speed); // 
            notes[notePos].draws();
            //!keys[0] && keyValid[0] // Se activa cuando se esta presionando.
        }
    }
    
    public void playSong(SoundFile song, float volume, int frameStart, int frameEnd) {
        if (frameCount >= frameStart && frameCount < frameEnd) {
            if (!song.isPlaying()) {
                song.stop();
                s.volume(volume);
                song.play();
            }
        } 
        if (frameCount >= (frameEnd + secondsToFrames(fadeoutSec)) && volume - (volume / 10) * fadeoutSec > 0.0) {
            s.volume(volume - (volume / 10) * fadeoutSec);
            fadeoutSec++;
        }
        if (volume - (volume / 10) * fadeoutSec <= 0) {
            s.volume(0);
            song.stop();
            if (frameCount >= (frameEnd + secondsToFrames(11))) {
                for (int i = noteCount; i == 0; i--) {
                    System.out.println(sheet[i]);
                }
                windowNumber = 4;
            }
        }
    }
    
    public void scoreNotation(Note note, int keyPos, int arrayPos) {
        if (note.getPosY() <= resizeY(735) && keys[keyPos] || otherKeyPressed(keyPos) || note.getPosY() >= resizeY(925)) {
            priority[arrayPos] = false;
            priority[arrayPos + 1] = true;
            played[arrayPos] = true;
            combo = 0;
            str = "Miss";
            disableKeys();
        } else if (keys[keyPos] && note.getPosY() >= resizeY(820) && note.getPosY() <= resizeY(840)) {
            priority[arrayPos] = false;
            priority[arrayPos + 1] = true;
            played[arrayPos] = true;
            score += 200;
            str = "Perfect";
            combo++;
            disableKeys();
        } else if (keys[keyPos] && (note.getPosY() >= resizeY(790) && note.getPosY() < resizeY(820) || note.getPosY() > resizeY(840) && note.getPosY() <= resizeY(870))) {
            priority[arrayPos] = false;
            priority[arrayPos + 1] = true;
            played[arrayPos] = true;
            score += 100;
            str = "Good";
            combo++;
            disableKeys();
        } else if (keys[keyPos] && (note.getPosY() > resizeY(735) && note.getPosY() <= resizeY(789) || note.getPosY() >= resizeY(870) && note.getPosY() < resizeY(925))) {
            priority[arrayPos] = false;
            priority[arrayPos + 1] = true;
            played[arrayPos] = true;
            score += 25;
            str = "Bad";
            combo++;
            disableKeys();
        }
    }
    
    public boolean otherKeyPressed(int keyPos) {
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