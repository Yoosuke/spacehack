defmodule Spacehack.PostsTest do
  use Spacehack.DataCase

  alias Spacehack.Posts

  describe "posts" do
    alias Spacehack.Posts.Post

    @valid_attrs %{b: "some b", body: "some body", data: "some data", date: ~D[2010-04-17], lat: 120.5, lng: 120.5, title: "some title", url: "some url"}
    @update_attrs %{b: "some updated b", body: "some updated body", data: "some updated data", date: ~D[2011-05-18], lat: 456.7, lng: 456.7, title: "some updated title", url: "some updated url"}
    @invalid_attrs %{b: nil, body: nil, data: nil, date: nil, lat: nil, lng: nil, title: nil, url: nil}

    def post_fixture(attrs \\ %{}) do
      {:ok, post} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Posts.create_post()

      post
    end

    test "list_posts/0 returns all posts" do
      post = post_fixture()
      assert Posts.list_posts() == [post]
    end

    test "get_post!/1 returns the post with given id" do
      post = post_fixture()
      assert Posts.get_post!(post.id) == post
    end

    test "create_post/1 with valid data creates a post" do
      assert {:ok, %Post{} = post} = Posts.create_post(@valid_attrs)
      assert post.b == "some b"
      assert post.body == "some body"
      assert post.data == "some data"
      assert post.date == ~D[2010-04-17]
      assert post.lat == 120.5
      assert post.lng == 120.5
      assert post.title == "some title"
      assert post.url == "some url"
    end

    test "create_post/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Posts.create_post(@invalid_attrs)
    end

    test "update_post/2 with valid data updates the post" do
      post = post_fixture()
      assert {:ok, %Post{} = post} = Posts.update_post(post, @update_attrs)
      assert post.b == "some updated b"
      assert post.body == "some updated body"
      assert post.data == "some updated data"
      assert post.date == ~D[2011-05-18]
      assert post.lat == 456.7
      assert post.lng == 456.7
      assert post.title == "some updated title"
      assert post.url == "some updated url"
    end

    test "update_post/2 with invalid data returns error changeset" do
      post = post_fixture()
      assert {:error, %Ecto.Changeset{}} = Posts.update_post(post, @invalid_attrs)
      assert post == Posts.get_post!(post.id)
    end

    test "delete_post/1 deletes the post" do
      post = post_fixture()
      assert {:ok, %Post{}} = Posts.delete_post(post)
      assert_raise Ecto.NoResultsError, fn -> Posts.get_post!(post.id) end
    end

    test "change_post/1 returns a post changeset" do
      post = post_fixture()
      assert %Ecto.Changeset{} = Posts.change_post(post)
    end
  end
end
