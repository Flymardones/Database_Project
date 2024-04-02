import java.text.SimpleDateFormat;
import java.util.HashSet;
import java.util.List;
import java.sql.*;
import java.util.Set;

public class InsertPhotosAndReporters {
    String host = "localhost";
    String port = "3306";
    String database = "Newspaper_Database"; //database containing tables to be queried
    String cp = "utf8"; //Database codepage supporting Danish (i.e. æøåÆØÅ)
    // Set username and password.
    String username = "user";		// Username for connection
    String password = "goblingon123";	// Password for username

    String url = "jdbc:mysql://" + host + ":" + port + "/" + database + "?characterEncoding=" + cp;
    public InsertPhotosAndReporters(List<PhotoAndReporter> photosAndReporters) {
        try {
            Set<Integer> cprSet = new HashSet<>();
            String stmt;
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");

            Connection connection = DriverManager.getConnection(url, username, password);
            Statement statement = connection.createStatement();


            for(PhotoAndReporter photoAndReporter : photosAndReporters) {

                System.out.print("\tPhoto: " + photoAndReporter.getPhoto());
                System.out.println("\tReporter: " + photoAndReporter.getReporter());
                int cpr = photoAndReporter.getReporter().getCPR();

                // Do not add journalist to table if already present
                if (!cprSet.contains(cpr)) {
                    cprSet.add(cpr);

                    stmt = "INSERT INTO Journalist VALUES ('" +
                            photoAndReporter.getReporter().getCPR() + "', '" +
                            photoAndReporter.getReporter().getFirstName() + "', '" +
                            photoAndReporter.getReporter().getLastName() + "', '" +
                            photoAndReporter.getReporter().getStreetName() + "', " +
                            photoAndReporter.getReporter().getCivicNumber() + ", '" +
                            photoAndReporter.getReporter().getCountry() + "', " +
                            photoAndReporter.getReporter().getZIPCode() + ", " +
                            null + ", " +    // Representing empty value for the Country column
                            null + ", " +    // Representing empty value for the Telephone column
                            null + ")";      // Representing empty value for the Email column
                    statement.execute(stmt);
                }


                String formattedDate = formatter.format(photoAndReporter.getPhoto().getDate());

                stmt = "INSERT INTO Photo VALUES ('" +
                        photoAndReporter.getPhoto().getTitle() + "', '" +
                        formattedDate + "', '" +
                        photoAndReporter.getReporter().getCPR() + "')";
                statement.execute(stmt);

                stmt = "INSERT INTO Photographer VALUES ('" +
                        photoAndReporter.getPhoto().getTitle() + "', '" +
                        photoAndReporter.getReporter().getCPR() + "')";
                statement.execute(stmt);
            }
            connection.close();

        }
        catch (Exception e) {
            e.printStackTrace();
        }


    }
}
