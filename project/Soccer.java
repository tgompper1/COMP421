import java.sql.* ;
import java.util.Scanner;
import java.util.concurrent.ThreadLocalRandom;


class Soccer
{
    public static void main ( String [ ] args ) throws SQLException
    {
      // Unique table names.  Either the user supplies a unique identifier as a command line argument, or the program makes one up.
        String tableName = "";
        int sqlCode=0;      // Variable to hold SQLCODE
        String sqlState="00000";  // Variable to hold SQLSTATE

        if ( args.length > 0 )
            tableName += args [ 0 ] ;
        else
          tableName += "exampletbl";

        // Register the driver.  You must register the driver before you can use it.
        try { DriverManager.registerDriver ( new com.ibm.db2.jcc.DB2Driver() ) ; }
        catch (Exception cnfe){ System.out.println("Class not found"); }

        // This is the url you must use for DB2.
        //Note: This url may not valid now ! Check for the correct year and semester and server name.
        String url = "jdbc:db2://winter2023-comp421.cs.mcgill.ca:50000/cs421";

        //REMEMBER to remove your user id and password before submitting your code!!
        String your_userid;
        String your_password;
        //AS AN ALTERNATIVE, you can just set your password in the shell environment in the Unix (as shown below) and read it from there.
        //$  export SOCSPASSWD=yoursocspasswd
        if(your_userid == null && (your_userid = System.getenv("SOCSUSER")) == null)
        {
          System.err.println("Error!! do not have a password to connect to the database!");
          System.exit(1);
        }
        if(your_password == null && (your_password = System.getenv("SOCSPASSWD")) == null)
        {
          System.err.println("Error!! do not have a password to connect to the database!");
          System.exit(1);
        }
        Connection con = DriverManager.getConnection (url,your_userid,your_password) ;
        Statement statement = con.createStatement ( ) ;

        String option;
        Scanner input = new Scanner(System.in);
        boolean exitFlag = false;

        while(!exitFlag){
            System.out.println("Soccer Main Menu \n \t 1. List information of matches of a country \n \t 2. Insert initial player information for a match \n \t 3. Purchase a Ticket \n \t 4. Exit application");
            option = input.nextLine();

            switch(option){
                case "1":
                    boolean flag = false;

                    while (!flag) {
                        // Listing information of matches of a country
                        System.out.println("Enter the country of interest:");

                        try {
                            String country = input.nextLine();
                            String querySQL = "SELECT DISTINCT team1, team2, mdate, round, (SELECT COUNT(*) from goals g where g.country = m.team1 AND g.matchid = m.matchid) AS team1_goals, (SELECT COUNT(*) from goals g where g.country = m.team2 and g.matchid = m.matchid) AS team1_goals, (SELECT COUNT(ticketid) FROM tickets WHERE tickets.matchid = m.matchid AND sold = TRUE) AS sold_tickets from matches m, tickets WHERE team1 = \'" + country + "\' OR team2 = \'" + country + "\' ORDER BY m.round";
                            java.sql.ResultSet rs = statement.executeQuery(querySQL);

                            while (rs.next()) {
                                String team1 = rs.getString(1);
                                String team2 = rs.getString(2);
                                String mdate = rs.getString(3);
                                String round = rs.getString(4);
                                String team1_goals = rs.getString(5);
                                String team2_goals = rs.getString(6);
                                String sold_tickets = rs.getString(7);
                                System.out.println(team1 + "\t" + team2 + "\t" + mdate + "\t" + round + "\t" + team1_goals + "\t" + team2_goals + "\t" + sold_tickets);
                            }

                            System.out.println("Enter [A] to find matches of another country, [P] to go to the previous menu:");
                            String choice = input.nextLine();
                            choice.toUpperCase();

                            switch (choice) {
                                case "A":
                                    break;
                                case "P":
                                    flag = true;
                                    break;
                            }
                        }

                        catch (SQLException e)
                        {
                          sqlCode = e.getErrorCode(); // Get SQLCODE
                          sqlState = e.getSQLState(); // Get SQLSTATE

                          // Your code to handle errors comes here;
                          // something more meaningful than a print would be good
                          System.out.println("Code: " + sqlCode + "  sqlState: " + sqlState);
                          System.out.println(e);
                         }
                    }

                    break;

                case "2":

                    boolean flag2 = false;

                    while(!flag2) {
                        statement.executeQuery("values CURRENT DATE");
                        String query1 = "SELECT m.matchid, m.team1, m.team2, m.mdate, m.round FROM matches m WHERE mdate >= (CURRENT DATE) AND m.mdate <= ((CURRENT DATE)+3)";
                        java.sql.ResultSet rs = statement.executeQuery(query1);
                        System.out.println("Matches:");
                        while (rs.next()) {
                            String matchid = rs.getString(1);
                            String team1 = rs.getString(2);
                            String team2 = rs.getString(3);
                            String mdate = rs.getString(4);
                            String round = rs.getString(5);
                            System.out.println(matchid + "\t" + team1 + "\t" + team2 + "\t" + mdate + "\t" + round);
                        }
                        System.out.println("Insert match ID for which the insert should be made. Enter [P] to return to the main menu.");
                        String id = input.nextLine();
                        id.toUpperCase();

                        if (id.equals("P")) {
                            break;
                        }

                        System.out.println("Insert country for which the insert should be made. Enter [P] to return to the main menu.");
                        String country = input.nextLine();
                        country.toUpperCase();

                        if (country.equals("P")) {
                            break;
                        }

                        String query2 = "SELECT p.name, p.number, p.position, pi.inTime, pi.outTime, pi.yellowCard, pi.redCard FROM players p, plays_in pi WHERE p.playerId = pi.playerId AND pi.matchId = \'" + id + "\' AND p.country = \'" + country + "\'";
                        java.sql.ResultSet rs2 = statement.executeQuery(query2);
                        System.out.println("The following players from " + country + " are already entered for match " + id + ":");

                        int length = 0;
                        while (rs2.next()) {
                            length += 1;
                            String name = rs2.getString(1);
                            String number = rs2.getString(2);
                            String position = rs2.getString(3);
                            String inTime = rs2.getString(4);
                            String outTime = rs2.getString(5);
                            String yellowCard = rs2.getString(6);
                            String redCard = rs2.getString(7);
                            System.out.println(name + "\t" + number + "\t" + position + "\t" + inTime + "\t" + outTime + "\t" + yellowCard + "\t" + redCard);
                        }
                        System.out.println("");

                        System.out.println("Players from " + country + " not yet selected:");
                        String query3 = "SELECT p.name, p.number, p.position FROM players p WHERE p.country= \'" + country + "\' EXCEPT SELECT p.name, p.number, p.position FROM players p, plays_in pi WHERE p.playerId = pi.playerId AND pi.matchId = \'" + id + "\' AND p.country = \'" + country + "\'";
                        java.sql.ResultSet rs3 = statement.executeQuery(query3);

                        int i = 1;
                        while (rs3.next()) {
                            String name = rs3.getString(1);
                            String number = rs3.getString(2);
                            String position = rs3.getString(3);
                            System.out.println(i + ". " + name + "\t" + number + "\t" + position);
                            i++;
                        }

                        System.out.println("");

                        if (length > 11){
                            System.out.println("The maximum number of players for this match has already been reached.");
                        }
                        else{
                            System.out.println("Enter the shirt number of the player you want to insert or [P] to return to the main menu.");
                            String player = input.nextLine();
                            player.toUpperCase();

                            if (player.equals("P")) {
                                break;
                            }

                            System.out.println("Enter the position you would like the player to play or [P] to return to the main menu.");
                            String pos = input.nextLine();
                            pos.toUpperCase();

                            if (pos.equals("P")) {
                                break;
                            }

                            String query4 = "INSERT INTO PLAYS_IN (playerId, matchId, inTime, outTime, yellowCard, redCard, position) Select p.playerId," + id + ", CURRENT TIMESTAMP, NULL, FALSE, FALSE, \'" + pos + "\' FROM players p WHERE p.number = " + player + " AND country = \'" + country + "\'";
                            statement.executeUpdate(query4);
                            String query5 = "SELECT p.name, p.number, p.position, pi.inTime, pi.outTime, pi.yellowCard, pi.redCard FROM players p, plays_in pi WHERE p.playerId = pi.playerId AND pi.matchId = \'" + id + "\' AND p.country = \'" + country + "\'";
                            java.sql.ResultSet rs5 = statement.executeQuery(query5);

                            System.out.println("The following players from " + country + " are entered for match " + id + ":");

                            while (rs5.next()) {
                                String name = rs5.getString(1);
                                String number = rs5.getString(2);
                                String position = rs5.getString(3);
                                String inTime = rs5.getString(4);
                                String outTime = rs5.getString(5);
                                String yellowCard = rs5.getString(6);
                                String redCard = rs5.getString(7);
                                System.out.println(name + "\t" + number + "\t" + position + "\t" + inTime + "\t" + outTime + "\t" + yellowCard + "\t" + redCard);

                            }
                        }

                        System.out.println("");
                        System.out.println("Enter [A] to find matches of another country, [P] to go to the previous menu:");
                        String choice = input.nextLine();
                        choice.toUpperCase();

                        switch (choice) {
                            case "A":
                                break;
                            case "P":
                                flag2 = true;
                                break;
                        }
                    }
                    break;

                case "3":
                    boolean flag3 = false;

                    while(!flag3) {
                        statement.executeQuery("values CURRENT DATE");
                        String query6 = "SELECT m.matchid, m.team1, m.team2, m.mdate, m.round FROM matches m WHERE mdate >= (CURRENT DATE) AND m.mdate <= ((CURRENT DATE)+3)";
                        java.sql.ResultSet rs6 = statement.executeQuery(query6);
                        System.out.println("Upcoming Matches in Next 3 Days:");
                        while (rs6.next()) {
                                String matchid = rs6.getString(1);
                                String team1 = rs6.getString(2);
                                String team2 = rs6.getString(3);
                                String mdate = rs6.getString(4);
                                String round = rs6.getString(5);
                                System.out.println(matchid + "\t" + team1 + "\t" + team2 + "\t" + mdate + "\t" + round);
                        }
                        System.out.println("Select match id for which you would like to purchase a ticket. Enter [P] to return to the main menu.");
                        String match = input.nextLine();
                        match.toUpperCase();

                        if (match.equals("P") || match.equals("p")) {
                            break;
                        }
                        // print avaliable ticket id and seat for game
                        String query7= "SELECT t.ticketid, t.seatnumber FROM tickets t WHERE t.matchid = \'" + match + "\' AND t.sold = FALSE";
                        java.sql.ResultSet rs7 = statement.executeQuery(query7);
                        System.out.println("Available tickets for match #" + match + ":");
                        while (rs7.next()) {
                                String ticketid = rs7.getString(1);
                                String seatnumber = rs7.getString(2);
                                System.out.println("ID: " + ticketid + "\t Seat: " + seatnumber);
                        }
                        System.out.println("Input seat ID number to view price. Enter [P] to return to the main menu.");
                        // spit out a random price between $90-$1000
                        String seat = input.nextLine();
                        seat.toUpperCase();

                        if (seat.equals("P")) {
                            break;
                        }

                        int price = ThreadLocalRandom.current().nextInt(80, 10001);
                        System.out.println("Ticket #" + seat + " costs $"+ price + ".00");

                        System.out.println("Would you like to purchase this seat [Y]/[N]?");
                        String purchase = input.nextLine();
                        purchase.toUpperCase();
                        if(purchase.equals("Y")){
                                System.out.println("Enter your account associated email address.");
                                String email = input.nextLine();
                                // insert purchased query
                                String query8 = "INSERT INTO PURCHASED (emailaddress, ticketid, price) VALUES (\'" + email + "\' , " + seat + ", " + price + ".00)";
                                statement.executeUpdate(query8);
                                // update ticket to true
                                String query9 = "UPDATE tickets SET sold = TRUE WHERE ticketid = \'" + seat + "\'";
                                statement.executeUpdate(query9);
                                System.out.println("Purchase Successful.");
                        }

                        System.out.println("");
                        System.out.println("Enter [A] to purchase another ticket, [P] to go to the previous menu:");
                        String choice = input.nextLine();
                        choice.toUpperCase();
                        switch (choice) {
                            case "A":
                                break;
                            case "P":
                                flag3 = true;
                                break;
                        }
                    }
                    break;

                case "4":
                    statement.close ( ) ;
                    con.close ( ) ;
                    exitFlag = true;
                    break;
                default:
                    System.out.println("Invalid input");
                    break;
            }
        }

        /*
        // Inserting Data into the table
        try
        {
          String insertSQL = "INSERT INTO " + tableName + " VALUES ( 1 , \'Vicki\' ) " ;
          System.out.println ( insertSQL ) ;
          statement.executeUpdate ( insertSQL ) ;
          System.out.println ( "DONE" ) ;
          insertSQL = "INSERT INTO " + tableName + " VALUES ( 2 , \'Vera\' ) " ;
          System.out.println ( insertSQL ) ;
          statement.executeUpdate ( insertSQL ) ;
          System.out.println ( "DONE" ) ;
          insertSQL = "INSERT INTO " + tableName + " VALUES ( 3 , \'Franca\' ) " ;
          System.out.println ( insertSQL ) ;
          statement.executeUpdate ( insertSQL ) ;
          System.out.println ( "DONE" ) ;
        }
        catch (SQLException e)
        {
          sqlCode = e.getErrorCode(); // Get SQLCODE
          sqlState = e.getSQLState(); // Get SQLSTATE
          // Your code to handle errors comes here;
          // something more meaningful than a print would be good
          System.out.println("Code: " + sqlCode + "  sqlState: " + sqlState);
          System.out.println(e);
        }
        // Querying a table
        try
        {
          String querySQL = "SELECT id, name from " + tableName + " WHERE NAME = \'Vicki\'";
          System.out.println (querySQL) ;
          java.sql.ResultSet rs = statement.executeQuery ( querySQL ) ;
          while ( rs.next ( ) )
          {
            int id = rs.getInt ( 1 ) ;
            String name = rs.getString (2);
            System.out.println ("id:  " + id);
            System.out.println ("name:  " + name);
          }
         System.out.println ("DONE");
        }
        catch (SQLException e)
        {
          sqlCode = e.getErrorCode(); // Get SQLCODE
          sqlState = e.getSQLState(); // Get SQLSTATE
          // Your code to handle errors comes here;
          // something more meaningful than a print would be good
          System.out.println("Code: " + sqlCode + "  sqlState: " + sqlState);
          System.out.println(e);
        }
      //Updating a table
      try
      {
        String updateSQL = "UPDATE " + tableName + " SET NAME = \'Mimi\' WHERE id = 3";
        System.out.println(updateSQL);
        statement.executeUpdate(updateSQL);
        System.out.println("DONE");
        // Dropping a table
        String dropSQL = "DROP TABLE " + tableName;
        System.out.println ( dropSQL ) ;
        statement.executeUpdate ( dropSQL ) ;
        System.out.println ("DONE");
      }
      catch (SQLException e)
      {
        sqlCode = e.getErrorCode(); // Get SQLCODE
        sqlState = e.getSQLState(); // Get SQLSTATE
        // Your code to handle errors comes here;
        // something more meaningful than a print would be good
        System.out.println("Code: " + sqlCode + "  sqlState: " + sqlState);
        System.out.println(e);
      }
      */

      // Finally but importantly close the statement and connection
      statement.close ( ) ;
      con.close ( ) ;
    }
}
