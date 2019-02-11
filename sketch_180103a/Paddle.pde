public class Paddle implements IDrawable, Observer {
  private PaddleProperties _properties;
  private int _speed;
  private int _initialSpeed;
  private float _initialAccel;
  private BoundedNumber _accel;
  private int _lastDirection;
  
  public Paddle(int x, int y, int top, int bottom, int speed, float accel, int size) {
    _properties = new PaddleProperties(x, y, top, bottom, size);
    _speed = speed;
    _initialSpeed = _speed;
    _initialAccel = accel;
    RestartAcceleration();
    _lastDirection = 0;
  }
  
  @Override
  public void Update(String state) 
  {
    float ballPosY = Float.valueOf(state.split(",")[1]);
    
    float posYUpper = _properties.GetPosition().y;
    float posYLower = posYUpper +  _properties.GetSize();
    
    if(ballPosY > posYUpper) Up();   
    if(ballPosY < posYLower) Down();
  }
    
  public void Up()
  {
    _properties.AddY(_speed);

    RegisterDirection(1);
  }

  public void Down()
  {
    _properties.SubstractY(_speed);

    RegisterDirection(-1);
  }

  private void RegisterDirection(int d)
  {
    if (_lastDirection != d) {
      RestartAcceleration();
    } else {
      AddAcceleration();
    }

    _lastDirection = d;
  }

  public PaddleProperties GetProperties()
  {
    return _properties;
  }

  public void AddAcceleration()
  {
    _speed += _accel.Get();
    _accel.Add(_accel.Get());
  }

  public void RestartAcceleration()
  {
    _speed = _initialSpeed;
    _accel = new BoundedNumber(_initialAccel, 1, _initialAccel * 5);
  }

  public void Draw()
  {
    PVector pos = _properties.GetPosition();
    rect(pos.x, pos.y, 10, _properties.GetSize());
  }
}