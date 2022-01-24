  defmodule Assignment.Router  do
    use Plug.Router

    plug :match
    plug :dispatch

    use Plug.ErrorHandler

    post "/user/info", to: Assignment.Controllers.Userinfo
    post "/user/balance", to: Assignment.Controllers.Balance
    post "/transaction/win", to: Assignment.Controllers.Win
    post "/transaction/rollback", to: Assignment.Controllers.Rollback
    post "/transaction/bet", to: Assignment.Controllers.Bet

    defp handle_errors(conn, %{kind: _kind, reason: _reason, stack: _stack}) do
      conn
      |> put_resp_content_type("application/json")
      |> send_resp(503, "{\"code\":503}")
    end
  end
