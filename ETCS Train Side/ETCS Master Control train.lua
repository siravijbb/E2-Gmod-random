@name ETCS train side
@inputs  Nowspeed Nextspeed W S A D Space Deadman SpeedKMH Active
@outputs Brake Emerbrake Speed LimitSpeed Buzzer BuzzerEmer Sector ReadM Nextlimit EmerbrakeCounter Forward Reverse WriteNow WriteNext ReadNow ReadNext
Deadtime = 120000
Sector = 1
ReadM = 1
Buzzer = 0


Speed = SpeedKMH
LimitSpeed = Nowspeed
Nextlimit = Nextspeed
Forward = W * 500
Reverse = S * 500
ReadNext = 1
ReadNext =1


if(Active != 1){
    Emerapply = 100
    Brake = 100
    stopAllTimers()
}else{
    timer("Deadman",Deadtime)}


if(Space >= 1 || Deadman >= 1 || W>= 1 || S >= 1){
    stoptimer("Deadman")
    stoptimer("Emerapply")
    timer("Deadman",Deadtime)
    Buzzer = 0
}
if(clk("Deadman")){
    timer("Emerapply",Deadtime)
    Buzzer = 100
}
if(clk("Emerapply")){
    Emerbrake = 100
    Buzzer = 100
    EmerbrakeCounter = 1
}
if(EmerbrakeCounter == 1 && Active == 1){
    Emerbrake = 100
    Buzzer = 100
    EmerbrakeCounter = 1
    print("Emergency Brake has been Apply.")
}

########
if(Nextspeed == 0){
    speedLatch = 0

}    
else{
    speedLatch = 1
    latchSpeedTimer = 1
}
if(speedLatch == 1){
    SpeedKMH == speedCapture
}
if (speedLatch == 0 && latchSpeedTimer == 1){
    timer("reduceSpeed",10000)
    latchSpeedTimer = 0
}
if(clk(reduceSpeed) && ((SpeedKMH >= speedCapture) || (SpeedKMH >= 30))   ){
    stoptimer("reduceSpeed")
    print("Speed Brake has been Apply,Due to not stoping for RED")
    Brake = 100
}
######

if(LimitSpeed <= SpeedKMH && LimitSpeed+10 >= SpeedKMH){
    Brake = 100

}
elseif(LimitSpeed <= SpeedKMH && LimitSpeed+10 <= SpeedKMH){
    Emerbrake = 100
    Brake = 100
    BuzzerEmer = 100
    EmerbrakeCounter = 1
    
}
if(LimitSpeed >= SpeedKMH && LimitSpeed+10 >= SpeedKMH && EmerbrakeCounter == 0 && Active == 1 && Nextlimit >= SpeedKMH && Nextlimit+10 >= SpeedKMH){
    Emerbrake = 0
    Brake = 0
    BuzzerEmer = 0
}
if(EmerbrakeCounter == 1 && SpeedKMH <= 1 || Space >= 1){
    EmerbrakeCounter = 0
    Emerbrake = 0
    Brake = 0
    BuzzerEmer = 0
}
if(LimitSpeed == 0 && SpeedKMH >= 0){
    Emerbrake = 100
    Brake = 0
    BuzzerEmer = 100
}
if(LimitSpeed == 0 && SpeedKMH <= 3){
    Emerbrake = 100
    Brake = 0
    BuzzerEmer = 0
}
if(SpeedKMH <= 2){ 
    Brake = 100
}


