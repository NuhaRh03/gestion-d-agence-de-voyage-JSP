package models;

public class Moderateur {
    private int adminID;
    private String fullName;
    private String username;
    private String password;

    // Constructors
    public  Moderateur() {
    }

    public Moderateur(int adminID, String fullName, String username, String password) {
        this.adminID = adminID;
        this.fullName = fullName;
        this.username = username;
        this.password = password;
    }

    // Getters and setters
    public int getAdminID() {
        return adminID;
    }

    public void setAdminID(int adminID) {
        this.adminID = adminID;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
