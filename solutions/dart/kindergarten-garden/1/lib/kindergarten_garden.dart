enum Plant {
  radishes,
  clover,
  violets,
  grass,
}

enum Student {
  Alice,
  Bob,
  Charlie,
  David,
  Eve,
  Fred,
  Ginny,
  Harriet,
  Ileana,
  Joseph,
  Kincaid,
  Larry,
}

class KindergartenGarden {
  String rows;
  late String row1, row2;
  KindergartenGarden(this.rows) {
    var tmp = this.rows.split("\n");
    this.row1 = tmp[0];
    this.row2 = tmp[1];
  }

  List<Plant> plants(Student s) {
    int sId = Student.values.indexOf(s);
    int offset = sId * 2; //Every student has two plants each row
    List<String> p = [];

    p.add(row1[offset]);
    p.add(row1[offset + 1]);
    p.add(row2[offset]);
    p.add(row2[offset + 1]);

    var res = _getPlant(p);

    return res;
  }

  List<Plant> _getPlant(List<String> plants) {
    List<Plant> res = [];
    for (var p in plants) {
      switch (p) {
        case 'G':
          res.add(Plant.grass);
          break;
        case 'C':
          res.add(Plant.clover);
          break;
        case 'R':
          res.add(Plant.radishes);
          break;
        case 'V':
          res.add(Plant.violets);
          break;
        default:
          break;
      }
    }
    return res;
  }
}
