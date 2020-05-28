require 'nokogiri'
require 'open-uri'
require 'pry'

class CsPistols::Scraper

    def self.scrape_weapons
        site = "https://liquipedia.net/counterstrike/Portal:Weapons"
        doc = Nokogiri::HTML(open(site))
        weapons = doc.css("#mw-content-text > div > div.tabs-static.tabs-portal > div > div > div:nth-child(4) > div:nth-child(1) > ul > li")
        weapons.each do |w|
            name = w.text
            url = w.css("span > a").attr("href")
            CsPistols::Weapon.new(name, url)
        end
    end

    def self.scrape_weapon_info(weapon)

    end
end