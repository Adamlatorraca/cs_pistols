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
            url = w.css("span > a").attr("href").text
            CsPistols::Weapon.new(name, url)
        end
    end

    def self.scrape_weapon_info(weapon)
        url = "https://liquipedia.net/counterstrike#{weapon.url}"
        doc = Nokogiri::HTML(open(url))
        divs = doc.css("#mw-content-text > div > div:nth-child(3) > div.fo-nttax-infobox-wrapper.infobox-csgo > div.fo-nttax-infobox.wiki-bordercolor-light")
        divs.each do |div|
            info = div.text.strip
            weapon.weapon_info << info
        end
    end
end