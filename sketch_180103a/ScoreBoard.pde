public class ScoreBoard implements IDrawable {
  private int _p1Score, _p2Score;
  private PFont _f;

  public ScoreBoard()
  {
    _p1Score = 0;
    _p2Score = 0;
    _f = createFont("Arial", 32, true);
    textFont(_f);
    textAlign(CENTER);
  }

  public void Draw() //<>//
  {
    text(_p1Score + " | " + _p2Score, width/2, 60);
  }
  
  public void UpdateScores(int p1Score, int p2Score)
  {
    _p1Score = p1Score;
    _p2Score = p2Score;
  } 
}