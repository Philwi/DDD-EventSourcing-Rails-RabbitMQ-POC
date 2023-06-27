class Rabbitmq::Producer
  private

  attr_reader :connection

  public

  def initialize(connection: Rabbitmq::Client.connection)
    @connection = connection
  end

  def publish(message)
    connection.start
    channel = connection.create_channel
    exchange = channel.fanout('logs')
    exchange.publish(message)
  end
end
