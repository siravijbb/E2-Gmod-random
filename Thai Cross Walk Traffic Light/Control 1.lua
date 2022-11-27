@name Thai-Crossing Sign
@inputs Triger State
@outputs Cartimmer Crosstimer Timmerstart CDown RedCar RedCross YellowCross GreenCar GreenCross State

if(Triger == 1){
    Active = 1
}
if(Active == 1){
    Timmerstart = 1
}
if(State == 1){
    RedCar = 0
    RedCross = 255
    YellowCross = 0
    GreenCar = 255
    GreenCross = 0
}
elseif(State == 2){
    RedCar = 0
    RedCross = 255
    YellowCross = 255
    GreenCar = 0
    GreenCross = 0
}
elseif(State == 3){
    RedCar = 255
    RedCross = 0
    YellowCross = 0
    GreenCar = 0
    GreenCross = 255
}