package com.example.order_m_service.controller;

import com.example.order_m_service.kafka.OrderProducer;
import com.example.order_m_service.model.Order;
import com.example.order_m_service.model.OrderEvent;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.UUID;

@RestController
@RequestMapping("/food/order")
public class OrderController {
    private static Logger LOGGER= LoggerFactory.getLogger(OrderController.class);
    private OrderProducer orderProducer;
    private Boolean orderStatus;

    public OrderController(OrderProducer orderProducer) {
        this.orderProducer = orderProducer;
    }

    @PostMapping("/status")
    public  String placeOrder(@RequestBody Order order){
         order.setOrderID(UUID.randomUUID().toString());

        OrderEvent orderEvent=new OrderEvent();
        orderEvent.setOrder(order);
        if(orderEvent.getOrder().getKey().equals("PICKUP")){
            orderStatus=orderProducer.sendPickUpMessage(orderEvent);
        } else if (orderEvent.getOrder().getKey().equals("DELIVERY")) {
            orderStatus=orderProducer.sendDeliveryMessage(orderEvent);

        }else{
            LOGGER.info("Key doesnt match with pickup or delivery keys");
        }
        return  "Order placed sucessfully";
    }
}
