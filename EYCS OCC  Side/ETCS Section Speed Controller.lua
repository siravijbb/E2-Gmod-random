@name ETCS Track Side
@inputs  Nowspeedin Nextspeedin SectionSelect InNextOveride NextspeedNextSign
@outputs Nowspeed Nextspeed ETCSOutspeed

ETCSOutspeed = Nowspeedin
SectionNumber = 1 #Change as section
NextOveride = InNextOveride
Nextspeed = NextspeedNextSign

if(SectionSelect == SectionNumber){
    Nowspeed = Nowspeedin
    if(NextOveride == 1){ 
        Nextspeed = Nextspeedin ##overide next sign speed
    }
    else{
        if(NextspeedNextSign == 0 && NextOveride == 0){
        OldNowspeed = Nowspeed
        Nowspeed = 30}
        else{
        Nowspeed = OldNowspeed}  
        Nextspeed = NextspeedNextSign
    }
}

