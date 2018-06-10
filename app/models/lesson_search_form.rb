class LessonSearchForm
  include ActiveModel::Model

  attr_accessor :instractor, :store_id, :day_of_weeks, :kind_id, :start_at_from, :start_at_end
    
  def search(page)

    @query = Lesson.joins(:store, :lesson_kind => :kind)
          .select("lesson_kinds.*, lessons.*,stores.name AS store_name, kinds.name AS kind_name")
          .order("day_of_week, start_at, store_id")
          .page(page)
          .per(15)


    @query = @query.where(['instractor LIKE ?', "%#{instractor}%"])
          
    if store_id.present?
      @query = @query.where(store_id: store_id)
    end     

    #@query = @query.where(store_id: store_id) if store_id.present?

    if kind_id.present?
      @query = @query.where(["lesson_kinds.kind_id = ?",kind_id])
    end         
  
    unless day_of_weeks.blank?
      @query = @query.where(day_of_week: day_of_weeks) 
    end   

    if start_at_from.present?
      @query = @query.where(["lessons.start_at >= ?",Time.parse(start_at_from)])
    end   

    if start_at_end.present?
      @query = @query.where(["lessons.start_at <= ?",Time.parse(start_at_end)])
    end   
    
    @query
  end
    
end