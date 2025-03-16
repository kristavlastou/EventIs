package EventIs;
import java.util.ArrayList;
import java.util.List;

public class User {

  
    private String username;
    private String password;
    private String city;
    private String age;
    private String email;
    private String name;
    private String surname;
    private List<Event> favevents;




   public User(String var1, String var2, String var3, String var4, String var5, String var6, String var7) {
       this.username = var1;
       this.name = var2;
       this.surname = var3;
       this.password = var4;
       this.age = var5;
       this.city = var6;
       this.email = var7;
       this.favevents = new ArrayList<>();
    }
 

 
    public String getUsername() {
       return this.username;
    }
 
    public void setUsername(String var1) {
       this.username = var1;
    }
 
    public void setPassword(String var1) {
       this.password = var1;
    }
 
    public String getPassword() {
       return this.password;
    }

    public String getAge() {
        return this.age;
    }

    public void setAge(String var1) {
        this.age = var1;
    }

    public String getCity() {
        return this.city;
    }

    public void setCity(String var1) {
        this.city = var1;
    }

    public String getEmail() {
        return this.email;
     }
  
     public void setEmail(String var1) {
        this.email = var1;
     }


     public List<Event> getFavevents() {
      return favevents;
   }
   public String getName() {
      return name;
   }



   public void setName(String name) {
      this.name = name;
   }



   public String getSurname() {
      return surname;
   }



   public void setSurname(String surname) {
      this.surname = surname;
   }
   
 }
