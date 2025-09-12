require 'slim'
require 'sinatra'
require 'sinatra/reloader'
require 'sqlite3'

get('/evil_corp') do
  #Strunta i vad som händer på rad 8-10 så länge.
  db = SQLite3::Database.new("db/employees.db")
  db.results_as_hash = true #Få svar i strukturen [{},{},{}]
  @data = db.execute("SELECT * FROM employees")
  
  p @data
  
  slim(:evil_corp)
end