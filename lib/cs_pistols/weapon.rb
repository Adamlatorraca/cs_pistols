class CsPistols::Weapon
    attr_accessor :name, :link, :weapon_info

    @@all = []

    def initialize(name, link)
        @name = name
        @link = link
        @weapon_info = []
        save
    end

    def self.get_weapons
        CsPistols::Scraper.scrape_weapon_names
    end
    
    def self.all
        @@all
    end

    def save
        @@all << self
        self
    end

end
