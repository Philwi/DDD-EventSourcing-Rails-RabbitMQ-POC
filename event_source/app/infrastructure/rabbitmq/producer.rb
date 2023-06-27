class Rabbitmq::Producer
  private

  attr_reader :queue_name, :connection

  public

  def initialize(queue_name: 'app', connection: Rabbitmq::Client.connection)
    @queue_name = queue_name
    @connection = connection
  end

  def publish(message)
    connection.start
    channel = connection.create_channel
    queue = channel.queue(queue_name)
    queue.publish(message, persistent: true, time_to_live: 10000)
  end
end
