class Note {
    // Variables
    float posX, posY;
    int size, hScale, pos;
    PImage noteImg;
    String t;
    
    // Constructor
    Note(float x, float y, float s, int p, String txt) {
        posX = x;
        posY = y;
        size = round(s);
        pos = p;
        t = txt;
        
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
        fill(0);
        textSize(resizeX(38));
        textAlign(CENTER, CENTER);
        text(t, posX + size / 2, posY + size / 2);
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
    
    void setPosY(float y) {
        posY = y;
    }
    
    void setText(String texto) {
        t = texto;
    }
}
