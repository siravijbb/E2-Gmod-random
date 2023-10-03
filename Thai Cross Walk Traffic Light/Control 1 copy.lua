@name Count down
@inputs CrossTimmers Roadtimer Timmerstart Reset ForceRed ExitRed
@outputs CrossCountdowntime RoadCountDown State ResetRoad ResetCross Active Debut CrossLimit RoadLimit

CrossCountdowntime = CrossTimmers - CrossLimit
RoadCountDown = Roadtimer - RoadLimit

if(Reset == 1){
    CrossLimit = 0
    RoadLimit = 0
    State = 0
    Debut = 1
    }

if(Timmerstart == 1 && Debut != 6.6 ){
Active = 1
CrossLimit = 13
RoadLimit = 10
ResetCross = 0
ResetRoad = 0

if(State == 0 || State == 4){
State = 1
Debut = 1}

}
if(Roadtimer >= 1 || 4 > State > 0){
    Active = 1
}
elseif(Active != 0){
CrossLimit = 0
RoadLimit = 0
State = 0
}


if((Roadtimer >= (RoadLimit - 0.2) && State == 1) || Debut == 3){
    Debut = 3
    RoadLimit = 3
    State = 2
}
if((CrossTimmers >= (CrossLimit - 0.2) && State == 2) || Debut == 4 ){
    Debut = 4
    CrossLimit = 0
    CrossLimit = 10
    RoadLimit = 0
    RoadLimit = 16
    State = 3
}

if((Roadtimer >= (RoadLimit - 3.2) && State == 3 && Debut != 5.5) || Debut == 5 ){
    Debut = 5
    CrossLimit = 0
    CrossLimit = 3
    State = 3.5
    
}
if((Roadtimer >= (RoadLimit - 0.2) && State == 3.5 && Debut != 5.5 ) || Debut == 6 ){
    Debut = 6
    Active = 0
    State = 4
    
}
if(State == 4){
    CrossLimit = 0
    RoadLimit = 0
    State = 0
}

if(ForceRed == 1 && Roadtimer <= 2 && Debut != 6.6 || Debut == 5.5){
        Active = 1
        Debut = 5.5
        RoadLimit = 3
        State = 2.25
    if((Roadtimer >= RoadLimit - 0.2) || Debut == 6.6 ){
        Debut = 6.6
        State = 3.25
        RoadLimit = 0
       
    }
    
}
 if((ExitRed == 1  )|| Debut == 7 ){
        Debut = 7    
        CrossLimit = 3
            if(CrossTimmers >= (CrossLimit - 0.2) || Debut == 7.5){
                Debut = 7.5
                State = 0
                CrossLimit = 0
                Debut = 1
            }
        }
