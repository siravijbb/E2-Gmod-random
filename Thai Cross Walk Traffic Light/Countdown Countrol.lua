@name Thai-Crossing Sign
@inputs Triger State
@outputs Cartimmer Crosstimer Timmerstart CDown RedCar RedCross YellowCross GreenCar GreenCross


if(State == 1 || State == 4 || State == 0){
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
elseif(State == 3.5){
    RedCar = 255
    RedCross = 255
    YellowCross = 0
    GreenCar = 0
    GreenCross = 0}