package com.ptit.devops.ticket.entity;

import jakarta.persistence.*;
import java.math.BigDecimal;
import java.time.LocalDate;

@Entity
@Table(name = "tickets")
public class Ticket {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "ticket_code")
    private String ticketCode;

    @Column(name = "passenger_name")
    private String passengerName;

    @Column(name = "route")
    private String route;

    @Column(name = "departure_date")
    private LocalDate departureDate;

    @Column(name = "seat")
    private String seat;

    @Column(name = "price")
    private BigDecimal price;

    public Long getId() {
        return id;
    }

    public String getTicketCode() {
        return ticketCode;
    }

    public String getPassengerName() {
        return passengerName;
    }

    public String getRoute() {
        return route;
    }

    public LocalDate getDepartureDate() {
        return departureDate;
    }

    public String getSeat() {
        return seat;
    }

    public BigDecimal getPrice() {
        return price;
    }
}
