defmodule Assignment.Schemas.Balance do
  use Ecto.Schema
  @derive Jason.Encoder
  schema "balance" do
    field :user, :string
    field :status, :string
    field :request_uuid, :string
    field :currency, :string
    field :balance, :integer
  end
end
