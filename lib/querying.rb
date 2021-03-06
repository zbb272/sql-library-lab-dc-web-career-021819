def select_books_titles_and_years_in_first_series_order_by_year
  "SELECT books.title, books.year
  FROM books
  LEFT OUTER JOIN series on books.series_id = series.id
  WHERE series.id = 1
  ORDER BY year; "
end

def select_name_and_motto_of_char_with_longest_motto
  "SELECT name, motto
  FROM characters
  ORDER BY length(motto)
  DESC LIMIT 1;"
end


def select_value_and_count_of_most_prolific_species
  "SELECT species, COUNT(species)
  FROM characters
  GROUP BY species
  ORDER BY COUNT(species)
  DESC LIMIT 1;"
end

def select_name_and_series_subgenres_of_authors
  "SELECT authors.name, subgenres.name
  FROM series
  JOIN authors on authors.id = series.author_id
  JOIN subgenres on subgenres.id = series.subgenre_id;"
end

def select_series_title_with_most_human_characters
  "SELECT series.title
  FROM series
  JOIN characters on series.id = characters.series_id
  GROUP BY series.id
  HAVING characters.species = \"human\"
  ORDER BY COUNT(characters.species)
  DESC LIMIT 1;"

end

def select_character_names_and_number_of_books_they_are_in
  # "SELECT characters.name, COUNT(character_books.book_id) AS book_count
  # FROM characters
  # FULL JOIN character_books on characters.id = character_books.book_id
  # GROUP BY characters.name
  # ORDER BY book_count DESC;"
  "SELECT name, COUNT(character_books.book_id) AS book_count
  FROM character_books
  JOIN characters ON character_books.character_id = characters.id
  GROUP BY name
  ORDER BY book_count DESC;"

end
