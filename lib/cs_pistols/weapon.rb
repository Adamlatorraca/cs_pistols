class CsPistols::Weapon
    attr_accessor :name, :url, :price, :kill_reward, :ammo_capacity, :reload_time, :movement_speed, :firing_mode, :side, :description

    @@all = []

    def initialize(name, url)
        @name = name
        @url = url
        @@all << self
    end
    
    def self.all
        @@all
    end

    def save
        @@all << self
        self
    end
end
