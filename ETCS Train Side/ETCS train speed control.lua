@name ETCS train speed control
@inputs  speedIn speedSelect SpeedKMH
@outputs Nextspeed Nowspeed

Nowspeed = 1
Nextlimit =1
LimitSpeed =1

if(speedSelect == 1){
    Nowspeedin == speedIn
}
elseif(speedSelect == 0){
    speedIn == 0
}
elseif(speedSelect == 2){
    Nextspeedin == speedIn
}


if(Nowspeedin > Nextspeed){
    Nowspeed = Nowspeedin
    Nextspeed = Nextspeedin
    print("2A REDUCE SPEED")}
if(Nextspeedin > Nowspeed){
    Nowspeed = Nextspeedin
    Nextspeed = Nextspeedin
    print("2B SPEED CHANGED")}
