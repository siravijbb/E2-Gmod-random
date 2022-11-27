@name Count down
@inputs CrossTimmers Roadtimer Timmerstart Active CrossLimit RoadLimit
@outputs CrossCountdowntime RoadCountDown State ResetRoad ResetCross

CrossCountdowntime = CrossTimmers - CrossLimit
RoadCountDown = Roadtimer - RoadLimit

State = 1

if(Timmerstart == 1){
Active = 1
CrossLimit = 13
RoadLimit = 10
}
if(RoadCountDown <= 0 && State = 1){
    
    ResetRoad = 1
    ResetRoad = 0
    RoadLimit = 3
    State = 2
}
if(CrossCountdowntime <= 0 && State = 2){
    
    ResetCross = 1
    RedCross = 0
    CrossLimit = 10
    State = 3
}
if(RoadCountDown <= 0 && State = 3){
    ResetRoad = 1
    Active = 0
    RoadLimit = 3
    State = 1
}
