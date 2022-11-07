class NotePlayer {
    //Variables
    
    float posX, posY;
    int size, keyPos;
    
    PImage notePlayerUnpressed, notePlayerPressed;
    
    
    //Constructor
    
    // NotePlayer(PositionX, PositionY, Size, ChartPosition)
    NotePlayer(float x, float y, float s, char pos) {
        posX = x;
        posY = y;
        size = round(s);
        
        
        switch(pos) {
            case 'l' :
                keyPos = 0;
                notePlayerUnpressed = loadImage("Images/RedNotePlayerUnpressed.png");
                notePlayerUnpressed.resize(size, size);
                notePlayerPressed = loadImage("Images/RedNotePlayerPressed.png");
                notePlayerPressed.resize(size, size);
                break;	
            case 'm' :
                keyPos = 1;
                notePlayerUnpressed = loadImage("Images/YellowNotePlayerUnpressed.png");
                notePlayerUnpressed.resize(size, size);
                notePlayerPressed = loadImage("Images/YellowNotePlayerPressed.png");
                notePlayerPressed.resize(size, size);
                break;	
            case 'r' :
                keyPos = 2;
                notePlayerUnpressed = loadImage("Images/BlueNotePlayerUnpressed.png");
                notePlayerUnpressed.resize(size, size);
                notePlayerPressed = loadImage("Images/BlueNotePlayerPressed.png");
                notePlayerPressed.resize(size, size);
                break;	
        }   
    }
    
    
    //Functionality
    
    void draws() {
        if (!keyValid[keyPos]) {
            image(notePlayerPressed, posX, posY);
        } else {
            image(notePlayerUnpressed, posX, posY);
        }
    }
}