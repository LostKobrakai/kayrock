defmodule(Kayrock.DeleteRecords) do
  @moduledoc false
  _ = " THIS CODE IS GENERATED BY KAYROCK"

  defmodule(V0.Request) do
    @moduledoc false
    _ = " THIS CODE IS GENERATED BY KAYROCK"
    defstruct(topics: [], timeout: nil, correlation_id: nil, client_id: nil)
    import(Elixir.Kayrock.Serialize)
    @type t :: %__MODULE__{}
    def(api_key) do
      Kayrock.KafkaSchemaMetadata.api_key(:delete_records)
    end

    def(api_vsn) do
      0
    end

    def(response_deserializer) do
      &V0.Response.deserialize/1
    end

    def(schema) do
      [
        topics:
          {:array, [topic: :string, partitions: {:array, [partition: :int32, offset: :int64]}]},
        timeout: :int32
      ]
    end

    def(serialize(%V0.Request{} = struct)) do
      [
        <<api_key()::16, api_vsn()::16, struct.correlation_id()::32,
          byte_size(struct.client_id())::16, struct.client_id()::binary>>,
        [
          case(Map.fetch!(struct, :topics)) do
            nil ->
              <<-1::32-signed>>

            [] ->
              <<0::32-signed>>

            vals when is_list(vals) ->
              [
                <<length(vals)::32-signed>>,
                for(v <- vals) do
                  [
                    serialize(:string, Map.fetch!(v, :topic)),
                    case(Map.fetch!(v, :partitions)) do
                      nil ->
                        <<-1::32-signed>>

                      [] ->
                        <<0::32-signed>>

                      vals when is_list(vals) ->
                        [
                          <<length(vals)::32-signed>>,
                          for(v <- vals) do
                            [
                              serialize(:int32, Map.fetch!(v, :partition)),
                              serialize(:int64, Map.fetch!(v, :offset))
                            ]
                          end
                        ]
                    end
                  ]
                end
              ]
          end,
          serialize(:int32, Map.fetch!(struct, :timeout))
        ]
      ]
    end
  end

  defimpl(Elixir.Kayrock.Request, for: V0.Request) do
    def(serialize(%V0.Request{} = struct)) do
      try do
        V0.Request.serialize(struct)
      rescue
        e ->
          reraise(Kayrock.InvalidRequestError, {e, struct}, System.stacktrace())
      end
    end

    def(api_vsn(%V0.Request{})) do
      V0.Request.api_vsn()
    end

    def(response_deserializer(%V0.Request{})) do
      V0.Request.response_deserializer()
    end
  end

  def(get_request_struct(0)) do
    %V0.Request{}
  end

  defmodule(V0.Response) do
    @moduledoc false
    _ = " THIS CODE IS GENERATED BY KAYROCK"
    defstruct(throttle_time_ms: nil, topics: [], correlation_id: nil)
    @type t :: %__MODULE__{}
    import(Elixir.Kayrock.Deserialize)

    def(api_key) do
      Kayrock.KafkaSchemaMetadata.api_key(:delete_records)
    end

    def(api_vsn) do
      0
    end

    def(schema) do
      [
        throttle_time_ms: :int32,
        topics:
          {:array,
           [
             topic: :string,
             partitions: {:array, [partition: :int32, low_watermark: :int64, error_code: :int16]}
           ]}
      ]
    end

    def(deserialize(data)) do
      <<correlation_id::32-signed, rest::binary>> = data

      deserialize_field(
        :root,
        :throttle_time_ms,
        %__MODULE__{correlation_id: correlation_id},
        rest
      )
    end

    defp(deserialize_field(:root, :throttle_time_ms, acc, data)) do
      {val, rest} = deserialize(:int32, data)
      deserialize_field(:root, :topics, Map.put(acc, :throttle_time_ms, val), rest)
    end

    defp(deserialize_field(:topics, :topic, acc, data)) do
      {val, rest} = deserialize(:string, data)
      deserialize_field(:topics, :partitions, Map.put(acc, :topic, val), rest)
    end

    defp(deserialize_field(:partitions, :partition, acc, data)) do
      {val, rest} = deserialize(:int32, data)
      deserialize_field(:partitions, :low_watermark, Map.put(acc, :partition, val), rest)
    end

    defp(deserialize_field(:partitions, :low_watermark, acc, data)) do
      {val, rest} = deserialize(:int64, data)
      deserialize_field(:partitions, :error_code, Map.put(acc, :low_watermark, val), rest)
    end

    defp(deserialize_field(:partitions, :error_code, acc, data)) do
      {val, rest} = deserialize(:int16, data)
      deserialize_field(:partitions, nil, Map.put(acc, :error_code, val), rest)
    end

    defp(deserialize_field(:topics, :partitions, acc, data)) do
      <<num_elements::32-signed, rest::binary>> = data

      {vals, rest} =
        if(num_elements > 0) do
          Enum.reduce(1..num_elements, {[], rest}, fn _ix, {acc, d} ->
            {val, r} = deserialize_field(:partitions, :partition, %{}, d)
            {[val | acc], r}
          end)
        else
          {[], rest}
        end

      deserialize_field(:topics, nil, Map.put(acc, :partitions, Enum.reverse(vals)), rest)
    end

    defp(deserialize_field(:root, :topics, acc, data)) do
      <<num_elements::32-signed, rest::binary>> = data

      {vals, rest} =
        if(num_elements > 0) do
          Enum.reduce(1..num_elements, {[], rest}, fn _ix, {acc, d} ->
            {val, r} = deserialize_field(:topics, :topic, %{}, d)
            {[val | acc], r}
          end)
        else
          {[], rest}
        end

      deserialize_field(:root, nil, Map.put(acc, :topics, Enum.reverse(vals)), rest)
    end

    defp(deserialize_field(_, nil, acc, rest)) do
      {acc, rest}
    end
  end

  def(deserialize(0, data)) do
    V0.Response.deserialize(data)
  end

  @type request_t :: Kayrock.DeleteRecords.V0.Request.t()
  @type response_t :: Kayrock.DeleteRecords.V0.Response.t()
  def(min_vsn) do
    0
  end

  def(max_vsn) do
    0
  end
end
