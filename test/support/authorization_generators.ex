defmodule PropertyTesting.Test.AuthorizationGenerators do
  use ExUnitProperties

  @lowercase_letters [?a..?z]

  def authorization(_role) do
    # TODO
    nil
  end

  def role,
    do: member_of(~w(admin user))

  def agency do
    gen all chunks <- list_of(agency_chunk(), min_length: 1, max_length: 12) do
      Enum.join(chunks, "-")
    end
  end

  def permissions do
    uniq_list_of(action(), min_length: 1)
  end

  def action,
    do: member_of(~w(read write delete))

  defp agency_chunk do
    string(@lowercase_letters, min_length: 1, max_length: 5)
  end
end
