
require 'pry'


def GetAmountInArray(array, value)
    count = 0;
    array.each{|item| if item == value then count+=1 end}
    return count
end

def GetCountHash(array)
    new_hash = Hash.new
    array.each do |value|
        if !new_hash.include?(value) then
            new_hash[value] = GetAmountInArray(array, value)
        end
    end
    new_hash
end


class Song

    @@count = 0
    @@genres = Array.new
    @@artists = Array.new

    attr_reader :name, :artist, :genre

    def initialize(song_name, artist, genre)
        @name = song_name
        @artist = artist
        @genre = genre

        @@artists << artist
        @@genres << genre
        @@count += 1
    end

    def self.count
        @@count
    end

    def self.genres
        @@genres.uniq
    end

    def self.artists
        @@artists.uniq
    end

    def self.genre_count
        GetCountHash(@@genres)
    end

    def self.artist_count
        GetCountHash(@@artists)
    end
end
