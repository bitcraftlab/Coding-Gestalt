
class Turtle {

  int cubes = 3;
  int dcube = 3;
  int step;

  Grammar grammar;

  Turtle(Grammar gr) {
    grammar = gr; 
    reset();
  }

  void reset() {
    step = 0;
  }

  void draw() {

    // start drawing to the right
    rotateZ(-HALF_PI);
    rotateY(HALF_PI);

    box(dcube);

    step++;

    CharacterIterator it = grammar.getIterator();

    int i = 0;

    for (char ch = it.first(); ch != CharacterIterator.DONE; ch = it.next()) {

      if (i++ > step * mdepth * mdepth) return;

      switch (ch) {

      case 'F':

        for (int j = 1; j < cubes; j++) {
          translate(0, dcube, 0);
          fill(255);
          box(dcube);
        }


        break;

      case '-':
        rotateX(theta);
        break;

      case '+':
        rotateX(-theta);
        break;

      case '>':
        rotateY(theta);
        break;

      case '<':
        rotateY(-theta);
        break;

      case '&':
        rotateZ(-phi);
        break;

      case '^':
        rotateZ(phi);
        break;

      default:
        // System.err.println("character " + ch + " not in grammar");
      }
    }
  }
}

