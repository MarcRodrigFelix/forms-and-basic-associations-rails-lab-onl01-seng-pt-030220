class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes


  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)  
  end

  def artist_name
    # self.artist ? self.artist.name : nil
    self.artist && self.artist.name
  end

  # def notes=(notes)
  #   notes.each do |nte|
  #     note = Note.find_or_create_by(content: nte)
  #     self.notes << note
  #   end
  # end

  def song_notes=(song_notes)
    song_notes.each do |song_note|
      unless song_note == ""
        self.notes.build(content: song_note)
      end
    end
  end

end
