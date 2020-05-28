class CsPistols::CLI
    def call
        puts "Welcome to Adam's CS:GO Weapons Reference App!"
            get_pistols
            list_pistols
    end

    def get_pistols
        @weapons = CsPistols::Weapon.all
    end

    def list_pistols
        puts "Choose a pistol!"
        @weapons.each.with_index(1) do |weapon, index|
            puts "#{index}. #{weapon.name}"
        end
    end
end