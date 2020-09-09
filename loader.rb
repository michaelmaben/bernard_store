def load_all
  require "./src/json_file_loader.rb"
  Dir["./src/*.rb"].each {|file| load file }
end
