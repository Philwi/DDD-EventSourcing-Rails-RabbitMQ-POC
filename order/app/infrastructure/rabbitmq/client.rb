class Rabbitmq::Client
  class << self
    def connection
      @connection ||=
        Bunny.new(
          host: ENV['RABBITMQ_HOST'],
          port: ENV['RABBITMQ_PORT'],
          user: ENV['RABBITMQ_USERNAME'],
          password: ENV['RABBITMQ_PASSWORD']
        )

      @connection.start
      @connection
    end
  end
end
