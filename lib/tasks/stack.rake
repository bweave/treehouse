namespace :stack do
  desc "Build your Docker-ized Rails stack"
  task build: :environment do
    IO.popen("docker-compose build") do |io|
      while (line = io.gets) do
        puts line
      end
    end
  end

  desc "Start your Docker-ized Rails stack"
  task start: :environment do
    IO.popen("docker-compose up") do |io|
      while (line = io.gets) do
        puts line
      end
    end
  end

  desc "Stop your Docker-ized Rails stack"
  task stop: :environment do
    IO.popen("docker-compose down") do |io|
      while (line = io.gets) do
        puts line
      end
    end
  end

  desc "Attach to your app for binding.pry/byebug"
  task attach: :environment do
    IO.popen("docker attach app") do |io|
      while (line = io.gets) do
        puts line
      end
    end
  end

  desc "Run commands in your stack"
  task run: :environment do
  end
end
