@name Road-Traffic Light Count down
@inputs Centraltimer  Button  ResetAll RedHold ForceRedButton Exitred
@outputs Centraltimerenable ResetCentraltimer RoadCountDown CrossCountdown State Reset Centraltimerreset ForceRed


GbeforeYellow = 13
YellowCar = 3 + GbeforeYellow
GreenCross = 10 + YellowCar
HoldRed = 3 + GreenCross

ForceYellowCar = 3
ForceStopCross = ForceYellowCar + 5

State = 1



if(ResetAll){
Centraltimerreset = 1
State = 1
Centraltimer = 0
Centraltimerenable = 0
CrossCountdown = 0
RoadCountDown = 0
ForceRed = 0

}
else {
    Centraltimerreset = 0
}
if(Button > 0 && ForceRed == 0){
    Centraltimerenable = 1
    ForceRed = 0


}
if(ResetAll > 0){
    Centraltimerreset 1
    State = 1
}

if(Centraltimer < GbeforeYellow && ForceRed == 0 && Centraltimerenable > 0){
    State = 1
    RoadCountDown = GbeforeYellow - Centraltimer
    CrossCountdown =  YellowCar - Centraltimer
}
if(GbeforeYellow < Centraltimer && Centraltimer < YellowCar && ForceRed == 0){
    State = 2
    RoadCountDown = YellowCar - Centraltimer
    CrossCountdown = YellowCar - Centraltimer
}
if(YellowCar <= Centraltimer && Centraltimer < GreenCross && ForceRed == 0){
    State = 3
    RoadCountDown = HoldRed - Centraltimer
    CrossCountdown = GreenCross - Centraltimer

}
if(GreenCross <= Centraltimer && Centraltimer < HoldRed && ForceRed == 0){
    State = 3.5
    RoadCountDown = HoldRed - Centraltimer
    CrossCountdown = 0
}
if(HoldRed < Centraltimer  && ForceRed == 0){
    State = 1
    CrossCountdown = 0
    Centraltimerenable = 0
    Centraltimerreset = 1
    
}

if(ForceRedButton > 0){
    ForceRed = 1
    Centraltimerenable = 1
    Centraltimerreset = 1


}
if(0 < Centraltimer && Centraltimer < ForceYellowCar && ForceRed == 1){
    RoadCountDown = ForceYellowCar  - Centraltimer

}
if(Centraltimer > ForceYellowCar  && ForceRed == 1){
    Centraltimerenable = 0
    RoadCountDown = 0
    State = 3


}

if(Exitred > 0){
    ForceRed = -1
    Centraltimerenable = 1
    State = 3
    CrossCountdown = ForceStopCross  - Centraltimer


    
}
if(ForceYellowCar  <= Centraltimer && Centraltimer < ForceStopCross && ForceRed == -1){
    Centraltimerenable = 1
    CrossCountdown = ForceStopCross  - Centraltimer
        State = 3


}
if(Centraltimer > ForceStopCross  && ForceRed == -1){
    Centraltimerenable = 0
    RoadCountDown = 0
    State = 1
    Centraltimerreset = 1
    ForceRed = 0

}
