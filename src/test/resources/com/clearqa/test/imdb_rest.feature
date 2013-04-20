Feature: IMDB rest api gets

  Scenario: Get movie by title
    Given I query movie by "Finding Nemo"
    When I make the rest call
    Then response should contain:
      """
      {
      "title":"Finding Nemo",
      "genres":["Animation","Adventure","Comedy","Family"],
      "release_date":20030530
      }
      """

  Scenario Outline: Get many movies by title
    Given I query movie by "<title>"
    When I make the rest call
    Then response should contain "<genres>"
    
    Examples: No special characters in movie titles
    
    | title        | genres                                                               |
    | Finding Nemo | {"genres":["Animation","Adventure","Comedy","Family"]}               |
    | Inception    | {"genres": ["Action", "Adventure", "Mystery", "Sci-Fi", "Thriller"]} |
    
    Examples: Special characters in movie titles 
    | title        | genres                                                                |
    | WALL·E       | {"genres": ["Animation", "Adventure", "Family", "Romance", "Sci-Fi"]} |
    | 8½           | {"genres": ["Mystery", "Sci-Fi", "Thriller"] }                        |