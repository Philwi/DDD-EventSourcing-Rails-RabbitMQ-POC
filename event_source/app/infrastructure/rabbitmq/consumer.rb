class Rabbitmq::Consumer
  private

  attr_reader :connection

  public

  def initialize(connection: Rabbitmq::Client.connection)
    @connection = connection
  end

  def consume
    connection.start
    channel = connection.create_channel
    queue = channel.queue('', exclusive: true)
    queue.bind('logs')
    queue.subscribe(block: true) do |delivery_info, _properties, body|
      EventSource.create!(
        queue_name: delivery_info.consumer.queue.name,
        payload: body,
        routing_key: delivery_info.routing_key,
        exchange_name: delivery_info.exchange
      )
    end
  end
end
