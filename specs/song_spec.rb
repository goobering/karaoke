require 'Minitest/autorun'
require 'Minitest/rg'

require_relative '../song.rb'

class TestSong < Minitest::Test

def setup()
    @test_song = Song.new("Title_1")
end

def test_create_song()
    assert_equal(true, @test_song.is_a?(Song))
end 

def test_get_song_title()
    assert_equal("Title_1", @test_song.title())
end

end