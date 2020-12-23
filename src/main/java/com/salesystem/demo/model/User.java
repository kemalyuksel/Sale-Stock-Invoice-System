package com.salesystem.demo.model;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.Date;
import java.util.List;

@Entity
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotNull(message = "This field is required.")
    private String name;

    @NotNull(message = "This field is required.")
    private String surname;

    @NotNull(message = "This field is required.")
    private String username;

    @NotNull(message = "This field is required.")
    @Size(min =5,message = "Password must be at least 5 characters.")
    private String password;

    @NotNull(message = "This field is required.")
    private String address;

    private String photoUrl;

    @NotNull(message = "This field is required.")
    private String phoneNo;

    @NotNull(message = "This field is required.")
    @Email(message = "Please enter a valid email address.")
    private String mail;

    @DateTimeFormat(pattern="dd.MM.yyyy hh:mm")
    private Date created;

    @OneToMany(mappedBy = "user")
    private List<Bill> bills;

    @ManyToOne
    @JoinColumn(name="role_id")
    private Role role;


    public User() {
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public Date getCreated() {
        return created;
    }

    public void setCreated(Date created) {
        this.created = created;
    }

    public List<Bill> getBills() {
        return bills;
    }

    public void setBills(List<Bill> bills) {
        this.bills = bills;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
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

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhotoUrl() {
        return photoUrl;
    }

    public void setPhotoUrl(String photoUrl) {
        this.photoUrl = photoUrl;
    }

    public String getPhoneNo() {
        return phoneNo;
    }

    public void setPhoneNo(String phoneNo) {
        this.phoneNo = phoneNo;
    }
}
