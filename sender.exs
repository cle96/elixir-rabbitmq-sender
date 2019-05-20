{:ok, connection} = AMQP.Connection.open username: "user",
                                         password: "pass"

{:ok, channel} = AMQP.Channel.open(connection)
AMQP.Queue.declare(channel, "catalog-worker")
AMQP.Basic.publish(channel, "", "catalog-worker", "Product [name]")
IO.puts " Product [name] sent to catalog-worker"
AMQP.Connection.close(connection)
