defmodule Domain.UserTest do
  use AccountCore.DataCase

  alias AccountCore.{Domain, Model, Schema}

  @valid_attrs %{
    email: "liar009@gmail.com",
    password: "somepassword007",
    password_confirmation: "somepassword007"
  }

  @invalid_attrs %{email: "omm.com", password: "1323"}

  def user_fixture(attrs \\ %{}) do
    Model.User.create(@valid_attrs)
  end

  describe "User.sign_in/2" do
    test "valid" do
      {:ok, user} = user_fixture()
      %{email: email, password: password} = user
      assert {:ok, token, full_claims} = Domain.User.sign_in(email, password)
    end

    test "invalid" do
      %{email: email, password: password} = @invalid_attrs
      assert {:error, :unauthorized} = Domain.User.sign_in(email, password)
    end
  end

  describe "User.sign_up/2" do
    test "valid" do
      assert {:ok, user} = Domain.User.sign_up(@valid_attrs)
    end

    test "invalid" do
      assert {:error, user} = Domain.User.sign_up(@invalid_attrs)
    end
  end

  describe "User.update/2" do
    test "valid" do
      {:ok, user} = user_fixture()
      attrs = %{ email: "changed@gmail.com" }
      assert {:ok, user} = Domain.User.update(user, attrs)
      assert user.email == attrs.email
    end

    test "invalid" do
      {:ok, user} = user_fixture()
      attrs = %{ email: "1gmail.com" }
      assert {:error, errors} = Domain.User.update(user, attrs)
    end

  end
end
