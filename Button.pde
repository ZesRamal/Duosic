class Button {
    //Variables
    
    float posX, posY;
    int wScale, hScale;
    String text;
    boolean mouseInside;
    
    PImage buttonImg, buttonPressedImg;
    
    
    //Constructor
    
    // Button(PositionX,PositionY,Height,Width,Text)
    Button(float x, float y, float w, float h, String t) {
        posX = x;
        posY = y;
        wScale = round(w);
        hScale = round(h);
        text = t;
        
        buttonImg = loadImage("Images/Button.png");
        buttonImg.resize(wScale, hScale);
        buttonPressedImg = loadImage("Images/ButtonPressed.png");
        buttonPressedImg.resize(wScale, hScale);
    }
    
    
    //Functionality
    
    void draws() {
        if (mouseX >= posX && mouseX <= posX + wScale && mouseY >= posY && mouseY <= posY + hScale) 
            mouseInside = true;
        else
            mouseInside = false;
        
        
        
        if (mouseInside) {
            image(buttonPressedImg, posX, posY);
            fill(255);
            textSize(resizeX(50));
            textAlign(CENTER, CENTER);
            text(text, posX + wScale / 2, posY + hScale / 2);
        } else {
            image(buttonImg, posX, posY);
            fill(0);
            textSize(resizeX(50));
            textAlign(CENTER, CENTER);
            text(text, posX + wScale / 2, posY + hScale / 2);
        }
    }
    
    
    //get Functions
    
    boolean getIsPressed() {
        if (mouseInside && keys[3])
            return true;
        
        return false;
    }
}
