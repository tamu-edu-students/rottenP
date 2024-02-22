class MoviesController < ApplicationController
  def index
    @movies = Movie.all
    set_sorting_params
  end

  def sort
    session[:sort_column] = params[:column]
    session[:sort_direction] = toggle_direction(params[:column])
    redirect_to movies_path
  end

  # GET /movies/new
  def new
    @movie = Movie.new
  end

  # POST /movies
  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to movies_path, notice: 'Movie was successfully created.'
    else
      render :new
    end
  end

  # GET /movies/1 or /movies/1.json
  def show
    @movie = Movie.find(params[:id])
  end

  # DELETE /movies/1
  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to movies_path, notice: "Movie was successfully deleted."
  end

  # GET /movies/1/edit
  def edit
    @movie = Movie.find(params[:id])
  end

  # PATCH/PUT /movies/1
  def update
    @movie = Movie.find(params[:id])
    if @movie.update(movie_params)
      redirect_to movies_path, notice: 'Movie was successfully updated.'
    else
      render :edit
    end
  end

  private

  def set_sorting_params
    @sort_column = session[:sort_column]
    @sort_direction = session[:sort_direction] || 'asc'
    @movies = @movies.order("#{@sort_column} #{@sort_direction}") if @sort_column.present?
  end

  def movie_params
    params.require(:movie).permit(:title, :description, :release_date)
  end

  def toggle_direction(column)
    if session[:sort_column] == column && session[:sort_direction] == 'asc'
      'desc'
    else
      'asc'
    end
  end
end
