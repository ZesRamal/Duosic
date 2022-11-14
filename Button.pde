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
        
        switch(t) {
            case "Play" :
                buttonImg = loadImage("Images/PlayButton.png");
                buttonImg.resize(wScale, hScale);
                buttonPressedImg = loadImage("Images/PlayButtonPressed.png");
                buttonPressedImg.resize(wScale, hScale);
                break;	
            case "Help" :
                buttonImg = loadImage("Images/HelpButton.png");
                buttonImg.resize(wScale, hScale);
                buttonPressedImg = loadImage("Images/HelpButtonPressed.png");
                buttonPressedImg.resize(wScale, hScale);
                break;	
            case "Quit" :
                buttonImg = loadImage("Images/QuitButton.png");
                buttonImg.resize(wScale, hScale);
                buttonPressedImg = loadImage("Images/QuitButtonPressed.png");
                buttonPressedImg.resize(wScale, hScale);
                break;	
            case "Home" :
                buttonImg = loadImage("Images/HomeButton.png");
                buttonImg.resize(wScale, hScale);
                buttonPressedImg = loadImage("Images/HomeButtonPressed.png");
                buttonPressedImg.resize(wScale, hScale);
                break;	
            case "Retry" :
                buttonImg = loadImage("Images/RetryButton.png");
                buttonImg.resize(wScale, hScale);
                buttonPressedImg = loadImage("Images/ResetButtonPressed.png");
                buttonPressedImg.resize(wScale, hScale);
                break;	
            case "Back" :
                buttonImg = loadImage("Images/BackButton.png");
                buttonImg.resize(wScale, hScale);
                buttonPressedImg = loadImage("Images/BackButtonPressed.png");
                buttonPressedImg.resize(wScale, hScale);
                break;	
            case "Beneath the Mask - Lyn" :
                buttonImg = loadImage("Images/MaskButton.png");
                buttonImg.resize(wScale, hScale);
                buttonPressedImg = loadImage("Images/MaskButtonPressed.png");
                buttonPressedImg.resize(wScale, hScale);
                break;	
            case "Mirror Temple (Remix) - 2 Mello" :
                buttonImg = loadImage("Images/MirrorButton.png");
                buttonImg.resize(wScale, hScale);
                buttonPressedImg = loadImage("Images/MirrorButtonPressed.png");
                buttonPressedImg.resize(wScale, hScale);
                break;	
            case "Sweden - C418" :
                buttonImg = loadImage("Images/SwedenButton.png");
                buttonImg.resize(wScale, hScale);
                buttonPressedImg = loadImage("Images/SwedenButtonPressed.png");
                buttonPressedImg.resize(wScale, hScale);
                break;
            default:
            buttonImg = loadImage("Images/Button.png");
            buttonImg.resize(wScale, hScale);
            buttonPressedImg = loadImage("Images/ButtonPressed.png");
            buttonPressedImg.resize(wScale, hScale);
            break;		
        }
    }
    
    
    //Functionality
    
    void draws() {
        if (mouseX >= posX && mouseX <= posX + wScale && mouseY >= posY && mouseY <= posY + hScale) 
            mouseInside = true;
        else
            mouseInside = false;
        
        
        
        if (mouseInside) {
            image(buttonPressedImg, posX, posY);
        } else {
            image(buttonImg, posX, posY);
        }
    }
    
    
    //get Functions
    
    boolean getIsPressed() {
        if (mouseInside && keys[3])
            return true;
        
        return false;
    }
}