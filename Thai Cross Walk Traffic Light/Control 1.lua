@name Thai-Crossing Sign
@inputs Triger Time
@outputs Cartimmer Crosstimer Timmerstart CDown RedCar RedCross YellowCross GreenCar GreenCross 

NormalTime = 10000
MutiPly = 1
CDown = 10
CU = 10

if(Triger == 1){
    Active = 1
}
if(Active == 1){
    Timmerstart = 1
    timer("Cross time",NormalTime)
    timer("Auto",1000)
}
if(clk("Auto") && CDown >= -4){
    CDown -= 1
    CU -= 1
    timer("Auto",1000)
}
if(CDown >= 0){
    RedCar == 0
    RedCross = 255
    GreenCar = 255
}
if(CU == 0){
    CU = 3
}
elseif(CDown <= 0 >= -3){
    YellowCross = 255
    RedCar = 0
}
if(CDown <= -3){
    CU = 10
    RedCar = 255
    YellowCross = 0
    GreenCross = 255
}
if(CU >= 10 && CU >= 0 && GreenCross >= 200){
    timer("GC",1000)
}
if(clk"GC"){
    CU -= 1
}
if(CU <= 0 ){
    RedCross = 255
    GreenCar = 255
    active = 0
}
