defmodule Assignment.Schemas.Info do
  use Ecto.Schema
  @derive Jason.Encoder
  schema "info" do
    field :user, :string
    field :status, :string
    field :request_uuid, :string
    field :country, :string
    field :jurisdiction, :string
    field :sub_partner_id, :string
    field :birth_date, :date
    field :registration_date, :date
    field :tags, {:array, :string}
    field :sex, :string
    field :affiliate_id, :string
  end
end
