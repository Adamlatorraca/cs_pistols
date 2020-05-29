require "pry"

class CsPistols::CLI
    def call
        puts "Welcome to Adam's CS:GO Weapons Reference App!"
        @input = ""
        get_pistols
        list_pistols       
        get_user_pistol
        show_info_for
        goodbye
    end

    def get_pistols
        @weapons = CsPistols::Weapon.all
    end

    def list_pistols
        puts "Here are all of the pistols!"
        @weapons.each.with_index(1) do |weapon, index|
            puts "#{index}. #{weapon.name}"
        end
    end

    def get_user_pistol
        chosen_pistol = gets.strip.to_i
        show_info_for(chosen_pistol) if valid_input(chosen_pistol, @weapons)
      end

    def valid_input(chosen_pistol, data)
        chosen_pistol.to_i <= data.length && chosen_pistol.to_i > 0
    end

    def show_info_for(chosen_pistol)
        weapon = @weapons[chosen_pistol - 1]
        weapon.get_weapon_info
        puts weapon.name
        weapon.weapon_info.each do |info|
         puts "- #{i}"
        end
     end

    def get_weapon_info(weapon)
        puts weapon.name
        weapon.weapon_info.each {|i| puts "- #{i}"}
    end


    def goodbye
        puts "Thanks for using my reference tool!"
    end

end