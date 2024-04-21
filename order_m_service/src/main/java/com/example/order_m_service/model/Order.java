package com.example.order_m_service.model;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Order {
    private String orderID;
    private String key;
    private List<String> items;
    private List<String> qty;
    private Long price;
}
