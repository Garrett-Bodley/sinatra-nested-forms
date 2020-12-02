require './environment'

module FormsLab
  class App < Sinatra::Base

    # code other routes/actions here
    get '/' do
      erb :root
    end

    get '/new' do
      erb :"pirates/new"
    end

    post '/pirates' do
      # pirate_hash = Hash[params[:pirate].map{|key, value| [key.gsub(/:/, '').to_sym, value]}].tap{|h| h.delete(:ships)}
      # ship1_hash = Hash[params[:pirate]["ships"][0].map{|key, value| [key.gsub(/:/, '').to_sym, value]}]
      # ship2_hash = Hash[params[:pirate]["ships"][1].map{|key, value| [key.gsub(/:/, '').to_sym, value]}]

      @pirate = Pirate.new(params[:pirate])
      
      params[:pirate][:ships].each do |details|
        Ship.new(details)
      end
      @ships = Ship.all
      erb :"pirates/show"
    end

  end
end
