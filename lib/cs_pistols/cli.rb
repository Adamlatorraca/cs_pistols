class CsPistols::CLI
    def call
        puts "Welcome to Adam's CS:GO Pistols Reference!"
        get_weapons
        start
    end
    
    def start
        list_weapons
        puts ""
        puts "What pistol would you like to see? Enter the number next to the weapon!"
        input = gets.strip.to_i
        if valid_input?(input)
            user_input = get_user_weapon(input)
            get_weapon_info(user_input)
            print_weapon(user_input)
        else
            start
        end
        up_next
    end

    def get_weapons
        weapons = CsPistols::Scraper.scrape_weapons
    end

    def list_weapons
        CsPistols::Weapon.all.each.with_index(1) do |weapon, index|
            puts "#{index}. #{weapon.name}"
        end
    end

    def get_user_weapon(input)
        CsPistols::Weapon.all[input - 1] if valid_input?(input)
    end

    def valid_input?(input)
        input.to_i.between?(1,8)
    end

    def get_weapon_info(weapon)
        CsPistols::Scraper.scrape_weapon_page(weapon)
    end

    def print_weapon(weapon)
        puts ""
        puts "------ #{weapon.name} - #{weapon.side} ------"
        puts ""
        puts "Price:                    #{weapon.price}"
        puts "Kill Reward:              #{weapon.kill_reward}"
        puts "Ammo Capacity:            #{weapon.ammo_capacity}"
        puts "Reload Time:              #{weapon.reload_time}"
        puts "Movement Speed:           #{weapon.movement_speed}"
        puts "Firing Mode:              #{weapon.firing_mode}"
        puts ""
        puts "----------------------------------------"
    end

    def up_next
        puts "Would you like to select another weapon? Enter 'Y' or 'N'"
        input = gets.strip.downcase
            if input == "y"
                puts ""
                start
            elsif input == "n"
                puts ""
                goodbye
                exit
            else
                puts ""
                puts "I don't understand that answer, try again!"
                up_next
            end
    end
    
    def goodbye
        puts "Thanks for using my reference!"
    end

end