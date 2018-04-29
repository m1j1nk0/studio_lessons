class Lesson < ApplicationRecord
  belongs_to :store
  belongs_to :lesson_kind
  
  
  
  def self.get_lesson
    
    agent = Mechanize.new
    page = agent.get("http://www.goldsgym.jp/shop/13121/schedule")

    
    aaa = page.search("script").to_s
    
    json = "{	\"aaa\": " + aaa.slice(aaa.index("var slots")+12,aaa.index("function search(nameKey, myArray)") - aaa.index("var slots")-41) + "}]}"
    bbb = json.tr("\'","\"")
    ddd = bbb.chomp
    
    ccc = JSON.parse(ddd)
    
    
    nya=""
    
    parsed = ccc['aaa']
    parsed.each do |music|
    nya += music['class-name'].to_s
    end
    
    return nya
  
  end
  
end
