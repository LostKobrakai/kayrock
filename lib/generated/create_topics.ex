defmodule(Kayrock.CreateTopics) do
  @moduledoc false
  _ = " THIS CODE IS GENERATED BY KAYROCK"

  defmodule(V0.Request) do
    @moduledoc false
    _ = " THIS CODE IS GENERATED BY KAYROCK"
    defstruct(create_topic_requests: [], timeout: nil, correlation_id: nil, client_id: nil)
    import(Elixir.Kayrock.Serialize)
    @type t :: %__MODULE__{}
    def(api_key) do
      Kayrock.KafkaSchemaMetadata.api_key(:create_topics)
    end

    def(api_vsn) do
      0
    end

    def(response_deserializer) do
      &V0.Response.deserialize/1
    end

    def(schema) do
      [
        create_topic_requests:
          {:array,
           [
             topic: :string,
             num_partitions: :int32,
             replication_factor: :int16,
             replica_assignment: {:array, [partition: :int32, replicas: {:array, :int32}]},
             config_entries: {:array, [config_name: :string, config_value: :nullable_string]}
           ]},
        timeout: :int32
      ]
    end

    def(serialize(%V0.Request{} = struct)) do
      [
        <<api_key()::16, api_vsn()::16, struct.correlation_id()::32,
          byte_size(struct.client_id())::16, struct.client_id()::binary>>,
        [
          case(Map.fetch!(struct, :create_topic_requests)) do
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
                    serialize(:int32, Map.fetch!(v, :num_partitions)),
                    serialize(:int16, Map.fetch!(v, :replication_factor)),
                    case(Map.fetch!(v, :replica_assignment)) do
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
                              serialize_array(:int32, Map.fetch!(v, :replicas))
                            ]
                          end
                        ]
                    end,
                    case(Map.fetch!(v, :config_entries)) do
                      nil ->
                        <<-1::32-signed>>

                      [] ->
                        <<0::32-signed>>

                      vals when is_list(vals) ->
                        [
                          <<length(vals)::32-signed>>,
                          for(v <- vals) do
                            [
                              serialize(:string, Map.fetch!(v, :config_name)),
                              serialize(:nullable_string, Map.fetch!(v, :config_value))
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

  defmodule(V1.Request) do
    @moduledoc false
    _ = " THIS CODE IS GENERATED BY KAYROCK"

    defstruct(
      create_topic_requests: [],
      timeout: nil,
      validate_only: nil,
      correlation_id: nil,
      client_id: nil
    )

    import(Elixir.Kayrock.Serialize)
    @type t :: %__MODULE__{}
    def(api_key) do
      Kayrock.KafkaSchemaMetadata.api_key(:create_topics)
    end

    def(api_vsn) do
      1
    end

    def(response_deserializer) do
      &V1.Response.deserialize/1
    end

    def(schema) do
      [
        create_topic_requests:
          {:array,
           [
             topic: :string,
             num_partitions: :int32,
             replication_factor: :int16,
             replica_assignment: {:array, [partition: :int32, replicas: {:array, :int32}]},
             config_entries: {:array, [config_name: :string, config_value: :nullable_string]}
           ]},
        timeout: :int32,
        validate_only: :boolean
      ]
    end

    def(serialize(%V1.Request{} = struct)) do
      [
        <<api_key()::16, api_vsn()::16, struct.correlation_id()::32,
          byte_size(struct.client_id())::16, struct.client_id()::binary>>,
        [
          case(Map.fetch!(struct, :create_topic_requests)) do
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
                    serialize(:int32, Map.fetch!(v, :num_partitions)),
                    serialize(:int16, Map.fetch!(v, :replication_factor)),
                    case(Map.fetch!(v, :replica_assignment)) do
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
                              serialize_array(:int32, Map.fetch!(v, :replicas))
                            ]
                          end
                        ]
                    end,
                    case(Map.fetch!(v, :config_entries)) do
                      nil ->
                        <<-1::32-signed>>

                      [] ->
                        <<0::32-signed>>

                      vals when is_list(vals) ->
                        [
                          <<length(vals)::32-signed>>,
                          for(v <- vals) do
                            [
                              serialize(:string, Map.fetch!(v, :config_name)),
                              serialize(:nullable_string, Map.fetch!(v, :config_value))
                            ]
                          end
                        ]
                    end
                  ]
                end
              ]
          end,
          serialize(:int32, Map.fetch!(struct, :timeout)),
          serialize(:boolean, Map.fetch!(struct, :validate_only))
        ]
      ]
    end
  end

  defimpl(Elixir.Kayrock.Request, for: V1.Request) do
    def(serialize(%V1.Request{} = struct)) do
      try do
        V1.Request.serialize(struct)
      rescue
        e ->
          reraise(Kayrock.InvalidRequestError, {e, struct}, System.stacktrace())
      end
    end

    def(api_vsn(%V1.Request{})) do
      V1.Request.api_vsn()
    end

    def(response_deserializer(%V1.Request{})) do
      V1.Request.response_deserializer()
    end
  end

  defmodule(V2.Request) do
    @moduledoc false
    _ = " THIS CODE IS GENERATED BY KAYROCK"

    defstruct(
      create_topic_requests: [],
      timeout: nil,
      validate_only: nil,
      correlation_id: nil,
      client_id: nil
    )

    import(Elixir.Kayrock.Serialize)
    @type t :: %__MODULE__{}
    def(api_key) do
      Kayrock.KafkaSchemaMetadata.api_key(:create_topics)
    end

    def(api_vsn) do
      2
    end

    def(response_deserializer) do
      &V2.Response.deserialize/1
    end

    def(schema) do
      [
        create_topic_requests:
          {:array,
           [
             topic: :string,
             num_partitions: :int32,
             replication_factor: :int16,
             replica_assignment: {:array, [partition: :int32, replicas: {:array, :int32}]},
             config_entries: {:array, [config_name: :string, config_value: :nullable_string]}
           ]},
        timeout: :int32,
        validate_only: :boolean
      ]
    end

    def(serialize(%V2.Request{} = struct)) do
      [
        <<api_key()::16, api_vsn()::16, struct.correlation_id()::32,
          byte_size(struct.client_id())::16, struct.client_id()::binary>>,
        [
          case(Map.fetch!(struct, :create_topic_requests)) do
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
                    serialize(:int32, Map.fetch!(v, :num_partitions)),
                    serialize(:int16, Map.fetch!(v, :replication_factor)),
                    case(Map.fetch!(v, :replica_assignment)) do
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
                              serialize_array(:int32, Map.fetch!(v, :replicas))
                            ]
                          end
                        ]
                    end,
                    case(Map.fetch!(v, :config_entries)) do
                      nil ->
                        <<-1::32-signed>>

                      [] ->
                        <<0::32-signed>>

                      vals when is_list(vals) ->
                        [
                          <<length(vals)::32-signed>>,
                          for(v <- vals) do
                            [
                              serialize(:string, Map.fetch!(v, :config_name)),
                              serialize(:nullable_string, Map.fetch!(v, :config_value))
                            ]
                          end
                        ]
                    end
                  ]
                end
              ]
          end,
          serialize(:int32, Map.fetch!(struct, :timeout)),
          serialize(:boolean, Map.fetch!(struct, :validate_only))
        ]
      ]
    end
  end

  defimpl(Elixir.Kayrock.Request, for: V2.Request) do
    def(serialize(%V2.Request{} = struct)) do
      try do
        V2.Request.serialize(struct)
      rescue
        e ->
          reraise(Kayrock.InvalidRequestError, {e, struct}, System.stacktrace())
      end
    end

    def(api_vsn(%V2.Request{})) do
      V2.Request.api_vsn()
    end

    def(response_deserializer(%V2.Request{})) do
      V2.Request.response_deserializer()
    end
  end

  def(get_request_struct(0)) do
    %V0.Request{}
  end

  def(get_request_struct(1)) do
    %V1.Request{}
  end

  def(get_request_struct(2)) do
    %V2.Request{}
  end

  defmodule(V0.Response) do
    @moduledoc false
    _ = " THIS CODE IS GENERATED BY KAYROCK"
    defstruct(topic_errors: [], correlation_id: nil)
    @type t :: %__MODULE__{}
    import(Elixir.Kayrock.Deserialize)

    def(api_key) do
      Kayrock.KafkaSchemaMetadata.api_key(:create_topics)
    end

    def(api_vsn) do
      0
    end

    def(schema) do
      [topic_errors: {:array, [topic: :string, error_code: :int16]}]
    end

    def(deserialize(data)) do
      <<correlation_id::32-signed, rest::binary>> = data
      deserialize_field(:root, :topic_errors, %__MODULE__{correlation_id: correlation_id}, rest)
    end

    defp(deserialize_field(:topic_errors, :topic, acc, data)) do
      {val, rest} = deserialize(:string, data)
      deserialize_field(:topic_errors, :error_code, Map.put(acc, :topic, val), rest)
    end

    defp(deserialize_field(:topic_errors, :error_code, acc, data)) do
      {val, rest} = deserialize(:int16, data)
      deserialize_field(:topic_errors, nil, Map.put(acc, :error_code, val), rest)
    end

    defp(deserialize_field(:root, :topic_errors, acc, data)) do
      <<num_elements::32-signed, rest::binary>> = data

      {vals, rest} =
        if(num_elements > 0) do
          Enum.reduce(1..num_elements, {[], rest}, fn _ix, {acc, d} ->
            {val, r} = deserialize_field(:topic_errors, :topic, %{}, d)
            {[val | acc], r}
          end)
        else
          {[], rest}
        end

      deserialize_field(:root, nil, Map.put(acc, :topic_errors, Enum.reverse(vals)), rest)
    end

    defp(deserialize_field(_, nil, acc, rest)) do
      {acc, rest}
    end
  end

  defmodule(V1.Response) do
    @moduledoc false
    _ = " THIS CODE IS GENERATED BY KAYROCK"
    defstruct(topic_errors: [], correlation_id: nil)
    @type t :: %__MODULE__{}
    import(Elixir.Kayrock.Deserialize)

    def(api_key) do
      Kayrock.KafkaSchemaMetadata.api_key(:create_topics)
    end

    def(api_vsn) do
      1
    end

    def(schema) do
      [
        topic_errors:
          {:array, [topic: :string, error_code: :int16, error_message: :nullable_string]}
      ]
    end

    def(deserialize(data)) do
      <<correlation_id::32-signed, rest::binary>> = data
      deserialize_field(:root, :topic_errors, %__MODULE__{correlation_id: correlation_id}, rest)
    end

    defp(deserialize_field(:topic_errors, :topic, acc, data)) do
      {val, rest} = deserialize(:string, data)
      deserialize_field(:topic_errors, :error_code, Map.put(acc, :topic, val), rest)
    end

    defp(deserialize_field(:topic_errors, :error_code, acc, data)) do
      {val, rest} = deserialize(:int16, data)
      deserialize_field(:topic_errors, :error_message, Map.put(acc, :error_code, val), rest)
    end

    defp(deserialize_field(:topic_errors, :error_message, acc, data)) do
      {val, rest} = deserialize(:nullable_string, data)
      deserialize_field(:topic_errors, nil, Map.put(acc, :error_message, val), rest)
    end

    defp(deserialize_field(:root, :topic_errors, acc, data)) do
      <<num_elements::32-signed, rest::binary>> = data

      {vals, rest} =
        if(num_elements > 0) do
          Enum.reduce(1..num_elements, {[], rest}, fn _ix, {acc, d} ->
            {val, r} = deserialize_field(:topic_errors, :topic, %{}, d)
            {[val | acc], r}
          end)
        else
          {[], rest}
        end

      deserialize_field(:root, nil, Map.put(acc, :topic_errors, Enum.reverse(vals)), rest)
    end

    defp(deserialize_field(_, nil, acc, rest)) do
      {acc, rest}
    end
  end

  defmodule(V2.Response) do
    @moduledoc false
    _ = " THIS CODE IS GENERATED BY KAYROCK"
    defstruct(throttle_time_ms: nil, topic_errors: [], correlation_id: nil)
    @type t :: %__MODULE__{}
    import(Elixir.Kayrock.Deserialize)

    def(api_key) do
      Kayrock.KafkaSchemaMetadata.api_key(:create_topics)
    end

    def(api_vsn) do
      2
    end

    def(schema) do
      [
        throttle_time_ms: :int32,
        topic_errors:
          {:array, [topic: :string, error_code: :int16, error_message: :nullable_string]}
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
      deserialize_field(:root, :topic_errors, Map.put(acc, :throttle_time_ms, val), rest)
    end

    defp(deserialize_field(:topic_errors, :topic, acc, data)) do
      {val, rest} = deserialize(:string, data)
      deserialize_field(:topic_errors, :error_code, Map.put(acc, :topic, val), rest)
    end

    defp(deserialize_field(:topic_errors, :error_code, acc, data)) do
      {val, rest} = deserialize(:int16, data)
      deserialize_field(:topic_errors, :error_message, Map.put(acc, :error_code, val), rest)
    end

    defp(deserialize_field(:topic_errors, :error_message, acc, data)) do
      {val, rest} = deserialize(:nullable_string, data)
      deserialize_field(:topic_errors, nil, Map.put(acc, :error_message, val), rest)
    end

    defp(deserialize_field(:root, :topic_errors, acc, data)) do
      <<num_elements::32-signed, rest::binary>> = data

      {vals, rest} =
        if(num_elements > 0) do
          Enum.reduce(1..num_elements, {[], rest}, fn _ix, {acc, d} ->
            {val, r} = deserialize_field(:topic_errors, :topic, %{}, d)
            {[val | acc], r}
          end)
        else
          {[], rest}
        end

      deserialize_field(:root, nil, Map.put(acc, :topic_errors, Enum.reverse(vals)), rest)
    end

    defp(deserialize_field(_, nil, acc, rest)) do
      {acc, rest}
    end
  end

  def(deserialize(0, data)) do
    V0.Response.deserialize(data)
  end

  def(deserialize(1, data)) do
    V1.Response.deserialize(data)
  end

  def(deserialize(2, data)) do
    V2.Response.deserialize(data)
  end

  @type request_t ::
          Kayrock.CreateTopics.V2.Request.t()
          | Kayrock.CreateTopics.V1.Request.t()
          | Kayrock.CreateTopics.V0.Request.t()
  @type response_t ::
          Kayrock.CreateTopics.V2.Response.t()
          | Kayrock.CreateTopics.V1.Response.t()
          | Kayrock.CreateTopics.V0.Response.t()
  def(min_vsn) do
    0
  end

  def(max_vsn) do
    2
  end
end
