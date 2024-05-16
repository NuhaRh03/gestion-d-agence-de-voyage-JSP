package models;



public class Voyageur {
	private int id;
    private String nom;
    private String prenom;
    private String passport;
    private String email;
    private int id_voyage;
    private String tele;

    // Constructors
    public Voyageur() {
    }

    public Voyageur( int id,String nom, String prenom, String passport, String email, int id_voyage, String tele) {
        this.nom = nom;
        this.prenom = prenom;
        this.passport = passport;
        this.email = email;
        this.id_voyage = id_voyage;
        this.tele = tele;
       
    }

    // Getters and Setters
    public int getId() {
    	return id;
    } 
    public void setId( int id) {
    	this.id=id;
    }
    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getPrenom() {
        return prenom;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

    public String getPassport() {
        return passport;
    }

    public void setPassport(String passport) {
        this.passport = passport;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getId_voyage() {
        return id_voyage;
    }

    public void setId_voyage(int id_voyage) {
        this.id_voyage = id_voyage;
    }

    public String getTele() {
        return tele;
    }

    public void setTele(String tele) {
        this.tele = tele;
    }

    // toString method
    @Override
    public String toString() {
        return "Voyageur{" +
                "nom='" + nom + '\'' +
                ", prenom='" + prenom + '\'' +
                ", passport='" + passport + '\'' +
                ", email='" + email + '\'' +
                ", id_voyage='" + id_voyage + '\'' +
                ", tele='" + tele + '\'' +
                '}';
    }
}
