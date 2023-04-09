@name ETCS train speed control
@inputs  SpeedIn SpeedSelect SpeedKMH
@outputs Nextspeed Nowspeed

Nowspeed = 1
Nextlimit =1
LimitSpeed =1

if(SpeedSelect == 1){
    Nowspeedin = SpeedIn
}

elseif(SpeedSelect == 2){
    Nextspeedin = SpeedIn
}
elseif(SpeedSelect == 0){
    SpeedIn = 0
}

if(Nowspeedin > Nextspeed){
    Nowspeed = Nowspeedin
    Nextspeed = Nextspeedin
    print("2A REDUCE SPEED")}
if(Nextspeedin > Nowspeed){
    Nowspeed = Nextspeedin
    Nextspeed = Nextspeedin
    print("2B SPEED CHANGED")}
