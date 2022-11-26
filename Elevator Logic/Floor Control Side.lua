@name Elevator Logic (Floor Reciver + Counter)
@inputs Floor 1n 2n 3n 4n Recv islowwerfl isUpperFl Near _destinationFloor
@outputs UP DOWN NEXT 1o 2o 3o 4o DEFA

    1o = 1n; 2o =2n; 3o = 3n; 4o = 4n;

if(destinationFloor > _currentFloor){
    UP = 1;
    Speed = 255;
    if(Near $= 1 && _currentFloor == destinationFloor){
        Speed = 100;
        if(Near $= 1 && _currentFloor == destinationFloor && stop == 1){
            Speed = 0;
        }
    }


}
else if(destinationFloor < _currentFloor){
    DOWN = 1;
    Speed = 255;
    if(Near $= 1 && _currentFloor == destinationFloor){
        Speed = 100;
        if(Near $= 1 && _currentFloor == destinationFloor && stop $= 1){
            Speed = 0;
        }
    }
}