@name ETCS Track Side
@inputs  Nowspeedin Nextspeedin SectionSelect InNextOveride NextspeedNextSign NextsecondspeedNextSign AxelCounter
@outputs Nowspeed Nextspeed ETCSOutspeed

ETCSOutspeed = Nowspeedin 
SectionNumber = 1 #Change as section


if(SectionSelect == SectionNumber){
    NextOveride = InNextOveride
    Nowspeed = Nowspeedin
    OldNowspeed = Nowspeedin
    if(NextOveride == 1){  ##if next input sign is overide
        Nextspeed = Nextspeedin ##overide next sign speed
    }}
else{
        if($AxelCounter || (NextspeedNextSign == 0 && NextOveride == 0)){
        Nowspeed = 0
        }
        elseif(NextsecondspeedNextSign == 0 && NextOveride == 0){ ##if next second sign is 0
        OldNowspeed = Nowspeed
        Nowspeed = 30}
        else{ ##if next  sign is not 0
        Nowspeed = OldNowspeed}  
        Nextspeed = NextspeedNextSign
    } 


