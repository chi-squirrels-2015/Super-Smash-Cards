require 'yaml'
COUNTRIES = YAML.load_file('db/countries.yml')

module CountryCapitals
  def self.world_capitals
    capitals = []
    COUNTRIES.each do |country|
       h = {
        question: country['name']['common'],
        answer: country['capital']
        }
        capitals << h unless h[:answer] == ""
    end
    return capitals
  end

  # possible regions: Americas, Asia, Africa, Europe, Oceania,
  def self.capitals_by_region(region_name)
    capitals = []
    COUNTRIES.each do |country|
      h = {
        question: country['name']['common'],
        answer: country['capital']
        }
      capitals << h unless country["region"] == region_name
    end
    return capitals
  end

  # possible subregions: Caribbean, Southern Asia, Middle Africa, Northern Europe, Southern Europe, Western Asia, South America, Polynesia, , Australia and New Zealand, Western Europe, Eastern Africa, Western Africa, Eastern Europe, Central America, Northern America, South-Eastern Asia, Southern Africa, Eastern Asia, Northern Africa, Melanesia, Micronesia, Central Asia
  def self.capitals_by_subregion(subregion_name)
    capitals = []
    COUNTRIES.each do |country|
      h = {
        question: country['name']['common'],
        answer: country['capital']
        }
      capitals << h unless country["subregion"] == region_name
    end
    return capitals
  end
end
