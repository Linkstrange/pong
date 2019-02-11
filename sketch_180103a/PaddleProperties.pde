public class PaddleProperties {
  private int _x;
  private BoundedNumber _y;
  private int _size;

  public PaddleProperties(int x, int y, int top, int bottom, int size) {
    _x = x;
    _y = new BoundedNumber(y, bottom, top);
    _size = size;
  }

  public PVector GetPosition()
  {
    return new PVector(_x, _y.Get());
  }

  public int GetSize()
  {
    return _size;
  }

  public void AddY(int speed)
  {
    _y.Add(speed);
  }

  public void SubstractY(int speed)
  {
    _y.Substract(speed);
  }
}