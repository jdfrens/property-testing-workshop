defmodule PropertyTesting.Example10AuthorizationTest do
  alias PropertyTest.Authorization
  use ExUnit.Case, async: true
  use ExUnitProperties

  alias PropertyTesting.Authorization
  alias PropertyTesting.Test.AuthorizationGenerators, as: G

  describe "new" do
    @tag :skip
    property "G.authorization/0 returns valid Authorizations" do
      check all authorization <- G.authorization(:user) do
        assert {:ok, %Authorization{}} =
                 authorization
                 |> Map.from_struct()
                 |> Authorization.new()
      end
    end
  end

  describe "admin authorization" do
    @tag :skip
    property "can do anything regardless of agencies and permissions" do
      check all authorization <- G.authorization(:admin),
                agency <- G.agency(),
                action <- G.action() do
        assert Authorization.authorized?(agency, action, authorization)
      end
    end
  end

  describe "user authorization" do
    @tag :skip
    property "user is authorized" do
      check all %Authorization{} = authorization <- G.authorization(:user),
                agency <- member_of(authorization.agencies),
                action <- member_of(authorization.permissions) do
        assert Authorization.authorized?(agency, action, authorization)
      end
    end

    @tag :skip
    property "user is unauthorized when agency is different" do
      check all %Authorization{} = authorization <- G.authorization(:user),
                agency <- G.agency(),
                agency not in authorization.agencies,
                action <- member_of(authorization.permissions) do
        refute Authorization.authorized?(agency, action, authorization)
      end
    end

    @tag :skip
    property "user is unauthorized when action is not in permissions" do
      check all %Authorization{} = authorization <- G.authorization(:user),
                agency <- member_of(authorization.agencies),
                action <- G.action() do
        authorization =
          Map.update!(authorization, :permissions, fn permissions ->
            List.delete(permissions, action)
          end)

        refute Authorization.authorized?(agency, action, authorization)
      end
    end
  end
end
