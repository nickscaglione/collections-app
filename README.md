# README
Current to-do:

Deckbuilding:
  - Create a new deck
    - belongs_to collection, so has access to cards only through that collection
    - assign a name
    - form will iterate through all cards while iterating through **each** card (card.count.times do...)
      - each card has a checkbox
    - submit

Refactor:
  - most controllers #create and #update actions
  - current_user should return an id rather than a User instance (we currently call current_user.id everywhere)
