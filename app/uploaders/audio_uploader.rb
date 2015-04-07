# encoding: utf-8

class AudioUploader < PageOneUploader

  def extension_white_list
    %w(mp3)
  end

end
