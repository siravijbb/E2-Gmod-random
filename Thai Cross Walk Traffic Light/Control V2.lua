@name Road-Traffic Light Count down
@inputs Centraltimer  button  ResetAll RedHold ForceRed Exitred
@outputs Centraltimerenable ResetCentraltimer RoadCountDown CrossCountdown State Reset Centraltimerreset

        RoadCountDown = Centraltimer - Roadwait
        CrossCountdown = Centraltimer - Crosswait
if (ResetAll == 0){

if((button >= 1 || buttonlock >= 1) && State == 0){
    buttonlock = 1
    Centraltimerreset = 1
    Centraltimerreset = 0
    Roadwait = 15
    Crosswait = Roadwait + 4
    State = 1
    }

if(State == 1 || State == 1.5){
        State = 1.5 /// road green
        Centraltimerenable = 1
        if(RoadCountDown <= 0.5 && State == 1.5){
            Roadwait = Roadwait + 4
            State = 2
        }
    }



if(State == 2 || State == 2.5){
    State = 2.5 /// yellow
    if(RoadCountDown <= 0.5 && State == 2.5){
        State = 3
    }
}

if(State == 3 || State == 3.5){
    State = 3.5 //// road red // cross green
    Roadwait = Roadwait + 14
    Crosswait = Crosswait + 10
    if(RoadCountDown <= 0.5 && State == 3.5){
        State = 4
    }
}

if(State == 4 || State == 4.5){
    State = 4.5 /// red red
    CrossCountdown = 0
    if(RoadCountDown <= 0.5 && State == 4.5){
        State = 5
    }
}

if(State == 5 || State == 5.5){
    State = 5.5 /// hold
    Centraltimerenable = 0
    if(RedHold == 0 && State == 5.5){
    Centraltimerreset = 1
    Centraltimerreset = 0
    State = 0
    }
}
    if(ForceRed == 1 || ForceredLock == 1){
        ForceredLock = 1
        Centraltimerreset = 1
        Centraltimerreset = 0
        Roadwait = 0
        Roadwait = 4
        Centraltimerenable = 1
        if(RoadCountDown <= 0.5 || State == 3.75){
            State = 3.75
            Roadwait = Roadwait + 4
        }
        if(CrossCountdown <= 0.5 || State == 4.75){
            State = 4.75
            Roadwait = 0
            Centraltimerenable = 0
            Centraltimerreset = 1
            Centraltimerreset = 0
            ForceredLock = 0
        }
    }
    if(Exitred == 1 || ExitredLock == 1){
        ExitredLock = 1
        Centraltimerreset = 1
        Centraltimerreset = 0
        Crosswait = 4
        Roadwait = 6
        Centraltimerenable = 1
        if(CrossCountdown <= 0.5 && ExitredLock == 1){
            CrossCountdown = 0
        }
        if(RoadCountDown <= 0.5 && ExitredLock == 1){
            Centraltimerenable = 0
                    Centraltimerreset = 1
        Centraltimerreset = 0
            State = 0
            ExitredLock = 0
        }
    }



} else {
    Centraltimerreset = 1
    Centraltimerreset = 0
    Roadwait = 0
    Crosswait = 0
    State = 0
}


