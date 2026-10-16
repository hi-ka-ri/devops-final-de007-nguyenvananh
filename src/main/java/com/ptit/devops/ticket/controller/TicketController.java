package com.ptit.devops.ticket.controller;

import com.ptit.devops.ticket.entity.Ticket;
import com.ptit.devops.ticket.repository.TicketRepository;
import org.springframework.data.domain.Sort;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api")
public class TicketController {

    private final TicketRepository repository;

    public TicketController(TicketRepository repository) {
        this.repository = repository;
    }

    /** GET /api/tickets - danh sách vé xe khách */
    @GetMapping("/tickets")
    public List<Ticket> findAll() {
        return repository.findAll(Sort.by("id"));
    }
}
