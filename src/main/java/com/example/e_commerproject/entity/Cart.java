package com.example.e_commerproject.entity;
import lombok.*;

import javax.persistence.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor


@Entity
public class Cart {
        @Id
        @GeneratedValue(strategy = GenerationType.IDENTITY)
        private int cartID;

        @ManyToOne
        @JoinColumn(name = "userID")
        private User user;

        @ManyToOne
        @JoinColumn(name = "productID")
        private Product product;

        private int quantity;

        // Getters and setters
}

