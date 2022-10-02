@name ETCS train side
@inputs Recev W S A D Space Deadman SpeedKMH Active
@outputs Brake Emerbrake Speed LimitSpeed Buzzer BuzzerEmer Sector ReadM
Deadtime = 5000
Sector = 1
ReadM = 1
Buzzer = 0


LimitSpeed = Recev
Speed = SpeedKMH
if(Active <= 1){
    timer("Deadman",Deadtime)
}
if(Space <= 1 || Deadman <= 1){
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
}
if(LimitSpeed <= SpeedKMH && LimitSpeed+10 >= SpeedKMH){
    Brake = 100

}
elseif(LimitSpeed <= SpeedKMH && LimitSpeed+10 <= SpeedKMH){
    Emerbrake = 100
    Brake = 100
    BuzzerEmer = 100
}
if(LimitSpeed >= SpeedKMH && LimitSpeed+10 >= SpeedKMH){
    Emerbrake = 0
    Brake = 0
    BuzzerEmer = 0
}
