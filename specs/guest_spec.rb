require 'Minitest/autorun'
require 'Minitest/rg'

require_relative '../guest.rb'

class TestGuest < Minitest::Test

def setup()
    @test_guest = Guest.new("First_1", "Last_1", 1, 100)
end

def test_create_guest()
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
    assert_equal(100, @test_guest.balance())
end

def test_get_guest_favourite_song()
    @test_guest.set_favourite_song("Favourite_song_1")
    assert_equal("Favourite_song_1", @test_guest.favourite_song())
end

end