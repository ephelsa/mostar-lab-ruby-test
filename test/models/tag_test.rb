require "test_helper"

class TagTest < ActiveSupport::TestCase
  test "should not create without name" do
    tag = Tag.new({ tag_id: 123 })
    assert_not tag.valid?
  end

  test "should not create without tag_id" do
    tag = Tag.new({ name: "Action" })
    assert_not tag.valid?
  end

  test "should be valid integer for tag_id" do
    tag = Tag.new({ tag_id: 123, name: "Action" })
    assert tag.valid?
  end

  test "should not save without name" do
    tag = Tag.new({ name: "Action" })
    assert_not tag.save
  end

  test "should not save without tag_id" do
    tag = Tag.new({ name: "Action" })
    assert_not tag.save
  end

  test "save successfully" do
    tag = tags(:fantasy)
    assert tag.valid?
    assert tag.save
  end

  test "movie association default" do
    tag = Tag.create({ tag_id: 123, name: "Comedy" })
    assert_empty tag.movies
  end

  test "movies associated" do
    tag = tags(:action)
    assert_not_empty tag.movies
  end
end
