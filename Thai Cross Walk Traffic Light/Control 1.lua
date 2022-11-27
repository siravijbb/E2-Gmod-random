@name Count down
@inputs CrossTimmers Roadtimer Timmerstart 
@outputs CrossCountdowntime RoadCountDown State ResetRoad ResetCross Active Debut CrossLimit RoadLimit

CrossCountdowntime = CrossTimmers - CrossLimit
RoadCountDown = Roadtimer - RoadLimit

if(Timmerstart == 1 ){
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


if((Roadtimer >= 9.8 && State == 1) || Debut == 3){
    Debut = 3
    RoadLimit = 3
    State = 2
}
if((CrossTimmers >= 12.8 && State == 2) || Debut == 4 ){
    Debut = 4
    CrossLimit = 1
    CrossLimit = 10
    RoadLimit = 1
    RoadLimit = 13
    State = 3
}
if((Roadtimer >= 12.8 && State == 3) || Debut == 5 ){
    Debut = 5
    Active = 0
    State = 4
    
}
if(State == 4){
    CrossLimit = 0
    RoadLimit = 0
    State = 0
}
