public class BoundedNumber {
  private float _n;
  private float _min;
  private float _max;

  public BoundedNumber(float n, float min, float max)
  {
    _n = n;
    _min = min;
    _max = max;
  }

  public void Set(float n)
  {
    _n = n;
    Bound();
  }

  public void Add(float val)
  {
    _n += val;
    Bound();
  }

  public void Substract(float val)
  {
    _n -= val;
    Bound();
  }

  public void Restart()
  {
    _n = _min;
  }

  private void Bound()
  {
    if (_n < _min)
    {
      _n = _min;
    }

    if (_n > _max)
    {
      _n = _max;
    }
  }

  public float Get()
  {
    return _n;
  }

  public float GetMin()
  {
    return _min;
  }

  public float GetMax()
  {
    return _max;
  }
}