/*
 * 
 * Hauptprogramm main()
 */
package notaufnahmedb;

import java.sql.SQLException;

/**
 *
 * @author Jens
 */
public class NotaufnahmeDB {

  /**
   * @param args the command line arguments
   */
  public static void main(String[] args) throws SQLException {
    
    DBConnectionManager dbConnection = new DBConnectionManager();
        //Hauptfenster
        LoginForm login;
        login = new LoginForm(dbConnection);
        login.setLocationRelativeTo(null);
        login.setVisible(true);        
    
  }
}
