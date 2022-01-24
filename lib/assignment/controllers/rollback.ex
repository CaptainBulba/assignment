defmodule Assignment.Controllers.Rollback do
  import Plug.Conn
  import Ecto.Query

  def init(options) do
    # initialize options
    options
  end

  def call(conn, _opts) do
    fconn = Plug.Conn.fetch_query_params(conn)
    case fconn.query_params do
      %{"rtu" => rtu} ->
        query = from u in Assignment.Schemas.Transactions,
        select: map(u, [:amount, :user]), where: u.reference_transaction_uuid == ^rtu

      [%{amount: amount, user: user}] = Assignment.Repo.all(query)

      balanceQuery = from u in Assignment.Schemas.Balance,
      select: u.balance, where: u.user == ^user

      balance = List.first(Assignment.Repo.all(balanceQuery))
      balance = balance + amount

      Assignment.Repo.update_all(
        from(p in Assignment.Schemas.Balance, where: p.user == ^user), set: [balance: balance])

      queryBalance = from(u in Assignment.Schemas.Balance, where: u.user == ^user)

      res = Assignment.Repo.all(queryBalance) |> Enum.map(&(Map.from_struct(&1) |> Map.drop([:__meta__]))) |> Jason.encode!()

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
