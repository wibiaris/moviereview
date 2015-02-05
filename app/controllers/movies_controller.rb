class MoviesController < ApplicationController
	before_action :set_movie, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, except: [:index, :show]

	def index
		@movies = Movie.all
	end

	def show
	end

	def new
		@movies = current_user.movies.build
	end


	def create
		@movie = current_user.movies.build(movie_params)

		respond_to do |format|
			if @movie.save
				format.html { redirect_to @movie, notice: 'Movie was successfully created'}
				format.json { render :show, status: :created, location:@movies}
			else
				format.html { render :new }
				format.json { render json: @movies.erros}

			end

		end
	end

	def store
	end

	def edit
	end

	private

		def set_movie
			@movie = Movie.find(params[:id])
		end

		def movie_params
			params.require(:movie).permit(:title, :description, :movie_length, :director)
		end

end
