@name ETCS train side
@inputs  Nowspeedin Nextspeedin sectionSelect inNextOveride nextspeedNextSign
@outputs Nowspeed Nextspeed ETCSOutspeed

ETCSOutspeed = Nowspeed
sectionNumber = 1 #Change as section
nextOveride = inNextOveride
Nextspeed = nextspeedNextSign

if(sectionSelect == sectionNumber){
    Nowspeed = Nowspeedin
    if(nextOveride == 1){ 
        Nextspeed = Nextspeedin ##overide next sign speed
    }
    else{
        Nextspeed = nextspeedNextSign
    }
}
