@name ETCS Track Side
@inputs  Nowspeedin Nextspeedin SectionSelect InNextOveride NextspeedNextSign NextsecondspeedNextSign AxelCounter CrossingGate
@outputs Nowspeed Nextspeed ETCSOutspeed

ETCSOutspeed = Nowspeedin 
SectionNumber = 1 #Change as section


if(SectionSelect == SectionNumber){
    NextOveride = InNextOveride
    Nowspeed = Nowspeedin
    OldNowspeed = Nowspeedin
    if(NextOveride == 1){  ##if next input sign is overide
        Nextspeed = Nextspeedin ##overide next sign speed
    }}
else{
        if($AxelCounter || (NextspeedNextSign == 0 && NextOveride == 0 && NextsecondspeedNextSign != 0)){ ##if axel counter is on or next sign is 0 and next second sign is not 0
        Nowspeed = 0
        }
        elseif(NextsecondspeedNextSign == 0 && NextOveride == 0){ ##if next second sign is 0
        OldNowspeed = Nowspeed
        Nowspeed = 30}
        elseif(NextspeedNextSign == 30 && NextOveride == 0 ){ ##if next  sign is not 0
        Nowspeed = OldNowspeed}  
        Nextspeed = NextspeedNextSign
    } 

############################### Light

if(20 >= ETCSOutspeed && ETCSOutspeed != 0 ){
    Red = 255
    Yellow = 255
    Green = 0

}
elseif(40 > ETCSOutspeed && ETCSOutspeed >=    20){
    Red = 0
    Yellow = 255
    Green = 0

}
elseif(60 > ETCSOutspeed && ETCSOutspeed >= 40){
    Red = 0
    Yellow = 255
    Green = 255

}
elseif(60 <= ETCSOutspeed ){
    Red = 0
    Yellow = 0
    Green = 255

}
else{    
    Red = 255
    Yellow = 0
    Green = 0
  }

if(CrossingGate == 1){
    timer("Blink",2000)
    if(clk("Blink")){
        stoptimer("Blink")
        CrossBlink = 1
        timer("BlinkClose",2000)
    }
    if(clk("BlinkClose")){
        stoptimer("BlinkClose")
        CrossBlink = 0
    }
}
else{
    stoptimer("Blink")
    stoptimer("BlinkClose")
    CrossBlink = 0
}
if(CrossBlink == 1){
    Blink = 255
    }
else{
    Blink = 0
    }

