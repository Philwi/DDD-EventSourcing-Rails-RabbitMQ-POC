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
      puts " [x] Received #{body}"
    end
  end
end
