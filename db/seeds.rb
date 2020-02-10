require 'rest-client'
require 'json'
require_all 'apps/models'

poke_data = 'https://pokeapi.co/api/v2/pokemon/?limit=151'

def rest_and_parse(url)
    rest_data = RestClient.get(url)
    parse_data = JSON.parse(rest_data)

    parse_data["results"]
end

poke_data_better = rest_and_parse(poke_data)

def poke_name
    poke_data = 'https://pokeapi.co/api/v2/pokemon/?limit=151'
    poke_data_better = rest_and_parse(poke_data)
    poke_data_better.map { |nam| nam["name"]}
end

poke_name.each { |name| Pokemon.create(species: name)}
binding.pry