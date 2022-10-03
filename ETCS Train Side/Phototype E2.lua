@name ETCS train side
@inputs Nowspeed Nextspeed W S A D Space Deadman SpeedKMH Active
@outputs Brake Emerbrake Speed LimitSpeed Buzzer BuzzerEmer Sector ReadM Nextlimit EmerbrakeCounter Forward Reverse
Deadtime = 5000
Sector = 1
ReadM = 1
Buzzer = 0
Recev = Nowspeed
Speed = SpeedKMH
LimitSpeed = Recev
Nextlimit = Nextspeed
Forward = W * 500
Reverse = S * 500


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
if(EmerbrakeCounter == 1){
    Emerbrake = 100
    Buzzer = 100
    EmerbrakeCounter = 1
    print("Emergency Brake has been Apply.")
}
if(LimitSpeed <= SpeedKMH && LimitSpeed+10 >= SpeedKMH){
    Brake = 100

}
elseif(LimitSpeed <= SpeedKMH && LimitSpeed+10 <= SpeedKMH){
    Emerbrake = 100
    Brake = 100
    BuzzerEmer = 100
    EmerbrakeCounter = 1
    
}
if(LimitSpeed >= SpeedKMH && LimitSpeed+10 >= SpeedKMH && EmerbrakeCounter == 0 && Active == 1){
    Emerbrake = 0
    Brake = 0
    BuzzerEmer = 0
}
if(EmerbrakeCounter == 1 && SpeedKMH <= 1 && Active == 1 || Space >= 1){
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
if(Nextlimit <= Nowspeed && SpeedKMH >= Nextlimit && SpeedKMH <= Nextlimit+10 && Active == 1 ){
    Brake = 100
}
elseif(Nextlimit <= Nowspeed && SpeedKMH >= Nextlimit && SpeedKMH >= Nextlimit+10 && Active == 1 ){
    Emerbrake = 100
    BuzzerEmer = 100
}
