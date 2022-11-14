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
        //if (keys[0]) {
        //sheet[noteCount] = "drawNote(" + 0 + ", " + (frameCount - 158) + ", " + 2 + ", " + (noteCount) + ");"; // 158 for 2 175 for 1
        //noteCount++;
        //disableKeys();
    //}
        //if (keys[1]) {
        //sheet[noteCount] = "drawNote(" + 1 + ", " + (frameCount - 158) + ", " + 2 + ", " + (noteCount) + ");";
        //noteCount++; 
        //disableKeys();
    //}
        //if (keys[2]) {
        //sheet[noteCount] = "drawNote(" + 2 + ", " + (frameCount - 158) + ", " + 2 + ", " + (noteCount) + ");";
        //noteCount++;
        //disableKeys();
    //}
        frameCount++;
        sign.draws(str);
    }
    
    // Create Level
    public void level1() {
        // Notes Sheet
        playSong(beneathTheMask, 0.2, 0, 85 * fr); // playSong(songName,volume,startFrame,endFrame) 96
        // drawNote(position, frameStart, speed, noteNum)
        drawNote(0, 3785, 1.5, 107);
        drawNote(2, 3765, 1.5, 106);
        drawNote(1, 3747, 1.5, 105);
        drawNote(2, 3721, 1.5, 104);
        drawNote(1, 3694, 1.5, 103);
        drawNote(2, 3667, 1.5, 102);
        drawNote(1, 3641, 1.5, 101);
        drawNote(0, 3494, 1.5, 100);
        drawNote(2, 3475, 1.5, 99);
        drawNote(1, 3458, 1.5, 98);
        drawNote(2, 3430, 1.5, 97);
        drawNote(1, 3404, 1.5, 96);
        drawNote(2, 3378, 1.5, 95);
        drawNote(1, 3350, 1.5, 94);
        drawNote(0, 3204, 1.5, 93);
        drawNote(1, 3185, 1.5, 92);
        drawNote(2, 3166, 1.5, 91);
        drawNote(1, 3087, 1.5, 90);
        drawNote(2, 3073, 1.5, 89);
        drawNote(1, 3056, 1.5, 88);
        drawNote(1, 3021, 1.5, 87);
        drawNote(2, 2936, 1.5, 86);
        drawNote(1, 2922, 1.5, 85);
        drawNote(2, 2910, 1.5, 84);
        drawNote(1, 2892, 1.5, 83);
        drawNote(1, 2874, 1.5, 82);
        drawNote(0, 2787, 1.5, 81);
        drawNote(1, 2776, 1.5, 80);
        drawNote(1, 2765, 1.5, 79);
        drawNote(2, 2747, 1.5, 78);
        drawNote(1, 2731, 1.5, 77);
        drawNote(0, 2619, 1.5, 76);
        drawNote(1, 2600, 1.5, 75);
        drawNote(1, 2583, 1.5, 74);
        drawNote(0, 2573, 1.5, 73);
        drawNote(0, 2507, 1.5, 72); 
        drawNote(1, 2493, 1.5, 71);
        drawNote(2, 2476, 1.5, 70);
        drawNote(1, 2462, 1.5, 69);
        drawNote(1, 2443, 1.5, 68);
        drawNote(0, 2434, 1.5, 67);
        drawNote(0, 2356, 1.5, 66);
        drawNote(2, 2344, 1.5, 65);
        drawNote(2, 2330, 1.5, 64);
        drawNote(1, 2313, 1.5, 63);
        drawNote(2, 2295, 1.5, 62);
        drawNote(1, 2208, 1.5, 61);
        drawNote(2, 2196, 1.5, 60);
        drawNote(2, 2184, 1.5, 59);
        drawNote(1, 2165, 1.5, 58);
        drawNote(0, 2148, 1.5, 57);
        drawNote(0, 2039, 1.5, 56);
        drawNote(2, 2020, 1.5, 55);
        drawNote(1, 2004, 1.5, 54);
        drawNote(0, 1923, 1.5, 53);
        drawNote(1, 1911, 1.5, 52);
        drawNote(2, 1895, 1.5, 51);
        drawNote(1, 1876, 1.5, 50);
        drawNote(1, 1859, 1.5, 49);
        drawNote(0, 1849, 1.5, 48);
        drawNote(0, 1760, 1.5, 47);
        drawNote(1, 1742, 1.5, 46);
        drawNote(2, 1729, 1.5, 45);
        drawNote(2, 1710, 1.5, 44);
        drawNote(1, 1701, 1.5, 43);
        drawNote(2, 1603, 1.5, 42);
        drawNote(1, 1586, 1.5, 41);
        drawNote(1, 1568, 1.5, 40);
        drawNote(0, 1560, 1.5, 39);
        drawNote(0, 1458, 1.5, 38);
        drawNote(1, 1439, 1.5, 37);
        drawNote(2, 1420, 1.5, 36);
        drawNote(1, 1411, 1.5, 35);
        drawNote(0, 1341, 1.5, 34);
        drawNote(1, 1329, 1.5, 33);
        drawNote(1, 1311, 1.5, 32);
        drawNote(2, 1294, 1.5, 31);
        drawNote(2, 1277, 1.5, 30);
        drawNote(1, 1269, 1.5, 29);
        drawNote(0, 1163, 1.5, 28);
        drawNote(2, 1146, 1.5, 27);
        drawNote(2, 1128, 1.5, 26);
        drawNote(1, 1120, 1.5, 25);
        drawNote(1, 1018, 1.5, 24);
        drawNote(2, 1006, 1.5, 23);
        drawNote(1, 990, 1.5, 22);
        drawNote(0, 973, 1.5, 21);
        drawNote(0, 872, 1.5, 20);
        drawNote(2, 853, 1.5, 19);
        drawNote(1, 834, 1.5, 18);
        drawNote(2, 808, 1.5, 17);
        drawNote(1, 779, 1.5, 16);
        drawNote(2, 753, 1.5, 15);
        drawNote(1, 725, 1.5, 14);
        drawNote(0, 578, 1.5, 13);
        drawNote(2, 558, 1.5, 12);
        drawNote(1, 540, 1.5, 11);
        drawNote(2, 513, 1.5, 10);
        drawNote(1, 487, 1.5, 9);
        drawNote(2, 462, 1.5, 8);
        drawNote(1, 436, 1.5, 7);
        drawNote(0, 287, 1.5, 6);
        drawNote(2, 269, 1.5, 5);
        drawNote(1, 249, 1.5, 4);
        drawNote(2, 223, 1.5, 3);
        drawNote(1, 197, 1.5, 2);
        drawNote(2, 170, 1.5, 1);
        drawNote(1, 142, 1.5, 0);
        
    }
    
    void level2() {
        playSong(mirrorTemple, 0.2, 0, 75 * fr);
        drawNote(0, 3442, 2, 223);
        drawNote(1, 3429, 2, 222);
        drawNote(1, 3415, 2, 221);
        drawNote(2, 3403, 2, 220);
        drawNote(1, 3398, 2, 219);
        drawNote(0, 3392, 2, 218);
        drawNote(1, 3380, 2, 217);
        drawNote(2, 3367, 2, 216);
        drawNote(1, 3354, 2, 215);
        drawNote(0, 3342, 2, 214);
        drawNote(1, 3329, 2, 213);
        drawNote(1, 3316, 2, 212);
        drawNote(2, 3304, 2, 211);
        drawNote(1, 3297, 2, 210);
        drawNote(0, 3292, 2, 209);
        drawNote(1, 3277, 2, 208);
        drawNote(1, 3265, 2, 207);
        drawNote(0, 3253, 2, 206);
        drawNote(1, 3240, 2, 205);
        drawNote(2, 3233, 2, 204);
        drawNote(1, 3217, 2, 203);
        drawNote(0, 3203, 2, 202);
        drawNote(2, 3197, 2, 201);
        drawNote(1, 3190, 2, 200);
        drawNote(0, 3176, 2, 199);
        drawNote(1, 3165, 2, 198);
        drawNote(2, 3151, 2, 197);
        drawNote(1, 3139, 2, 196);
        drawNote(1, 3127, 2, 195);
        drawNote(0, 3114, 2, 194);
        drawNote(2, 3100, 2, 193);
        drawNote(1, 3088, 2, 192);
        drawNote(2, 3076, 2, 191);
        drawNote(1, 3064, 2, 190);
        drawNote(2, 3051, 2, 189);
        drawNote(1, 3040, 2, 188);
        drawNote(1, 3027, 2, 187);
        drawNote(0, 3013, 2, 186);
        drawNote(2, 3000, 2, 185);
        drawNote(1, 2989, 2, 184);
        drawNote(2, 2976, 2, 183);
        drawNote(1, 2963, 2, 182);
        drawNote(2, 2950, 2, 181);
        drawNote(1, 2937, 2, 180);
        drawNote(1, 2925, 2, 179);
        drawNote(0, 2912, 2, 178);
        drawNote(2, 2899, 2, 177);
        drawNote(1, 2887, 2, 176);
        drawNote(2, 2875, 2, 175);
        drawNote(1, 2862, 2, 174);
        drawNote(2, 2850, 2, 173);
        drawNote(1, 2837, 2, 172);
        drawNote(1, 2824, 2, 171);
        drawNote(0, 2812, 2, 170);
        drawNote(2, 2799, 2, 169);
        drawNote(1, 2788, 2, 168);
        drawNote(2, 2774, 2, 167);
        drawNote(1, 2760, 2, 166);
        drawNote(2, 2747, 2, 165);
        drawNote(1, 2735, 2, 164);
        drawNote(1, 2724, 2, 163);
        drawNote(0, 2710, 2, 162);
        drawNote(2, 2698, 2, 161);
        drawNote(1, 2685, 2, 160);
        drawNote(2, 2673, 2, 159);
        drawNote(1, 2660, 2, 158);
        drawNote(2, 2647, 2, 157);
        drawNote(1, 2634, 2, 156);
        drawNote(1, 2621, 2, 155);
        drawNote(0, 2609, 2, 154);
        drawNote(2, 2597, 2, 153);
        drawNote(1, 2584, 2, 152);
        drawNote(2, 2572, 2, 151);
        drawNote(1, 2560, 2, 150);
        drawNote(2, 2546, 2, 149);
        drawNote(1, 2533, 2, 148);
        drawNote(1, 2522, 2, 147);
        drawNote(0, 2508, 2, 146);
        drawNote(2, 2494, 2, 145);
        drawNote(1, 2483, 2, 144);
        drawNote(2, 2470, 2, 143);
        drawNote(1, 2458, 2, 142);
        drawNote(2, 2446, 2, 141);
        drawNote(1, 2433, 2, 140);
        drawNote(1, 2420, 2, 139);
        drawNote(0, 2408, 2, 138);
        drawNote(2, 2395, 2, 137);
        drawNote(1, 2382, 2, 136);
        drawNote(2, 2371, 2, 135);
        drawNote(1, 2358, 2, 134);
        drawNote(2, 2345, 2, 133);
        drawNote(1, 2332, 2, 132);
        drawNote(1, 2320, 2, 131);
        drawNote(0, 2306, 2, 130);
        drawNote(2, 2294, 2, 129);
        drawNote(1, 2282, 2, 128);
        drawNote(2, 2269, 2, 127);
        drawNote(1, 2257, 2, 126);
        drawNote(2, 2243, 2, 125);
        drawNote(1, 2231, 2, 124);
        drawNote(1, 2219, 2, 123);
        drawNote(1, 2205, 2, 122);
        drawNote(0, 2193, 2, 121);
        drawNote(1, 2179, 2, 120);
        drawNote(2, 2166, 2, 119);
        drawNote(1, 2153, 2, 118);
        drawNote(2, 2139, 2, 117);
        drawNote(1, 2126, 2, 116);
        drawNote(1, 2113, 2, 115);
        drawNote(1, 2099, 2, 114);
        drawNote(2, 2085, 2, 113);
        drawNote(1, 2071, 2, 112);
        drawNote(0, 2059, 2, 111);
        drawNote(1, 2046, 2, 110);
        drawNote(0, 2032, 2, 109);
        drawNote(1, 2019, 2, 108);
        drawNote(1, 1991, 2, 107);
        drawNote(2, 1978, 2, 106);
        drawNote(1, 1964, 2, 105);
        drawNote(0, 1951, 2, 104);
        drawNote(1, 1938, 2, 103);
        drawNote(0, 1924, 2, 102);
        drawNote(1, 1912, 2, 101);
        drawNote(2, 1883, 2, 100);
        drawNote(0, 1869, 2, 99);
        drawNote(1, 1856, 2, 98);
        drawNote(0, 1843, 2, 97);
        drawNote(1, 1830, 2, 96);
        drawNote(2, 1817, 2, 95);
        drawNote(1, 1806, 2, 94);
        drawNote(0, 1777, 2, 93);
        drawNote(2, 1764, 2, 92);
        drawNote(1, 1749, 2, 91);
        drawNote(2, 1735, 2, 90);
        drawNote(1, 1722, 2, 89);
        drawNote(2, 1709, 2, 88);
        drawNote(1, 1698, 2, 87);
        drawNote(0, 1671, 2, 86);
        drawNote(1, 1659, 2, 85);
        drawNote(2, 1644, 2, 84);
        drawNote(1, 1631, 2, 83);
        drawNote(2, 1618, 2, 82);
        drawNote(1, 1605, 2, 81);
        drawNote(0, 1592, 2, 80);
        drawNote(0, 1539, 2, 79);
        drawNote(1, 1521, 2, 78);
        drawNote(2, 1500, 2, 77);
        drawNote(1, 1494, 2, 76);
        drawNote(2, 1479, 2, 75);
        drawNote(1, 1473, 2, 74);
        drawNote(2, 1459, 2, 73);
        drawNote(1, 1453, 2, 72);
        drawNote(1, 1345, 2, 71);
        drawNote(2, 1330, 2, 70);
        drawNote(1, 1325, 2, 69);
        drawNote(0, 1311, 2, 68);
        drawNote(1, 1253, 2, 67);
        drawNote(1, 1238, 2, 66);
        drawNote(2, 1226, 2, 65);
        drawNote(1, 1218, 2, 64);
        drawNote(0, 1204, 2, 63);
        drawNote(1, 1146, 2, 62);
        drawNote(0, 1133, 2, 61);
        drawNote(1, 1117, 2, 60);
        drawNote(0, 1109, 2, 59);
        drawNote(0, 1095, 2, 58);
        drawNote(1, 1064, 2, 57);
        drawNote(2, 1053, 2, 56);
        drawNote(1, 1046, 2, 55);
        drawNote(2, 1027, 2, 54);
        drawNote(1, 1019, 2, 53);
        drawNote(0, 1008, 2, 52);
        drawNote(0, 999, 2, 51);
        drawNote(1, 932, 2, 50);
        drawNote(0, 916, 2, 49);
        drawNote(1, 902, 2, 48);
        drawNote(1, 894, 2, 47);
        drawNote(2, 881, 2, 46);
        drawNote(1, 868, 2, 45);
        drawNote(0, 810, 2, 44);
        drawNote(1, 800, 2, 43);
        drawNote(1, 791, 2, 42);
        drawNote(2, 782, 2, 41);
        drawNote(1, 772, 2, 40);
        drawNote(1, 703, 2, 39);
        drawNote(0, 694, 2, 38);
        drawNote(1, 684, 2, 37);
        drawNote(2, 677, 2, 36);
        drawNote(1, 664, 2, 35);
        drawNote(1, 637, 2, 34);
        drawNote(2, 631, 2, 33);
        drawNote(1, 617, 2, 32);
        drawNote(0, 599, 2, 31);
        drawNote(2, 489, 2, 30);
        drawNote(1, 483, 2, 29);
        drawNote(2, 468, 2, 28);
        drawNote(1, 461, 2, 27);
        drawNote(1, 435, 2, 26);
        drawNote(0, 424, 2, 25);
        drawNote(1, 416, 2, 24);
        drawNote(2, 406, 2, 23);
        drawNote(1, 397, 2, 22);
        drawNote(0, 388, 2, 21);
        drawNote(1, 378, 2, 20);
        drawNote(2, 367, 2, 19);
        drawNote(1, 358, 2, 18);
        drawNote(0, 344, 2, 17);
        drawNote(2, 270, 2, 16);
        drawNote(1, 250, 2, 15);
        drawNote(0, 237, 2, 14);
        drawNote(0, 223, 2, 13);
        drawNote(1, 201, 2, 12);
        drawNote(0, 197, 2, 11);
        drawNote(0, 184, 2, 10);
        drawNote(1, 176, 2, 9);
        drawNote(2, 162, 2, 8);
        drawNote(1, 149, 2, 7);
        drawNote(0, 142, 2, 6);
        drawNote(2, 57, 2, 5);
        drawNote(1, 42, 2, 4);
        drawNote(0, 35, 2, 3);
        drawNote(2, 19, 2, 2);
        drawNote(1, 12, 2, 1);
        drawNote(0, 5, 2, 0);
        
    }
    
    void level3() {
        playSong(sweden, 1, 0, 73 * fr);
        drawNote(1, 3469, 2, 88);
        drawNote(0, 3443, 2, 87);
        drawNote(1, 3417, 2, 86);
        drawNote(0, 3392, 2, 85);
        drawNote(1, 3303, 2, 84);
        drawNote(0, 3274, 2, 83);
        drawNote(1, 3189, 2, 82);
        drawNote(0, 3161, 2, 81);
        drawNote(0, 3076, 2, 80);
        drawNote(1, 3063, 2, 79);
        drawNote(2, 3049, 2, 78);
        drawNote(0, 2963, 2, 77);
        drawNote(1, 2950, 2, 76);
        drawNote(2, 2935, 2, 75);
        drawNote(2, 2877, 2, 74);
        drawNote(1, 2850, 2, 73);
        drawNote(0, 2822, 2, 72);
        drawNote(2, 2765, 2, 71);
        drawNote(1, 2736, 2, 70);
        drawNote(0, 2708, 2, 69);
        drawNote(1, 2679, 2, 68);
        drawNote(2, 2665, 2, 67);
        drawNote(1, 2652, 2, 66);
        drawNote(0, 2637, 2, 65);
        drawNote(0, 2595, 2, 64);
        drawNote(1, 2580, 2, 63);
        drawNote(2, 2566, 2, 62);
        drawNote(1, 2538, 2, 61);
        drawNote(1, 2511, 2, 60);
        drawNote(0, 2483, 2, 59);
        drawNote(1, 2469, 2, 58);
        drawNote(2, 2456, 2, 57);
        drawNote(0, 2423, 2, 56);
        drawNote(0, 2395, 2, 55);
        drawNote(1, 2367, 2, 54);
        drawNote(2, 2339, 2, 53);
        drawNote(2, 2311, 2, 52);
        drawNote(1, 2284, 2, 51);
        drawNote(0, 2257, 2, 50);
        drawNote(0, 2171, 2, 49);
        drawNote(1, 2142, 2, 48);
        drawNote(2, 2114, 2, 47);
        drawNote(0, 2057, 2, 46);
        drawNote(1, 2029, 2, 45);
        drawNote(2, 2001, 2, 44);
        drawNote(2, 1942, 2, 43);
        drawNote(2, 1914, 2, 42);
        drawNote(1, 1884, 2, 41);
        drawNote(1, 1857, 2, 40);
        drawNote(0, 1830, 2, 39);
        drawNote(0, 1802, 2, 38);
        drawNote(0, 1686, 2, 37);
        drawNote(1, 1657, 2, 36);
        drawNote(1, 1632, 2, 35);
        drawNote(2, 1603, 2, 34);
        drawNote(2, 1575, 2, 33);
        drawNote(0, 1509, 2, 32);
        drawNote(0, 1479, 2, 31);
        drawNote(0, 1448, 2, 30);
        drawNote(1, 1416, 2, 29);
        drawNote(1, 1389, 2, 28);
        drawNote(2, 1363, 2, 27);
        drawNote(2, 1334, 2, 26);
        drawNote(0, 1214, 2, 25);
        drawNote(2, 1183, 2, 24);
        drawNote(2, 1152, 2, 23);
        drawNote(2, 1124, 2, 22);
        drawNote(2, 1092, 2, 21);
        drawNote(1, 1059, 2, 20);
        drawNote(1, 1028, 2, 19);
        drawNote(1, 998, 2, 18);
        drawNote(1, 968, 2, 17);
        drawNote(0, 940, 2, 16);
        drawNote(0, 910, 2, 15);
        drawNote(0, 882, 2, 14);
        drawNote(0, 854, 2, 13);
        drawNote(0, 729, 2, 12);
        drawNote(2, 697, 2, 11);
        drawNote(2, 667, 2, 10);
        drawNote(2, 637, 2, 9);
        drawNote(2, 608, 2, 8);
        drawNote(1, 577, 2, 7);
        drawNote(1, 547, 2, 6);
        drawNote(1, 518, 2, 5);
        drawNote(1, 486, 2, 4);
        drawNote(0, 458, 2, 3);
        drawNote(0, 426, 2, 2);
        drawNote(0, 397, 2, 1);
        drawNote(0, 367, 2, 0);
        
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
                notes[notePos] = new Note(resizeX(x), resizeY(270), resizeX(150), rml, "");
                noteCount++;
            }
            if (priority[notePos]) {
                notes[notePos].setText("X");
                scoreNotation(notes[notePos], rml, notePos);
                //if (notes[notePos].getPosY() >=  resizeY(830))
                //  System.out.println(frameCount);
            }
            notes[notePos].setPosY(resizeY(270) + (frameCount - spawnFrame) * speed);
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
                for (int i = noteCount - 1; i >= 0; i--) {
                    System.out.println(sheet[i]);
                }
                if (levelNumber ==  0 && score > 15400 && !cheer.isPlaying())
                    cheer.play();
                if (levelNumber ==  0 && score <= 15400 && !clap.isPlaying())
                    clap.play();
                if (levelNumber ==  1 && score > 27000 && !cheer.isPlaying())
                    cheer.play();
                if (levelNumber ==  1 && score <= 27000 && !clap.isPlaying())
                    clap.play();
                if (levelNumber ==  2 && score > 12000 && !cheer.isPlaying())
                    cheer.play();
                if (levelNumber ==  2 && score <= 12000 && !clap.isPlaying())
                    clap.play();
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
        } else if (keys[keyPos] && note.getPosY() >= resizeY(800) && note.getPosY() <= resizeY(840)) {
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
