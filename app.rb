require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require('./lib/define')
require('pry')
also_reload('lib/**/*.rb')

get('/') do
  @words = Word.all
  erb(:words)
end

get('/words') do
  @words = Word.all
  erb(:words)
end