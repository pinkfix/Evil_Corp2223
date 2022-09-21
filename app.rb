require 'slim'
require 'sinatra'
require 'sinatra/reloader'
require 'sqlite3'

get('/') do
  @dogs = [
    {
      name: "Fido",
      age: "7"
    },
    {
      name: "Snobben",
      age: "329"
    }
  ]
  slim(:info)
end

get('/evil_corp') do
  #Strunta i vad som händer på rad 21-24 så länge.
  db = SQLite3::Database.new("db/employees.db")
  db.results_as_hash = true #Få svar i strukturen [{},{},{}]
  @data = db.execute("SELECT * FROM employees")
  
  p @data

  slim(:evil_corp)
end