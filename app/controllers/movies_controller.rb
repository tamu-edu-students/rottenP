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

  # GET /movies/1 or /movies/1.json
  def show
    @movie = Movie.find(params[:id])
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to movies_path, notice: "Movie was successfully deleted."
  end

  def edit
    @movie = Movie.find(params[:id])
  end


  private

  def set_sorting_params
    @sort_column = session[:sort_column]
    @sort_direction = session[:sort_direction] || 'asc'
    @movies = @movies.order("#{@sort_column} #{@sort_direction}") if @sort_column.present?
  end

  def toggle_direction(column)
    if session[:sort_column] == column && session[:sort_direction] == 'asc'
      'desc'
    else
      'asc'
    end
  end
end
