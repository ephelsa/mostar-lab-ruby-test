require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "should not create without full_name" do
    user = User.new({ username: "landres", password: "123123" })
    assert_not user.valid?
  end

  test "should not create without username" do
    user = User.new({ full_name: "Leonardo", password: "123123" })
    assert_not user.valid?
  end

  test "should not save without full_name" do
    user = User.new({ username: "landres", password: "123123" })
    assert_not user.save
  end

  test "should not save without username" do
    user = User.new({ full_name: "Leonardo", password: "123123" })
    assert_not user.save
  end

  test "save successfully" do
    user = users(:landres)
    assert user.valid?
    assert user.save
  end

  test "movie association default" do
    user = User.new({ full_name: "Leonardo", password: "123123", username: "lass" })
    assert_empty user.movies
  end

  test "movie association with data" do
    user = users(:landres)
    user.movies << movies(:two)

    assert_equal 2, user.movies.size
  end
end
