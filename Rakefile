desc "Push to S3"
task :deploy do
  system("bin/jekyll build")
  system("bin/s3_website push")
end
