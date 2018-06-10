class Lesson < ApplicationRecord
  belongs_to :store
  belongs_to :lesson_kind
  has_many :favorites #, dependent: :destroy

  def self.get_lesson
    
    stores = Store.all
    
    stores.each do |store|
    
      agent = Mechanize.new
      page = agent.get(store.schedule_url)
  
      
      str = page.search("script").to_s
      
      #jsonデータに整形
      str = "{\"lessons\": " + str.slice(str.index("var slots")+12,str.index("function search(nameKey, myArray)") - str.index("var slots")-41) + "}]}"
      str = str.tr("\'","\"")
      str = str.chomp
      
      hash = JSON.parse(str)
  
      lessons = []
        
      parsed = hash['lessons']
      parsed.each do |lesson|
  
        lesson_kind = LessonKind.create_with(kind_id: 9999).find_or_create_by(name: lesson['class-name'].to_s)
  
        lessons << Lesson.new(
          store_id: store.id, 
          lesson_kind_id: lesson_kind.id.to_i, 
          year_month: '20180401', 
          day_of_week: lesson['day'].to_s, 
          instractor: lesson['instructor'].to_s,
          studio: lesson['studio-code'].to_s,
          start_at: Time.parse(lesson['time-start']),
          end_at: Time.parse(lesson['time-end'])
        )
      end

      Lesson.import lessons
      
    end
  end
end

