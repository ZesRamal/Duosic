class TimingText {
    
    //Variables
    
    float posX, posY;
    int wScale, hScale;
    
    //Constructor
    
    // Button(PositionX,PositionY,Height,Width,Text)
    TimingText(float x, float y, float w, float h) {
        posX = x;
        posY = y;
        wScale = round(w);
        hScale = round(h);
    }
    
    
    //Functionality
    
    void draws(String txt) {
        switch(txt) {
            case "Perfect" :
                image(perfect, posX, posY);
                break;	
            case "Good" :
                image(good, posX, posY);
                break;	
            case "Bad" :
                image(bad, posX, posY);
                break;	
            case "Miss" :
                image(miss, posX, posY);
                break;	
            default:
            image(miss, 0, 0, 1, 1);
            break;		
        }
    }
}
