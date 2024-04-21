package com.example.pickup_m_service.kafka;
import org.apache.kafka.clients.consumer.ConsumerRecord;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.stereotype.Service;

@Service
public class PickUpConsumer {

    private static final Logger LOGGER= LoggerFactory.getLogger(PickUpConsumer.class);

    @KafkaListener(topics="${spring.kafka.topic.name}",
    groupId = "${spring.kafka.consumer.group-id}")
    public void consume(ConsumerRecord<String, String> record){
        if(record.key().equals("PICKUP")) {
            try {
                LOGGER.info(String.format("Order PickUp =>  %s", record.toString()));
            } catch (Exception e) {
                LOGGER.error(String.format("exception thrown %s", e));
            }
        }
        else{
            LOGGER.info("Key doesnt match with PickUp, waiting for the message to log");
        }


    }
}
