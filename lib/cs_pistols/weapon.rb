class CsPistols::Weapon
    attr_accessor :name, :url, :weapon_info

    @@all = []

    def initialize(name, url)
        @name = name
        @url = url
        @weapon_info = []
        @@all << self
    end
    
    def self.all
        CsPistols::Scraper.scrape_weapons if @@all.empty?
        @@all
    end


    def get_weapon_info
        CsPistols::Scraper.scrape_weapon_info(self) if @weapon_info.empty?
    end

    def save
        @@all << self
        self
    end

end
