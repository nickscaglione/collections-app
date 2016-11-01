module LoginHelper
  def log_in
    do_things
    visit ('/login')
    fill_in('user_name', :with => 'immediato')
    fill_in('password', :with => 'password')
    click_button('submit')
  end

  def card_creator
    log_in
    visit new_card_path 
    choose('brand_Pokemon')
    fill_in('search_term', :with => 'Pikachu')
    click_button('Search')
  end

  def choice_doer
    card_creator
    choose('https://s3.amazonaws.com/pokemontcg/basep/4.jpg')
    fill_in('card[count]', :with => 4)
    click_button('Submit')
  end

  def editor
    log_in
    @card = Card.find_by(name: "Bulbasaur")
    visit edit_card_path(@card)
  end 

  def brand_creator
    log_in
    visit new_brand_path
    choose('brand_api_name_pokemon')
  end

  def deck_creator
      log_in
      visit new_deck_path
      choose('brand_Pokemon')
  end 

end 
