@name ETCS train speed control
@inputs  Nowspeedin Nextspeedin 
@outputs Nextspeed Nowspeed Buzzer

Nowspeed = 1
Nextlimit =1
LimitSpeed =1
Buzzer = 0

if(Nowspeedin > Nextspeed){
    Nowspeed = Nowspeedin
    Nextspeed = Nextspeedin
    print("2A REDUCE SPEED")}
if(Nextspeedin > Nowspeed){
    Nowspeed = Nextspeedin
    Nextspeed = Nextspeedin
    print("2B SPEED CHANGED")}
