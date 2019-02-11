public class Ball extends Subject implements IDrawable { //<>//
  private Paddle _p1;
  private Paddle _p2;
  private BoundedNumber _x;
  private BoundedNumber _y;
  private PVector _pos;
  private float _angle;
  private BoundedNumber _speed;
  private int _size;

  public Ball(Paddle player1, Paddle player2, int size)
  {
    _p1 = player1;
    _p2 = player2;
    _size = size;
    Restart();
  }

  public void Restart()
  {
    _x = new BoundedNumber(width/2, 0, width);
    _y = new BoundedNumber(height/2, 0, height);
    _pos = new PVector(_x.Get(), _y.Get());
    _angle = random(1, 180);
    _speed = new BoundedNumber(5, 5, 20);
    SetState("New");
  }

  public void Draw()
  {
    rect(_pos.x, _pos.y, _size, _size);
    Update();
  }

  private void Update()
  {
    _pos.x += _speed.Get() * cos(_angle * PI /180);
    _pos.y += _speed.Get() * sin(_angle * PI /180);
    IncreaseSpeed();
    CheckCollission();
    SetState(_pos.x + "," + _pos.y); 
    Notify();
  }

  private void IncreaseSpeed()
  {
    _speed.Add(_speed.Get()/1000);
  }

  private void CheckCollission()
  {
    float p1PosX = _p1.GetProperties().GetPosition().x;
    float p2PosX = _p2.GetProperties().GetPosition().x;
    float p1PosY = _p1.GetProperties().GetPosition().y;
    float p2PosY = _p2.GetProperties().GetPosition().y;
    int p1Size = _p1.GetProperties().GetSize();
    int p2Size = _p2.GetProperties().GetSize();

    boolean p1 =_pos.x <= (p1PosX + 10) && (_pos.y >= p1PosY && _pos.y <= p1PosY + p1Size);
    boolean p2 =_pos.x >= (p2PosX - 10) && (_pos.y >= p2PosY && _pos.y <= p2PosY + p2Size);

    boolean y = _pos.y <= _y.GetMin() || _pos.y >= _y.GetMax();

    if (p1 || p2) ReboundX();
    
    if (y) ReboundY();
  }

  private void ReboundX()
  {
    _angle = random(175, 180) - _angle;
  }

  private void ReboundY()
  {
    _angle = random(355, 360) - _angle;
  }
}