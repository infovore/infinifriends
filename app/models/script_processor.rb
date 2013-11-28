class ScriptProcessor
  def self.process(script_string)
    doc = Nokogiri::HTML(script_string)

    paras = doc.css('p')

    counter = 0
    state = nil
    scenes = []
    working_scene = {:lines => []}

    paras.each do |para|
      counter +=1
      if para.text.match "Scene:"
        if working_scene[:lines].any?
          scenes << working_scene
          working_scene = {:lines => []}
        end

        state = :scene
        working_scene[:title] = ScriptProcessor.tidy_scene_heading(para.text)
      elsif (state == :scene) && para.text[0] == '['
        working_scene[:lines] << {:type => :direction, :content => ScriptProcessor.tidy_direction(para.text)}
      elsif (state == :scene) && para.css("b").any?
        character = para.css('b').text.gsub(":", "").strip
        text = ScriptProcessor.tidy_line_for_character(para.inner_text, character)
        working_scene[:lines] << {:type => :line, :character => character, :content => text}
      end
    end

    scenes << working_scene

    scenes
  end

  def self.create_episode_from_processed_scenes(scenes, episode_name)

    ep = Episode.create(:title => episode_name)
    scenes.each_with_index do |scene, i|
      count = i+1
      Scene.create_from_processed_scene_for_episode_in_position(scene,ep,count)
    end
  end

  def self.tidy_scene_heading(text)
    text.to_s.gsub(/\[|\]/,"").gsub("Scene:", "").gsub(/\n/, " ").strip
  end

  def self.tidy_direction(text)
    text.to_s.gsub(/\[|\]/,"")
  end

  def self.tidy_line_for_character(text, character)
    text.gsub("#{character}:", "").gsub(/\n/, " ").strip
  end
end
