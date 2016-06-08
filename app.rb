require 'sinatra'
require 'sinatra/reloader'
require 'active_record'

ActiveRecord::Base.establish_connection(
 adapter: 'postgresql',
 database: 'notes_development',
 username: 'postgres',
 password: 'postgres'
)

class Note < ActiveRecord::Base

end

get '/' do
  erb :index
end

get '/notes' do
  content_type :json
  @notes = Note.all
  return @notes.to_json
end

post '/notes' do
  #recieve  params with text & category
  content_type :json
  note = Note.create(params)
  return note.to_json
end

patch '/notes/:id' do

end

delete '/notes/:id' do
  Note.destroy(params[:id])
  return 204
end
