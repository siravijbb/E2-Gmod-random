@name ETCS train speed control
@inputs  Nowspeedin Nextspeedin 
@outputs Nextspeed Nowspeed

Nowspeed = 1
Nextlimit =1
LimitSpeed =1

if($Nowspeedin){
    Nowspeed = Nowspeedin
    Nextspeed = Nowspeedin
    print("A")}
if($Nextspeedin){
    Nowspeed = Nextspeedin
    Nextspeed = Nextspeedin
    print("B")}
