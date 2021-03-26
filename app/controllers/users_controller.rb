class UsersController < ApplicationController
  before_action :auth_middleware, only: [:favourites_index, :favourites_add_movie]

  # GET /users/favorites?limit=10&offset=0
  def favourites_index
    limit = (params[:limit] || 10).to_i
    offset = (params[:offset] || 0).to_i
    if @user.movies.size > 0
      res = {
        offset: offset,
        limit: limit,
        results: @user.movies[offset, offset + limit]
                      .as_json(only: [:movie_id, :title])
      }
      render status: :ok, json: res
    else
      render status: :not_found, json: { error: I18n.t('favourites.not_found') }
    end
  end

  # POST /users/favorites
  def favourites_add_movie
    movie = Movie.find_by(movie_id: params[:movie_id])
    case
    when !movie
      render status: :not_found, json: { error: I18n.t('movie.not_found') }
    when movie.users.include?(@user)
      render status: :conflict, json: { error: I18n.t('favourites.movie_exists', title: movie[:title]) }
    else
      movie.users << @user
      render status: :created, json: { results: I18n.t('favourites.added', title: movie[:title]) }
    end
  end

  # POST /login
  def login
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      token = encode_token(@user[:user_id])
      render status: :ok, json: { results: { token: token } }
    else
      render status: :unauthorized, json: { error: I18n.t('user.invalid_credentials') }
    end
  end

  # POST /sign-in
  def sign_in
    @user = User.create(user_params)
    if @user.valid?
      token = encode_token(@user[:user_id])
      res = {
        message: I18n.t('user.created', username: @user[:username]),
        token: token
      }
      render status: :created, json: { result: res }
    else
      render status: :conflict, json: { error: I18n.t('user.invalid') }
    end
  end

  private

  def user_params
    params.permit(:full_name, :username, :password)
  end
end
