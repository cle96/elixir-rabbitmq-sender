defmodule Rabbit do
	def loopMessages(channel) do
	receive do
		after
	    	1_000 ->
				AMQP.Basic.publish(channel, "", "catalog-worker", "Product [name]" |> Kernel.<>(DateTime.utc_now |> DateTime.to_string))
				IO.puts (" Product [name] sent to catalog-worker" |> Kernel.<>(DateTime.utc_now |> DateTime.to_string))
				loopMessages(channel)
		end
	end
end

{:ok, connection} = AMQP.Connection.open username: "user",
                                         password: "pass"

{:ok, channel} = AMQP.Channel.open(connection)
AMQP.Queue.declare(channel, "catalog-worker")
Rabbit.loopMessages(channel)
AMQP.Connection.close(connection)	
