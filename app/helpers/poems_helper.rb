module PoemsHelper
  def subject_text subject
    t("#{subject}")
  end
  
  def subject_collection
    Hash[APP_CONFIG['subjects'].map { |s| [ subject_text(s) , s]}] 
  end
end
