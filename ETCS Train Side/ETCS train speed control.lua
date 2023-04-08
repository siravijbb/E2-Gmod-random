@name ETCS train speed control
@inputs  SpeedIn SpeedSelect SpeedKMH
@outputs Nextspeed Nowspeed


if(SpeedSelect == 1){
    Nowspeed = SpeedIn
}

elseif(SpeedSelect == 2){
    Nextspeed = SpeedIn
}
elseif(SpeedSelect == 0){
    SpeedIn = 0
}
if($Nextspeed || $Nowspeed){
    TextLatch2A = 1
    TextLatch2B = 1
}
if(Nowspeed > Nextspeed && SpeedSelect == 3){

    if(TextLatch2A == 1){
    print("2A REDUCE SPEED")
    TextLatch2A = 0}                        
    }
if(Nextspeed > Nowspeed && SpeedSelect == 3){

    if(TextLatch2B == 1){
    print("2B SPEED CHANGED")
    TextLatch2B = 0}
    }
