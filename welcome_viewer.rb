require_relative 'room.rb'

class WelcomeViewer

def initialize()

end

def get_guest_first_name()
    first_name = nil
    until !(first_name.to_s().empty?()) do
        print "Please enter your first name: "
        first_name = gets.chomp()
    end
    return first_name
end

def get_guest_last_name()
    # Sourced from: https://stackoverflow.com/a/22345282/1095741
     last_name = nil
    until !(last_name.to_s().empty?()) do
        print "Please enter your last name: "
        last_name = gets.chomp()
    end
    return last_name
end

def get_guest_balance()
    # Sourced from: https://stackoverflow.com/a/22345282/1095741
    balance = nil
    until balance.is_a?(Fixnum) do
        print "How much credit would you like to add to your account? "
        balance = Integer(gets) rescue nil
    end
    return balance
end

def get_guest_favourite_song()
    response = nil
    until ((response.to_s() == 'y') || (response.to_s() == 'n')) do
        print "Do you have a favourite song (y or n)? "
        response = gets.chomp()
    end
    
    # No favourite song - return nil
    return nil if response == 'n'
    
    # Has a favourite song
    favourite = nil
    until !(favourite.to_s().empty?()) do
        print "Please enter the title of your favourite song: "
      favourite = gets.chomp()
    end
    return favourite
end

def room_menu(rooms)
    room_nums = rooms.map { |r| r.number().to_s() }
    
    response = nil
    until (room_nums.include?(response) || response == ((room_nums.count() + 1).to_s())) do
        puts "Please select a room number: "
        for i in 1..room_nums.count() do
            puts "#{i}: Room #{i}"
        end
        puts "#{room_nums.count() + 1}: Leave the club."
        print "> "
        response = gets.chomp()
    end
    return response.to_i()
end

def not_enough_capacity()
    puts "Sorry - that room's full! Please choose another."
end

def not_enough_funds()
    puts "Sorry - you don't have enough funds to enter that room."
end

end