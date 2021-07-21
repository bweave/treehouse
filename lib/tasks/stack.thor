# vi: syntax=ruby
# vi: filetype=ruby

class Stack < Thor
  desc "build", "Build your Docker-ized Rails stack"
  def build
    IO.popen("docker-compose build") do |io|
      while (line = io.gets) do
        puts line
      end
    end
  end

  desc "start", "Start your Docker-ized Rails stack"
  method_option :build, default: false, type: :boolean, :desc => "Pass the --build option to docker-compose, default: --no-build"
  def start
    command = "docker-compose up"
    command += " --build" if options[:build]

    IO.popen(command) do |io|
      while (line = io.gets) do
        puts line
      end
    end
  end

  desc "stop", "Stop your Docker-ized Rails stack"
  def stop
    IO.popen("docker-compose down") do |io|
      while (line = io.gets) do
        puts line
      end
    end
  end

  desc "attach", "Attach to your app for binding.pry/byebug"
  def attach
    IO.popen("docker attach app") do |io|
      while (line = io.gets) do
        puts line
      end
    end
  end

  desc "exec COMMAND", "Execute a command in your stack, e.g. bin/rails c, default command: bash"
  def exec(command = "bash")
    IO.popen("docker run --rm app #{command}") do |io|
      while (line = io.gets) do
        puts line
      end
    end
  end
end
