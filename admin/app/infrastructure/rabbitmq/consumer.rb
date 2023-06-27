class Rabbitmq::Consumer
  private

  attr_reader :queue_name, :connection

  public

  def initialize(queue_name: 'app', connection: Rabbitmq::Client.connection)
    @queue_name = queue_name
    @connection = connection
  end

  def consume
    connection.start
    channel = connection.create_channel
    queue = channel.queue(queue_name)
    queue.subscribe(block: true) do |delivery_info, properties, body|
      puts "Received #{body}"
      case delivery_info.routing_key
      when 'order.created'
        puts body
      end
    end
  end
end
