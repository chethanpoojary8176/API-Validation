Feature: test reqres API for all the scenarios

  Background:
    Given url baseUrl
    * def page_number = 3


  Scenario: Verify login with proper credential
    Given path '/login'
    And request
    """
    {
      "email": "eve.holt@reqres.in",
      "password": "cityslicka"
    }
    """
    When method POST
    Then status 200
    * print response

  Scenario: Verify login with improper credential
    Given path '/login'
    And request
    """
    {
      "email": "peter@klaven"
    }
    """
    When method POST
    Then status 400
    * print response
    
  Scenario Outline: For single user
    Given path '/users/<user_id>'
    When method GET
    Then status 200

    Examples:
      | user_id |
      | 2    |
      | 3   |
      | 4     |

  Scenario: when user id not found
    Given path '/users/100'
    When method GET
    Then status 404

  Scenario: Passing page number for list of users
    Given path 'users?page='+page_number
    When method GET
    Then status 200
    * print response
    * print response.page
    And match response.page == page_number
    
  Scenario: create user by passing name and email
    Given path '/users'
    And request
    """
    {
      "name": "John Doe",
      "email": "johndoe@example.com"
    }
    """
    When method POST
    Then status 201
    
  Scenario: update name and job of user 2
    Given path '/users/2'
    And request
    """
    {
      "name": "morpheus",
      "job": "leader"
    }
    """
    When method POST
    Then status 201
    * print response




  

  