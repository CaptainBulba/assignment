defmodule Assignment.Controllers.UserInfo do
  import Plug.Conn
  import Ecto.Query

  def init(options) do
    # initialize options
    options
  end

  def call(conn, _opts) do
    fconn = Plug.Conn.fetch_query_params(conn)
    case fconn.query_params do
      %{"user" => usr} ->
        query = from(u in Assignment.Schemas.Info, where: u.user == ^usr)

        res = Assignment.Repo.all(query) |> Enum.map(&(Map.from_struct(&1) |> Map.drop([:__meta__]))) |> Jason.encode!()

        fconn
        |> put_resp_content_type("application/json")
        |> send_resp(200, res)
      _ ->
        fconn
        |> put_resp_content_type("text/plain")
        |> send_resp(503, "error")

    end
  end
end
