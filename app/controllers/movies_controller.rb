class MoviesController < ApplicationController
  before_action :auth_middleware, only: [:index, :show]

  # GET /movies?limit=10&offset=0&search=Movie
  def index
    search = params[:search]
    limit = (params[:limit] || 10).to_i
    offset = (params[:offset] || 0).to_i
    movies = Movie.includes(:tags)
                  .all
                  .where("title LIKE ?", "%#{search}%")
                  .limit(limit)
                  .offset(offset)
    res = {
      offset: offset,
      limit: limit,
    }
    if search
      res[:search] = search
    end
    if movies.size > 0
      res[:results] = movies.as_json(include: :tags)
      render status: :ok, json: res
    else
      render status: :not_found, json: { error: I18n.t('movies.not_found') }
    end
  end

  # GET /movies/:id
  def show
    movie = Movie.includes(:tags, :casts)
                 .find_by(movie_id: params[:id])
    if movie
      result = movie.as_json(include: [
        :tags,
        casts: { only: [:person, :interpretation] }
      ])
      render status: :ok, json: { results: result }
    else
      render status: :not_found, json: { error: I18n.t('movie.not_found') }
    end
  end
end
