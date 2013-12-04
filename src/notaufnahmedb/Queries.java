/*
 * 
 * Hier kommen alle Abfragen rein
 */
package notaufnahmedb;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.swing.JOptionPane;

/**
 *
 * @author Jens Fießelmann
 */
public class Queries {
  
  private DBConnectionManager dBConnection;
  private Connection dbcon;
  private Statement stmt;
  
  public Queries(DBConnectionManager dBConnection) throws SQLException {   
      this.dBConnection = dBConnection;
  }
  
  public String checkPW(String username) throws SQLException{
    this.dbcon = dBConnection.getConnectionFromPool();
    this.stmt = this.dbcon.createStatement();
        
        ResultSet rs= this.stmt.executeQuery("SELECT PW FROM Mitarbeiter "
               + "WHERE Nachname =" + "'"+username + "'" );
        
        rs.next();
        String pw = rs.getString("PW");
        this.dBConnection.returnConnectionToPool(this.dbcon);
        return pw;
  }
  
  public void patientAnlegen(String vname, String lname, String strasse,
          String post, String ort, String date, String krk, String krknr,
          String tel) throws SQLException{
  
    this.dbcon = dBConnection.getConnectionFromPool();
    this.stmt = this.dbcon.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
        ResultSet.CONCUR_UPDATABLE);
    this.stmt.executeUpdate("INSERT INTO Patient"
            + "(Vorname, Nachname, Strasse, PLZ, Ort, Gebdatum, KRK, krknr, "
            + "tel )"
            + "VALUES"
            +"(" +"'" +vname +"'" +"," +"'" +lname +"'" +"," +"'" + strasse 
            +"'" +","+"'" +post +"'" +"," 
            +"'" +ort +"'" +"," +"'" +date +"'" +"," +"'"+krk +"'" +"," 
            +"'"+krknr +"'" +"," +"'"+tel +"'"+")");
    this.dBConnection.returnConnectionToPool(this.dbcon);
    
    JOptionPane.showMessageDialog(null, "Patient wurde erfolgreich angelegt",
            "Patient angelegt", JOptionPane.DEFAULT_OPTION);
  }
  
  public void checkEmpty(){
    
  }
  
}
