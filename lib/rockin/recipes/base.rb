Capistrano::Configuration.instance(:must_exist).load do
  
  def template(from, to)
    erb = File.read(File.expand_path("../templates/#{from}", __FILE__))
    put ERB.new(erb).result(binding), to
  end

  def set_default(name, *args, &block)
    set(name, *args, &block) unless exists?(name)
  end
  
  set_default(:database, "postgresql")
  set_default(:timezone, true)
  namespace :deploy do
    desc "Install everything onto the server"
    task :install do
      if timezone
        run "#{sudo} bash -c 'echo UTC > /etc/timezone'"
        run "#{sudo} cp /usr/share/zoneinfo/UTC /etc/localtime"
      end
      run "#{sudo} dpkg-reconfigure -f noninteractive tzdata"
      run "#{sudo} apt-get -y update"
      run "#{sudo} apt-get -y install python-software-properties"
      run "#{sudo} apt-get -y install libxml2-dev libxslt-dev libmagickwand-dev imagemagick build-essential"
    end
  end
end
