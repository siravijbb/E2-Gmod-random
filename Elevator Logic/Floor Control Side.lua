@name Elevator Logic (Floor Reciver + Counter)
@inputs Floor 1n 2n 3n 4n Recv islowwerfl isUpperFl
@outputs UP DOWN NEXT 1o 2o 3o 4o DEFA

    1o = 1n; 2o =2n; 3o = 3n; 4o = 4n;


if(1n <= 1 || 2n <= 1 || 3n <= 1 || 4n <= 1){
else if(1n <= 1 && isupperfl == 1) {
    UP = 1;
    
}
            else if(4n <= 1 && islowwerfl == 1 && QNEXTUP != 1){
    DOWN();
}
                    else if(3n <= 1 && islowwerfl == 1 && QNEXTUP != 1){
    DOWN();
}
                        else if(2n <= 1 && islowwerfl == 1 && QNEXTUP != 1){
    DOWN();
}
                            else if(1n <= 1 && islowwerfl == 1 && QNEXTUP != 1){
    DOWN();
}

if(2n <= 1 && isUpperFl == 1 && RECV < 2 ){
    UP();
}

    
