require "test_helper"

class MovieTest < ActiveSupport::TestCase
  test "should not create without movie_id" do
    movie = Movie.new({ title: "Raya" })
    assert_not movie.valid?
  end

  test "should not create without title" do
    movie = Movie.new({ movie_id: 123 })
    assert_not movie.valid?
  end

  test "should not save without movie_id" do
    movie = Movie.new({ title: "Raya" })
    assert_not movie.save
  end

  test "should not save without title" do
    movie = Movie.new({ movie_id: 123 })
    assert_not movie.save
  end

  test "association casts default" do
    movie = Movie.new({ movie_id: 123, title: "Raya" })
    assert_empty movie.casts
  end

  test "association casts data" do
    movie = movies(:one)
    assert_not_empty movie.casts
  end

  test "association tags empty" do
    movie = Movie.new({ movie_id: 123, title: "Raya" })
    assert_empty movie.tags
  end

  test "association tags data" do
    movie = movies(:two)
    assert_not_empty movie.tags
  end

  test "association users default - aka favourites" do
    movie = Movie.new({ movie_id: 123, title: "Raya" })
    assert_empty movie.users
  end

  test "association users data - aka favourites" do
    movie = movies(:one)
    assert_not_empty movie.users
  end
end
