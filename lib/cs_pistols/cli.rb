require "pry"

class CsPistols::CLI
    def call
        puts "Welcome to Adam's CS:GO Weapons Reference App!"
        @input = ""
        get_pistols
        list_pistols       
        get_user_pistol
#        get_pistol_info
#        show_info_for
        goodbye
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

    def get_user_pistol
        chosen_pistol = gets.strip.to_i
        show_info_for(chosen_pistol) if valid_input(chosen_pistol, @weapons)
        get_pistol_info(chosen_weapon)
    end

    def valid_input(input, data)
        input.to_i <= data.length && input.to_i > 0
    end

=begin    def show_info_for(weapon)
       puts weapon.name
       weapon.key_info.each do |info|
        puts "- #{i}"
       end
    end

    def get_pistol_info(chosen_pistol)
        weapon = @weapons[chosen_pistol - 1]
        weapon.get_weapon_info
        show_info_for(weapon)
    end
=end
    def goodbye
        puts "Thanks for using my reference tool!"
    end

end