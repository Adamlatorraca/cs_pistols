require 'nokogiri'
require 'open-uri'
require 'pry'

class CsPistols::Scraper
=begin    
    def self.scrape_weapon_names
        site = "https://csgo-stats.com/weapons"
        doc = Nokogiri::HTML(open(site))
        weapons = doc.css("div.row.allWeaponsContainer div.col-xs-4")
        weapons.each do |t|
            name = t.css("div.col-xs-12.weaponCardName").text
            CsPistols::Weapon.new(name)
        end
    end
=end

    def self.scrape_weapon_names
        site = "https://liquipedia.net/counterstrike/Portal:Weapons"
        doc = Nokogiri::HTML(open(site))
        weapon = doc.css("#mw-content-text > div > div.tabs-static.tabs-portal > div > div > div:nth-child(4) > div:nth-child(1)")
        weapon.each do |w|
            name = w.text
            link = w.attr("value")
            CsPistols::Weapon.new(name, link)
        end
    end
end