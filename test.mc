hum Function start {
    output<- "Program begins";
    input-> x;
    LoopKar ( x = 0 ; x < 5 ; x = x + 1 ) {
        Agar x == 3 {
            output<- "Found 3";
            BreakKar;
        } Wapas {
            output<- "Not yet";
        }
    }
    ReturnKar 0;
}

