@name ETCS Cross Light
@inputs ETCSOutspeed
@outputs Blink Red Green Yellow ETCSOutspeed

if(20 >= ETCSOutspeed && ETCSOutspeed != 0 ){
    Red = 255
    Yellow = 255
    Green = 0
    Blinkcounter = 0
}
elseif(40 >= ETCSOutspeed >    20){
    Red = 0
    Yellow = 255
    Green = 0
    Blinkcounter = 0
}
elseif(40 <= ETCSOutspeed >= 60){
    Red = 0
    Yellow = 255
    Green = 255
    Blinkcounter = 1
}
elseif(60 <= ETCSOutspeed ){
    Red = 0
    Yellow = 0
    Green = 255
    Blinkcounter = 1
}
else{    
    Red = 255
    Yellow = 0
    Green = 0
    Blinkcounter = 0}

if(Blinkcounter == 1){
    timer("Blink",2000)    
    for(Blinkcounter = 0,Blinkcounter){
    if(clk("Blink")){
        Blink = 255
    }
}}
else{
    stopAllTimers()
    Blink = 0

}
