@name Thai-Crossing Sign
@inputs Triger Time
@outputs Car_timmer Cross_timer timmer_start cDown redCar redCross yellowCar yellowCross greenCar greenCross 

NormalTime = 10000
mutiPly = 1
cDown = 10
cU = 10

if(Triger == 1){
    active = 1
}
if(active == 1){
    timmer_start = 1
    timer("Cross time",NormalTime)
    timer("Auto",1000)
}
if(clk("Auto") && cDown >= -4){
    cDown -= 1
    cU -= 1
    timer("Auto",1000)
}
if(cDown >= 0){
    redCar == 0
    redCross = 255
    greenCar = 255
}
if(cU == 0){
    cU = 3
}
elseif(cDown <= 0 >= -3){
    yellowCar == 255
    redCar == 0
}
if(cDown <= -3){
    
}
 