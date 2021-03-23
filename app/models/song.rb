class Song < ActiveRecord::Base
  belongs_to :artist 
  belongs_to :genre 
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    self.genre ? self.genre.name : nil
  end

  def song_notes=(song_notes)
    song_notes.each do |note|
      if note != ""
        self.notes.build(content: note)
      end
    end
  end

  def song_notes
    self.notes.map {|note| note.content}
  end

end


# .build: Returns a new object of the collection type that has been instantiated with attributes and linked to this object, but have not yet been saved. 
# You can pass an array of attributes hashes, this will return an array with the new objects.

#.create: Returns a new object of the collection type that has been instantiated with attributes, 
# linked to this object and that has already been saved (if it passes the validations).