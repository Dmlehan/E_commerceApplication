package com.example.e_commerproject.entity;

import lombok.*;

import javax.persistence.*;

@AllArgsConstructor
@Getter
@Setter
@NoArgsConstructor
@ToString



@Entity
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int productID;

    private String name;
    private String description;
    private double price;

    @ManyToOne
    @JoinColumn(name = "categoryID")
    private Category category;

    // Getters and setters
}
