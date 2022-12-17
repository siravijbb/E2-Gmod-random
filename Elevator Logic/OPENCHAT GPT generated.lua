@inputs Floor1 Floor2 Floor3 Floor4 Floor5 Floor6 currentFloor continueTrigger
@outputs motorUp motorDown

const Floor1 = 1
const Floor2 = 2
const Floor3 = 3
const Floor4 = 4
const Floor5 = 5
const Floor6 = 6

var queue = []
var stopped = false

func handleButtonPress(floorNumber)
{
  queue.push(floorNumber)
  moveToNextFloorInQueue()
}

func moveToNextFloorInQueue()
{
  if(queue.length > 0 && !stopped)
  {
    // Find the next floor in the queue that is in the same direction as the current movement of the elevator
    var nextFloor = queue[0]
    for(i = 1; i < queue.length; i++)
    {
      if((currentFloor < nextFloor && queue[i] > currentFloor && queue[i] < nextFloor) ||
         (currentFloor > nextFloor && queue[i] < currentFloor && queue[i] > nextFloor))
      {
        nextFloor = queue[i]
      }
    }

    if(nextFloor > currentFloor)
    {
      // The elevator should go up to reach the next floor in the queue
      // Set the motorUp output to activate the motor that moves the elevator up
      motorUp = 1
      motorDown = 0
    }
    else if(nextFloor < currentFloor)
    {
      // The elevator should go down to reach the next floor in the queue
      // Set the motorDown output to activate the motor that moves the elevator down
      motorUp = 0
      motorDown = 1
    }

    // Remove the next floor from the queue and update the current floor
    queue.splice(queue.indexOf(nextFloor), 1)
    currentFloor = nextFloor
  }
  else
  {
    // The queue is empty or the elevator is stopped, so deactivate the motors
    motorUp = 0
    motorDown = 0
  }
}

func stopAtFloor(floorNumber)
{
  if(currentFloor == floorNumber)
  {
    // The elevator is at the specified floor, so stop it
    stopped = true
    motorUp = 0
    motorDown = 0
  }
}

func continueFromFloor(floorNumber)
{
  if(currentFloor == floorNumber && continueTrigger > 0)
  {
    // The elevator is at the specified floor and the continueTrigger input is active, so continue its movement
    stopped = false
    moveToNextFloorInQueue()
  }
}
