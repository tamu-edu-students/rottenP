# Seed the RottenPotatoes DB with some movies.
more_movies = [
  
  #{:title => 'My Neighbor Totoro', :rating => 'G',
  #  :release_date => '16-Apr-1988'},
  #{:title => 'Green Book', :rating => 'PG-13',
   # :release_date => '16-Nov-2018'},
  #{:title => 'Parasite', :rating => 'R',
   # :release_date => '30-May-2019'},
  #{:title => 'Nomadland', :rating => 'R',
   # :release_date => '19-Feb-2021'},
  #{:title => 'CODA', :rating => 'PG-13',
   # :release_date => '13-Aug-2021'}
  

  {:title => 'The Army of Darkness', :rating => 'R',
  :release_date => '20-Mar-1992'},
  {:title => 'Dead Alive', :rating => 'R',
  :release_date => '19-Feb-1992'},
  {:title => 'This is Spinal Tap', :rating => 'PG-13',
  :release_date => '13-Aug-1984'}
  ]

more_movies.each do |movie|
  Movie.create!(movie)
end