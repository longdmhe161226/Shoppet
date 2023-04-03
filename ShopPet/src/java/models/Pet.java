/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

import java.sql.Date;

/**
 *
 * @author 12050
 */
public class Pet {
    private int id;
    private Date dob;
    private String healthStatus;
    private boolean gender;
    private float weight;
    private String color;
    private boolean vaccinated;
    private String identification;
    
    public Pet() {
    }

    public Pet(int id, Date dob, String healthStatus, boolean gender, float weight, String color, boolean vaccinated, String identification) {
        this.id = id;
        this.dob = dob;
        this.healthStatus = healthStatus;
        this.gender = gender;
        this.weight = weight;
        this.color = color;
        this.vaccinated = vaccinated;
        this.identification = identification;
        
        
    }

    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public String getHealthStatus() {
        return healthStatus;
    }

    public void setHealthStatus(String healthStatus) {
        this.healthStatus = healthStatus;
    }

    public boolean isGender() {
        return gender;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
    }

    public float getWeight() {
        return weight;
    }

    public void setWeight(float weight) {
        this.weight = weight;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public boolean isVaccinated() {
        return vaccinated;
    }

    public void setVaccinated(boolean vaccinated) {
        this.vaccinated = vaccinated;
    }

    public String getIdentification() {
        return identification;
    }

    public void setIdentification(String identification) {
        this.identification = identification;
    }

    @Override
    public String toString() {
        return "Pet{" + "id=" + id + ", dob=" + dob + ", healthStatus=" + healthStatus + ", gender=" + gender + ", weight=" + weight + ", color=" + color + ", vaccinated=" + vaccinated + ", identification=" + identification + '}';
    }

   
    
   

    
    
    
    
    
}
