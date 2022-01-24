defmodule Assignment.Schemas.Transactions do
  use Ecto.Schema
  @derive Jason.Encoder
  schema "transactions" do
    field :user, :string
    field :transaction_uuid, :string
    field :supplier_transaction_id, :string
    field :token, :string
    field :supplier_user, :string
    field :round_closed, :boolean
    field :round, :string
    field :reward_uuid, :string
    field :reference_transaction_uuid, :string
    field :is_free, :boolean
    field :is_aggregated, :boolean
    field :game_code, :integer
    field :currency, :string
    field :bet, :string
    field :amount, :integer
  end
end
