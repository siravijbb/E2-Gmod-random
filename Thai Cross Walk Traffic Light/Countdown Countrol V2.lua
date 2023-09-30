@name Thai-Crossing Sign
@inputs Triger State
@outputs Cartimmer Crosstimer Timmerstart CDown RedCar RedCross YellowCar GreenCar GreenCross


if(State == 1 || State == 1.5 || State == 0){
    RedCar = 0
    RedCross = 255
    YellowCar = 0
    GreenCar = 255
    GreenCross = 0
}
elseif(State == 2 || State == 2.5 || State == 3.75){
    RedCar = 0
    RedCross = 255
    YellowCar = 255
    GreenCar = 0
    GreenCross = 0
}
elseif(State == 3 || State == 3.5 || State == 4.75){
    RedCar = 255
    RedCross = 0
    YellowCar = 0
    GreenCar = 0
    GreenCross = 255
}
elseif(State == 4 || State == 4.5){
    RedCar = 255
    RedCross = 255
    YellowCar = 0
    GreenCar = 0
    GreenCross = 0}