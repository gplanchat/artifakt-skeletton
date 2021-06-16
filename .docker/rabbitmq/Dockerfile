FROM heidiks/rabbitmq-delayed-message-exchange:3.7-management

RUN rabbitmq-plugins enable --offline rabbitmq_delayed_message_exchange
RUN rabbitmq-plugins enable --offline rabbitmq_consistent_hash_exchange
RUN rabbitmq-plugins enable --offline rabbitmq_management
