Given("I'm on pokedex page") do
    search.load
    sleep 3
end
  
When("I search box I enter {string} as my favorite pokemon") do |string|
    puts string
    search.insert_pokemon(string)
end

When("I accept cokkie") do
    search.accept_cokkie
end

When("I click the search button") do
    search.search_pokemon
end
  
Then("information from my favorite pokemon is displayed") do
    #Validation_01 - Check in page the name "Caterpie" 
    expect(page).to have_content("Caterpie")

    # Validation_02 - Finds the element by xPath and compares if the element is the same as expected
    caterpie = find(:xpath, '//html/body/div[4]/section[6]/ul/li/div[2]/h5')
    expect(caterpie.text).to eql 'Caterpie'
  
    #validation_03 - Check URL-Image passed by parameter exists on the screen
    img_file = 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/010.png'
    expect(page).to have_css("img[src*='#{img_file}']")

    sleep 2
end

#TC_001
Then("information several pokemons is displayed") do
     #Validation_02 - Check in page has name of some pokemons
     expect(page).to have_content("Bulbasaur")
     expect(page).to have_content("Ivysaur")
     expect(page).to have_content("Venusaur")
     expect(page).to have_content("Charmander")
     #search.scrool_down

     # Faz um scrool através do teclado 
     # find(:xpath, '//html/body/div[4]/section[6]/ul/li[4]/div[2]/h5').send_keys(:page_down)

     # Validation_01 - Finds the element by xPath and compares if the element is the same as expected
     bulbasaur = find(:xpath, '//html/body/div[4]/section[6]/ul/li[1]/div[2]/h5')
     expect(bulbasaur.text).to eql 'Bulbasaur'

     charmander = find(:xpath, '//html/body/div[4]/section[6]/ul/li[4]/div[2]/h5')
     expect(charmander.text).to eql 'Charmander'

     # Validation_02 - Find the element by CSS selector and compare the pokemon's abilities with the expected ability
     ivysaur_poison = find(:css, 'body > div.container.pokedex > section.section.pokedex-results.overflow-visible > ul > li:nth-child(2) > div.pokemon-info > div:nth-child(4) > span')
     expect(ivysaur_poison.text).to eql 'Poison'

     venusaur_grass = find(:css, 'body > div.container.pokedex > section.section.pokedex-results.overflow-visible > ul > li:nth-child(3) > div.pokemon-info > div:nth-child(3) > span')
     expect(venusaur_grass.text).to eql 'Grass'
end

When("in the search box I type a pokemon that does not exist as {string}") do |string|
    puts string
    search.insert_pokemon(string)
end
  
Then("a message stating that no Pokémon matches your search is displayed") do
    msg = find(:xpath, '//html/body/div[4]/section[6]/div[1]/div/h3')
    puts msg
    expect(msg.text).to eql 'No Pokémon Matched Your Search!'
end

