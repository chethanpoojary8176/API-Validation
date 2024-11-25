Feature: Test Pokémon API with Different Arguments

  Background:
    Given url baseUrl

  Scenario Outline: Test Response with Different Pokémon
    Given path '/pokemon/<pokemon_name>'
    When method GET
    Then status 200
    And match response.name == '<pokemon_name>'
    And match response == 'schemas/pockemonType.schema.json'


    Examples:
      | pokemon_name |
      | bulbasaur    |
      | charmander   |
      | squirtle     |

  Scenario: Test Invalid Pokémon Name
    Given path '/pokemon/invalid_pokemon'
    When method GET
    Then status 404

  