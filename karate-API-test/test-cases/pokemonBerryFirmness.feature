Feature: Test Pokémon API for Berry firmness

  Background:
    Given url baseUrl

  Scenario: Test Response with Different berry firmness
    Given path '/berry-firmness'
    When method GET
    Then status 200
    * def schema = read('schemas/pokemonBerryFirmness.schema.json')
    And match response == schema

  Scenario: Test Response with particular berry firmness
    Given path '/berry-firmness/very-soft'
    When method GET
    Then status 200


  Scenario: Test Invalid Pokémon Name
    Given path '/berry-firmness/very-big'
    When method GET
    Then status 404