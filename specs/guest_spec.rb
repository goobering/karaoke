require 'Minitest/autorun'
require 'Minitest/rg'

require_relative '../guest.rb'
require_relative '../room.rb'

class TestGuest < Minitest::Test

def setup()
    @test_room = Room.new(1, 10, 20)
    @test_guest = Guest.new("First_1", "Last_1", 100)
    # Check the guest into the room (subtracts 20 from balance)
    @test_room.check_in(@test_guest)
end

def test_create_guest()
    assert_equal(true, @test_guest.is_a?(Guest))
end

def test_get_guest_first_name()
    assert_equal("First_1", @test_guest.first_name())
end

def test_get_guest_last_name()
    assert_equal("Last_1", @test_guest.last_name())
end

def test_get_guest_room_num()
    assert_equal(1, @test_guest.room_num())
end

def test_get_guest_balance()
    assert_equal(80, @test_guest.balance())
end

def test_get_guest_favourite_song()
    @test_guest.set_favourite_song("Favourite_song_1")
    assert_equal("Favourite_song_1", @test_guest.favourite_song())
end

def test_set_room_num()
    @test_guest.set_room_num(20)
    assert_equal(20, @test_guest.room_num())
end

def test_add_to_balance()
    @test_guest.add_to_balance(20)
    assert_equal(100, @test_guest.balance())
end

end