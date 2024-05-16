package models;



import java.sql.Date;

public class Voyage {
    private int id;
    private Date dateDepart;
    private Date dateRetour;
    private int nbPlaces;
    private String hotel;
    private String moyTransport;
    private String typev;

    // Constructors
    public Voyage() {
    }

    public Voyage(int id, Date dateDepart, Date dateRetour, int nbPlaces, String hotel, String moyTransport, String typev) {
        this.id = id;
        this.dateDepart = dateDepart;
        this.dateRetour = dateRetour;
        this.nbPlaces = nbPlaces;
        this.hotel = hotel;
        this.moyTransport = moyTransport;
        this.typev = typev;
    }

    // Getters and setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getDateDepart() {
        return dateDepart;
    }

    public void setDateDepart(Date dateDepart) {
        this.dateDepart = dateDepart;
    }

    public Date getDateRetour() {
        return dateRetour;
    }

    public void setDateRetour(Date dateRetour) {
        this.dateRetour = dateRetour;
    }

    public int getNbPlaces() {
        return nbPlaces;
    }

    public void setNbPlaces(int nbPlaces) {
        this.nbPlaces = nbPlaces;
    }

    public String getHotel() {
        return hotel;
    }

    public void setHotel(String hotel) {
        this.hotel = hotel;
    }

    public String getMoyTransport() {
        return moyTransport;
    }

    public void setMoyTransport(String moyTransport) {
        this.moyTransport = moyTransport;
    }

    public String getTypev() {
        return typev;
    }

    public void setTypev(String typev) {
        this.typev = typev;
    }
}
