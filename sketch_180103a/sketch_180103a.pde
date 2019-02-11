private Paddle p1, p2;
private Ball ball;
private ScoreBoard score;
private Referee referee;
private int ballSize = 10;
private ArrayList _drawables;

void setup() {
  int height = 600;
  int width = 600;
  int size = 70;

  int center = height / 2;
  int speed = 5;
  float accel = 0.5;
  int top = height;
  int bottom = 0;
  int paddleOffset = 20;
  int p1Pos = paddleOffset;
  int p2Pos = width - 10 - paddleOffset;

  p1 = new Paddle(p1Pos, center, top-size, bottom, speed, accel, size);
  p2 = new Paddle(p2Pos, center, top-size, bottom, speed, accel, size);
  score = new ScoreBoard();
  
  referee = new Referee(p1, p2, score);
  
  NewBall();

  _drawables = new ArrayList<IDrawable>();
  _drawables.add(p1);
  _drawables.add(p2);
  _drawables.add(ball);
  _drawables.add(score);

  size(600, 600);
}

void draw() {
  clear();

  for (Object drawable : _drawables) {
    if (drawable instanceof IDrawable)
    {
      IDrawable o = (IDrawable) drawable;
      o.Draw();
    }
  }
  
  if(referee.call) NewBall();

  CheckKeyPresses();
}

void NewBall()
{
  if (ball == null)
  { 
    ball = new Ball(p1, p2, ballSize);
    ball.Attach(referee);
    ball.Attach(p2);
  }
  ball.Restart();
}

void CheckKeyPresses()
{
  if (keyPressed == true)
  {
    if (key == CODED) {
      if (keyCode == UP) {
        p1.Down();
      } else if (keyCode == DOWN) {
        p1.Up();
      }
    }
  }
}

void keyReleased() {
  p1.RestartAcceleration();
}