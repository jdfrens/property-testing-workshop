defmodule PropertyTesting.Authorization do
  use Ecto.Schema

  import Ecto.Changeset

  alias Ecto.Changeset
  alias PropertyTesting.Authorization

  @type agency :: String.t()

  @type action :: String.t()

  @type t :: %__MODULE__{
          role: String.t(),
          agencies: list(agency()),
          permissions: list(action())
        }

  @primary_key false
  embedded_schema do
    field :role, :string
    field :agencies, {:array, :string}
    field :permissions, {:array, :string}
  end

  @valid_roles ~w(admin user)
  @valid_agency_regex ~r/.+/
  @valid_actions ~w(read write delete)

  @spec new(keyword() | map()) :: {:ok, t()} | {:error, Changeset.t()}
  def new(params) do
    params
    |> Enum.into(%{})
    |> changeset()
    |> apply_action(:insert)
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, [:role, :agencies, :permissions])
    |> validate_required([:role, :agencies, :permissions])
    |> validate_inclusion(:role, @valid_roles)
    |> validate_agencies()
    |> validate_subset(:permissions, @valid_actions)
  end

  def roles,
    do: @valid_roles

  def actions,
    do: @valid_actions

  def authorized?(_agency, _action, %Authorization{} = _authorization) do
    # TODO
    false
  end

  defp validate_agencies(%Changeset{} = changeset) do
    Ecto.Changeset.validate_change(changeset, :agencies, fn :agencies, agencies ->
      Enum.reduce(agencies, [], fn value, acc ->
        case String.match?(value, @valid_agency_regex) do
          true -> acc
          false -> [{:agencies, "has element in invalid format: #{value}"} | acc]
        end
      end)
    end)
  end
end
