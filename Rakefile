require "bundler/gem_tasks"

desc "update areas.json, areas.csv with latest data"
task :update do
  system('./bin/chinacity > areas.json')
  system('./bin/chinacity -sc > areas.csv')
end
