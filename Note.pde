class Note {
    // Variables
    float posX, posY;
    int size, hScale, pos;
    PImage noteImg;
    
    // Constructor
    Note(float x, float y, float s, int p) {
        posX = x;
        posY = y;
        size = round(s);
        pos = p;
        
        switch(pos) {
            case 0:
                noteImg = loadImage("Images/NoteLeft.png");
                noteImg.resize(size, size);
                break;
            case 1:
                noteImg = loadImage("Images/NoteMiddle.png");
                noteImg.resize(size, size);
                break;
            case 2:
                noteImg = loadImage("Images/NoteRight.png");
                noteImg.resize(size, size);
                break;
        }
    }
    
    
    // Functionality
    
    void draws() {
        image(noteImg, posX, posY);
        fill(255);
    }
    
    float getPosX() {
        return posX;
    }
    
    float getPosY() {
        return posY;
    }
    
    float getScaleW() {
        return size;
    }
    
    float getScaleH() {
        return hScale;
    }
    
    void setPosXY(float x, float y) {
        posX = x;
        posY = y;
    }
}
