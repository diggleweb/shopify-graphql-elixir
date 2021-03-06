defmodule Shopify.GraphQL.ResponseTest do
  use ExUnit.Case, async: true

  alias Shopify.GraphQL.{ Config, Response }

  test "new/2" do
    config = Config.new()

    headers = [{ "content-type", "application/json" }]
    private = %{ key: "value" }
    status_code = 200

    response = Response.new(%{ body: "{\"ok\":true}", headers: headers, status_code: status_code }, config, private)

    assert %Response {
             body: %{ "ok" => true },
             headers: ^headers,
             private: ^private,
             status_code: ^status_code
           } = response
  end
end
