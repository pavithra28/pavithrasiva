package com.example.order_m_service.kafka;

import com.example.order_m_service.model.OrderEvent;
import org.apache.kafka.clients.admin.NewTopic;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.kafka.support.KafkaHeaders;
import org.springframework.messaging.Message;
import org.springframework.messaging.support.MessageBuilder;
import org.springframework.stereotype.Service;



@Service
public class OrderProducer {

    private static Logger LOGGER= LoggerFactory.getLogger(OrderProducer.class);
    private NewTopic topic;
    private KafkaTemplate<String, OrderEvent> kafkaTemplate;


    public OrderProducer(NewTopic topic, KafkaTemplate<String, OrderEvent> kafkaTemplate) {
        this.topic = topic;
        this.kafkaTemplate = kafkaTemplate;
    }


    public boolean sendPickUpMessage(OrderEvent orderEvent){
       LOGGER.info(String.format("Order Pickup =>%s",orderEvent.toString()));

        Message<OrderEvent> message= MessageBuilder
               //create message
               .withPayload(orderEvent)
                .setHeader(KafkaHeaders.TOPIC,topic.name())
                .setHeader(KafkaHeaders.KEY,"PICKUP")
                .build();

        kafkaTemplate.send(message);
        return true;
    }

    public boolean sendDeliveryMessage(OrderEvent orderEvent){
        LOGGER.info(String.format("Order Delivery =>%s",orderEvent.toString()));

        Message<OrderEvent> message= MessageBuilder
                //create message
                .withPayload(orderEvent)
                .setHeader(KafkaHeaders.TOPIC,topic.name())
                .setHeader(KafkaHeaders.KEY,"DELIVERY")
                .build();

        kafkaTemplate.send(message);
        return true;
    }
}
