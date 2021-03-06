require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do
       erb :index
     end

     post '/teams' do
       @team = Team.new(name: params[:team][:name], motto: params[:team][:motto])
       params[:team][:heroes].each do |hero_data|
         SuperHero.new(hero_data)
       end

       @heroes = SuperHero.all
       erb :team
     end
end
