package EventIs;

import java.time.LocalDate;
import java.time.LocalTime;

public class Event {
    
    private int eventID;
    private String name;
    private LocalDate date;
    private LocalTime time;
    private String city;
    private String place;
    private double price;
    private String category; 
    private String description;
    
   
    public Event(String name, LocalDate date, LocalTime time, String city, String place, double price, String category, String description) {
        this.name = name;
        this.date = date;
        this.time = time;
        this.city = city;
        this.place = place;
        this.price = price;
        this.category = category;
        this.description = description;
    }

  
    public Event(int eventID, String name, LocalDate date, LocalTime time, String city, String place, double price, String category, String description) {
        this.eventID = eventID;
        this.name = name;
        this.date = date;
        this.time = time;
        this.city = city;
        this.place = place;
        this.price = price;
        this.category = category;
        this.description = description;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getPlace() {
        return place;
    }

    public void setPlace(String place) {
        this.place = place;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public int getEventID() {
        return eventID;
    }

    public void setEventID(int eventID) {
        this.eventID = eventID;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public LocalDate getDate() {
        return date;
    }

    public void setDate(LocalDate date) {
        this.date = date;
    }

    public LocalTime getTime() {
        return time;
    }

    public void setTime(LocalTime time) {
        this.time = time;
    }
}
