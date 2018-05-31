package traitementDB;

import java.sql.*;

import javax.swing.JOptionPane;


public class Connect_DB {

	public Connection connexion;
	String url;
		
	// Connexion base de données
	public Connect_DB()	{
		try {
			Class.forName("com.mysql.jdbc.Driver");
			url = new String("jdbc:mysql://localhost:3306/scriptmfc");
			connexion = (Connection) DriverManager.getConnection(url,"root","");
			System.out.println("Connexion réussi");
		} catch (ClassNotFoundException e) {
			System.out.println(e.getMessage());
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
	}
	
	// Identification 
    public String verifID(String utilisateur, String mdp) {	
    	String verif ="";
	    try 
	    {
	    	Statement st = new Connect_DB().connexion.createStatement();
	    	ResultSet request = st.executeQuery("SELECT * FROM client as C");
	    	if (request.next()){
	    		verif = "accept";
	    		JOptionPane.showMessageDialog(null,"Données Correct !");
	    	} else {
	    		JOptionPane.showMessageDialog(null,"Données Incorrect !");
	    	}
	    		request.close();
	    }
	    catch (Exception e)
	    {
	    	System.out.println("Connexion Impossible");
	    e.printStackTrace();
	    }
	    return verif;
    }
    
}