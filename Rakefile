task default: :run

namespace :assets do
  desc 'Run bin/jekyll build. Used by Heroku during deploy.'
  task :precompile do
    sh "bin/jekyll build"
  end
end

desc "Run the site locally"
task :run do
  exec "bin/jekyll serve --watch --host 0.0.0.0"
end
