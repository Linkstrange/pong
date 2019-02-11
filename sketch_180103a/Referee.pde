public class Referee implements Observer
{
    private Paddle _p1;
    private Paddle _p2;
    private ScoreBoard _scoreBoard;
    int _p1Score = 0;
    int _p2Score = 0;
    
    public boolean call = false;
    
    public Referee(Paddle player1, Paddle player2, ScoreBoard scoreBoard)
    {
       _p1 = player1;
       _p2 = player2;
       _scoreBoard = scoreBoard;
    }
    
    @Override
    public void Update(String state) {
      
       float posX = Float.valueOf(state.split(",")[0]);
    
       float p1PosX = _p1.GetProperties().GetPosition().x;
       float p2PosX = _p2.GetProperties().GetPosition().x;
    
       boolean scoreP2 = posX <= p1PosX;
       boolean scoreP1 = posX >= p2PosX;
    
       call = scoreP1 || scoreP2;
       
       if (scoreP1) _p1Score++;
      
       if (scoreP2) _p2Score++;
    
       if (call) _scoreBoard.UpdateScores(_p1Score, _p2Score);
    }
}