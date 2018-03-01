class CheckCard
  def self.call(params)
    original_text = params[:original_text].to_s.downcase.strip
    translated_text = params[:translated_text].to_s.downcase.strip
    if original_text.empty? || translated_text.empty? || original_text == translated_text
      false
    else
      true
    end
  end
end