class ScriptProcessor
  def self.process(script_string)
    doc = Nokogiri::HTML(script_string)

    paras = doc.css('p')

    processed_paras = []

    counter = 0

    paras.each do |para|
      counter +=1
      if para.text.match "Scene:"
        processed_paras << {:type => :scene, :content => para.text.to_s.gsub(/\[|\]/,"").gsub("Scene:", "").strip}
      elsif para.text[0] == '['
        processed_paras << {:type => :direction, :content => para.text.to_s.gsub(/\[|\]/,"")}
      elsif para.css("b").any?
        character = para.css('b').text.gsub(":", "").strip
        text = para.inner_text.gsub("#{character}:", "").strip
        processed_paras << {:type => :line, :character => character, :content => text}
      end
    end
  end
end
