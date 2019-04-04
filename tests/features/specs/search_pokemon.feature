
Feature: Search Pokemon

-As a fan of the pokemon game, I want to search my favorite pokemon

#TC_001
Scenario: Search for several Pokemons
Given I'm on pokedex page
When I accept cokkie
When I click the search button
Then information several pokemons is displayed

#TC_002
Scenario: Search for Pokémon by name
Given I'm on pokedex page
When I accept cokkie
And I search box I enter "Caterpie" as my favorite pokemon
And I click the search button
Then information from my favorite pokemon is displayed

# #TC_003
Scenario: Look for a Pokemon that does not exist
Given I'm on pokedex page
When I accept cokkie
When in the search box I type a pokemon that does not exist as "IsaiasPokemon"
And I click the search button
Then a message stating that no Pokémon matches your search is displayed


