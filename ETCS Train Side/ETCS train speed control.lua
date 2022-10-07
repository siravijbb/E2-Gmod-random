@name ETCS train speed control
@inputs  Nowspeedin Nextspeedin 
@outputs Nextspeed Nowspeed Buzzer

Nowspeed = 1
Nextlimit =1
LimitSpeed =1
Buzzer = 0

if($Nowspeedin > Nextspeed){
    Nowspeed = Nowspeedin
    Nextspeed = Nowspeedin
    print("2A")}
if($Nextspeedin > Nowspeed){
    Nowspeed = Nextspeedin
    Nextspeed = Nextspeedin
    print("2B")}
########################################
if($Nowspeedin  < Nowspeed){
stopAllTimers()
Nextspeedin = Nowspeedin
timer("Nowspeedinnew",10000)
Buzzer = 100
print("1A")
}
if(clk("Nowspeedinnew")){
Nowspeed = Nowspeedin
Nextspeed = Nowspeedin
Buzzer = 0
print("A")}
if($Nextspeedin  < Nowspeed){
stopAllTimers()
Nowspeedin = Nextspeedin
timer("Nextspeedinnew",10000)
Buzzer = 100
print("1B")
}
if(clk("Nextspeedinnew")){
Nowspeed = Nowspeedin
Nextspeed = Nowspeedin
Buzzer = 0
print("B")}
