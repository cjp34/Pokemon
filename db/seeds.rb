require 'rest-client'
require 'json'
require_all 'apps/models'

poke_data = 'https://pokeapi.co/api/v2/pokemon/?limit=10'
Pokemon.destroy_all

def rest_and_parse(url)
    rest_data = RestClient.get(url)
    parse_data = JSON.parse(rest_data)
    parse_data["results"]
end

poke_data_better = rest_and_parse(poke_data)

def poke_name
    poke_data = 'https://pokeapi.co/api/v2/pokemon/?limit=10'
    poke_data_better = rest_and_parse(poke_data)
    poke_data_better.map { |nam| nam["name"]}
end

def poke_url_unravel

    poke_data = 'https://pokeapi.co/api/v2/pokemon/?limit=10'
    poke_data_better = rest_and_parse(poke_data)

    poke_url = poke_data_better.map { |mov| mov["url"]}
    instance = poke_url.map { |url| 
        rest_data = RestClient.get(url)
        parse_data = JSON.parse(rest_data)
        }
end

def get_those_types
poke_url_unravel.map { |data| 
    if data["types"].length > 1
        data["types"][0]["type"]["name"] + ", " + data["types"][1]["type"]["name"]
    else
        data["types"][0]["type"]["name"]
    end
    }
end
poke_name.each { |name| Pokemon.create(species: name)}
get_those_types.each { |type| Pokemon.update_attributes(poke_type: type)}


binding.pry