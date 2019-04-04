=begin  
    @Author: Isaias Silva
    @Description: This class is a (PageObject), it is used to map the interface objects and
            create methods and actions for the respective screen.
            This class is instantiated in the page_helper.rb file
=end

class SearchPage < SitePrism::Page
    set_url ''
    
    element :cokkie, 'div[id="cookie-dismisser"]'
    element :field_search, 'input[id="searchInput"]'
    element :button_search, 'input[id="search"]'
    element :button_search2, '#search'

    def accept_cokkie
        cokkie.click
        sleep 2
    end

    def insert_pokemon(name_pokemon)
        field_search.set name_pokemon
        sleep 2
    end

    def search_pokemon
        #Click in button -> keyboard -> Enter
        button_search.send_keys(:enter)
        sleep 1
        #button_search.click
    end
    
    def scrool_down
        execute_script("window.scrollTo(0, document.body.scrollHeight)")
    end
end
