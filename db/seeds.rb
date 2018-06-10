require "csv"


CSV.foreach('db/stores_master.csv') do |row|
  Store.create(:club_id => 1, :schedule_url => row[0], :name => row[1])
end


CSV.foreach('db/kinds_master.csv') do |row|
  Kind.create(:name => row[0], :id => row[1])
end


CSV.foreach('db/lesson_kinds_master.csv') do |row|
  LessonKind.create(:name => row[0], :kind_id => row[1])
end


CSV.foreach('db/time_zone.csv') do |row|
  TimeZone.create(:time_value => row[0],:name => row[0])
end