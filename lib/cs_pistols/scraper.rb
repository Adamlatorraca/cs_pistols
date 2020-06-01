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
        CsPistols::Weapon.all.pop
        CsPistols::Weapon.all.delete_at(2)
    end

    def self.scrape_weapon_page(weapon)
        site = ("https://liquipedia.net#{weapon.url}")
        doc = Nokogiri::HTML(open(site))
        weapon.price = doc.css("#mw-content-text > div > div:nth-child(3) > div.fo-nttax-infobox-wrapper.infobox-csgo > div.fo-nttax-infobox.wiki-bordercolor-light > div:nth-child(5) > div:nth-child(2)").text
        weapon.kill_reward = doc.css("#mw-content-text > div > div:nth-child(3) > div.fo-nttax-infobox-wrapper.infobox-csgo > div.fo-nttax-infobox.wiki-bordercolor-light > div:nth-child(6) > div:nth-child(2)").text
        weapon.ammo_capacity = doc.css("#mw-content-text > div > div:nth-child(3) > div.fo-nttax-infobox-wrapper.infobox-csgo > div.fo-nttax-infobox.wiki-bordercolor-light > div:nth-child(7) > div:nth-child(2)").text
        weapon.reload_time = doc.css("#mw-content-text > div > div:nth-child(3) > div.fo-nttax-infobox-wrapper.infobox-csgo > div.fo-nttax-infobox.wiki-bordercolor-light > div:nth-child(8) > div:nth-child(2)").text
        weapon.movement_speed = doc.css("#mw-content-text > div > div:nth-child(3) > div.fo-nttax-infobox-wrapper.infobox-csgo > div.fo-nttax-infobox.wiki-bordercolor-light > div:nth-child(9) > div:nth-child(2)").text
        weapon.firing_mode = doc.css("#mw-content-text > div > div:nth-child(3) > div.fo-nttax-infobox-wrapper.infobox-csgo > div.fo-nttax-infobox.wiki-bordercolor-light > div:nth-child(10) > div:nth-child(2)").text
        weapon.side = doc.css("#mw-content-text > div > div:nth-child(3) > div.fo-nttax-infobox-wrapper.infobox-csgo > div.fo-nttax-infobox.wiki-bordercolor-light > div:nth-child(11) > div:nth-child(2) > a").text
    end
end