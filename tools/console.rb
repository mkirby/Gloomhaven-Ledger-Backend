require_relative '../config/environment.rb'

def reload
    load 'config/environment.rb'
end

p "test"

Pry.start