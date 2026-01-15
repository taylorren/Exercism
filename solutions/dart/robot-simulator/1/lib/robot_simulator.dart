import 'orientation.dart';
import 'position.dart';

class Robot {
  Orientation orientation;
  Position position;

  Robot(this.position, this.orientation);
  void move(String action) {
    for (String i in action.split('')) {
      if (i == 'R')
        _rotateR();
      else if (i == 'L')
        _rotateL();
      else if (i == 'A')
        _move();
      else
        continue;
    }
  }

  void _move() {
    switch (this.orientation) {
      case Orientation.east:
        this.position.x++;
        break;
      case Orientation.north:
        this.position.y++;
        break;
      case Orientation.west:
        this.position.x--;
        break;
      case Orientation.south:
        this.position.y--;
        break;
    }
  }

  void _rotateR() {
    switch (this.orientation) {
      case Orientation.east:
        this.orientation = Orientation.south;
        break;
      case Orientation.south:
        this.orientation = Orientation.west;
        break;
      case Orientation.west:
        this.orientation = Orientation.north;
        break;
      case Orientation.north:
        this.orientation = Orientation.east;
        break;
    }
  }

  void _rotateL() {
    switch (this.orientation) {
      case Orientation.east:
        this.orientation = Orientation.north;
        break;
      case Orientation.south:
        this.orientation = Orientation.east;
        break;
      case Orientation.west:
        this.orientation = Orientation.south;
        break;
      case Orientation.north:
        this.orientation = Orientation.west;
        break;
    }
  }
}
