import java.util.Random;

class RNG {

  int returnRandom(int x)
  {
    Random rand = new Random();
    int y = rand.nextInt(x);
    return y;
  }
}
