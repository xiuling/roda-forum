require 'roda'
require 'pry'
require 'slim'
require 'logger'
require_relative 'services/db_service'

class Forum < Roda
  file = File.open("#{File.expand_path(File.dirname(__FILE__))}/logs/app.log", File::WRONLY | File::APPEND | File::CREAT)
  file.sync = true
  Log = Logger.new(file)

  plugin :flash
  plugin :sessions, secret: 'a10a7e0516b8ca32cec85494b61d5294e6dd5df0ce8467894001002f1a33248d', key: 'ssid'
  plugin :public
  plugin :all_verbs
  plugin :sinatra_helpers
  plugin :render, engine: :slim
  plugin :status_handler
  plugin :multi_route
  plugin :view_options
  Dir['./routes/*.rb'].each {|f| require f}

  route do |r|
    r.public
    @nickname = session['user'] if session['user']
    r.root do
      @title = 'hello'
      view 'index'
    end
    r.is 'reg' do
      r.get do
        @title = 'regster'
        view 'reg'
      end
      r.post do
        r.params['username'] ||= ''
        r.params['username'] ||= ''
        r.params['password'] ||= ''
        r.params['username'].strip!
        r.params['email'].strip!
        r.params['password'].strip!
        if !r.params['username'].empty? && !r.params['password'].empty? && !r.params['email'].empty?
          user = DbService.reg(r.params['username'], r.params['password'], r.params['email'])
          if !user.nil?
            r.redirect '/login'
          end
        end
        r.redirect '/reg'
      end
    end
    r.is 'login' do
      r.get do
        @title = 'login'
        view 'login'
      end
      r.post do
        r.params['username'] ||= ''
        r.params['password'] ||= ''
        r.params['username'].strip!
        r.params['password'].strip!
        if !r.params['username'].empty? && !r.params['password'].empty?
          user = DbService.login(r.params['username'], r.params['password'])
          if !user.nil?
            session['user'] = r.params['username']
            r.redirect '/'
          end
        end
        r.redirect '/login'
      end
    end
    r.multi_route
  end

  Dir['./helpers/*.rb'].each {|f| require f}
end
