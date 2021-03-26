# Mostarlab Code Challenge

* Ruby version: 3.0.0

* Rails version: 6.1.3

* System dependencies: Docker, docker compose, bundle and make 

* Configuration: Run `make run-dev`

* Database creation: Run `make dev-db-mount`

* Database initialization: Run `make dev-prepare`

* How to run the test suite: Run `make tests`

* Services:
    1. Create an user: 
        * HTTP Method: `POST`
        * Endpoint: `users/sign-in`
        * Headers:
            * `Content-type`: `application/json`
        * JSON body:
        ```json
        {
            "username": "emicast",
            "full_name": "Emilia Castilla",
            "password": "SecretPass"
        }
        ```
       
    2. Authentication:
        * HTTP Method: `POST`
        * Endpoint: `users/sign-in`
        * Headers:
            * `Content-type`: `application/json`
        * JSON body:
        ```json
        {
          "username": "landres",
          "password": "SecretPass"
        }
        ```
    
    3. Fetch all movies:
        * HTTP Method: `GET`
        * Endpoint: `movies`
        * Headers:
            * `Content-type`: `application/json`
            * `Authorization`: `Bearer {replace with token obtained in 1 or 2}`
        * Query params:
            * `limit`: Integer. Default value: 10
            * `offset`: Integer. Default value: 0
            * `search`: String.
    
    4. Fetch a movie:
        * HTTP Method: `GET`
        * Endpoint: `movies/:id`
        * Headers:
            * `Content-type`: `application/json`
            * `Authorization`: `Bearer {replace with token obtained in 1 or 2}`
    
    5. Fetch all user's favourite movies:
        * HTTP Method: `GET`
        * Endpoint: `users/favorites`
        * Headers:
            * `Content-type`: `application/json`
            * `Authorization`: `Bearer {replace with token obtained in 1 or 2}`
        * Query params:
            * `limit`: Integer. Default value: 10
            * `offset`: Integer. Default value: 0
    
    6. Add a movie in favorites:
        * HTTP Method: `POST`
        * Endpoint: `users/favorites`
        * Headers:
            * `Content-type`: `application/json`
            * `Authorization`: `Bearer {replace with token obtained in 1 or 2}`
        * JSON body:
        ```json
        {
          "movie_id": "529203"
        }
        ```
        
    
    