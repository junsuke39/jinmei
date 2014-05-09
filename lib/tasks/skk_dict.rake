namespace :skk_dict do
  task :import => :environment do
    Dict.transaction do
      Dict.delete_all
      open("#{Rails.root}/lib/SKK-JISYO.jinmei", encoding: "euc-jp") do |f|
        f.each do |line|
          next if line =~ /\A;;/
          next unless line =~ /(.+?) (.+)\n/
          hiragana = $1
          $2.split("/").each do |info|
            next if info.blank?
            kanji, desc = info.split(";")
            Dict.new(kanji: kanji, hiragana: hiragana, desc: desc).save
            p kanji
            p hiragana
            p desc
            p "--------------"
          end
        end
      end
      p "#{Dict.count} records"
    end
  end
end
