public abstract class Subject {
  private ArrayList _observers;
  private String _subjectState;

  protected Subject()
  {
    _observers = new ArrayList<Observer>();
    _subjectState = "";
  }

  public void Attach(Observer o) {
    _observers.add(o);
  }

  public void Detach(Observer o) {
    _observers.remove(o);
  }

  public void Notify() {
    for (Object object : _observers) {
      Observer o = (Observer) object;
      o.Update(GetState());
    }
  }

  public String GetState()
  {
    return _subjectState;
  }

  public void SetState(String state)
  {
    _subjectState = state;
  }
}