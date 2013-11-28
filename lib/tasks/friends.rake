namespace :friends do
  desc "Ingest all scripts in episode_scripts"
  task :ingest_all => :environment do
    files = Dir['episode_scripts/*.htm']
    files = files[0,10]
    files.each do |file|
      filename = File.basename(file).gsub(".htm", "")

      script = File.read(file)
      processed_script = ScriptProcessor.process(script)
      ScriptProcessor.create_episode_from_processed_scenes(processed_script, filename)
      print "."
    end
  end

  desc "Clear all"
  task :clear_all => :environment do
    Character.destroy_all
    Episode.destroy_all
  end
end
