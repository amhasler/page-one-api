require 'net/http'
require "#{Rails.root.join('db')}/utility"

module ParseCollectionCSV
  def self.parse_collection(author, resources, dir)
    collection_file = File.open(File.join(dir, 'collection.csv'))

    # Move to beginning of the data
    move_to("INFORMATION", collection_file)

    # Get the collection information
    information = move_to("WORK", collection_file)
    collection = Collection.new(user:author)
    number_works = 0
    CSV.parse(information, headers: true, converters: :all) do |row|
      # Collection title
      collection.title = row["title"]
      # Number of works
      number_works = row["number_works"]
    end

    # Save the collection
    collection.save!

    # Works
    number_works.times do |i|
      # Chapter
      work_information = move_to("MEDIA", collection_file)
      work = Work.create(collection: collection)

      CSV.parse(work_information, headers: true, converters: :all) do |row|
        work.title = row["title"]
        work.place = row["place"]
        work.date = row["date"]
        work.circa = row["circa"]
      end

      work_media = move_to("RESOURCES", collection_file)

      CSV.parse(work_media, headers: true, converters: :all) do |row|

        # Write parse for media here when adding media

      end

      if i == number_works - 1
        # Move to the end of file if we've reached the end of the collection
        work_resources = move_to("EOF", collection_file)
      else
        work_resources = move_to("WORK", collection_file)
      end

      CSV.parse(work_resources, headers: true, converters: :all) do |row|

        # Parse resources when added

      end
      # Save the work
      work.save!
    end
    
    return collection
  end

  def self.parse_resources(dir)
    resources = {}
    CSV.foreach(File.join(dir, 'resources.csv'), headers: true, converters: :all) do |row|
      id = row["id"]
      resources[id] = {
        type: row["type"],
        title: row["title"],
        url: row["resource"]
      }
    end
    resources
  end

  # Moves the file until it finds the string 's', and returns what it finds in between 
  def self.move_to(s, file)
    buf = ""
    while (line = file.gets) do
      begin
        line_csv = CSV.parse(line)[0]
      rescue CSV::MalformedCSVError
        pp "Malformed CSV line. Aborting..."
        pp line
        exit
      end
      break if line_csv[0] == s
      buf += line
    end
    return buf
  end


  def self.save_image_on_item(item, image_id, timeline_resources, dir)
    image_url = timeline_resources[image_id][:url]
    image_title = timeline_resources[image_id][:title]
    image = Utility::save_and_get_remote_resource(image_url, image_title, dir)
    item.image = image
    item.image_caption = image_title
  end

  def self.save_audio_on_item(item, audio_id, timeline_resources, dir)
    audio_url = timeline_resources[audio_id][:url]
    audio_title = timeline_resources[audio_id][:title]
    audio = Utility::save_and_get_remote_resource(audio_url, audio_title, dir)
    item.audio_attachment = audio
    item.audio_caption = audio_title
  end

  # Converts 's' to Handlebars with components that are used in the HstryEd application.
  # {{image ID}} becomes {{lightbox-image imageSrc="IMAGE_PATH" imageThumbSrc="IMAGE_THUMB_PATH" imageCaption="IMAGE_TITLE"}}
  # {{video ID}} becomes VIDEO_EMBED_CODE
  def self.convert_to_handlebars(s, timeline_resources, dir)
    # {{image ID}}
    while match = /{{image (?<image_id>\d*)/.match(s)
      # Get all the image data
      image_id = match["image_id"].to_i
      uploader = ItemImageUploader.new
      image_url = timeline_resources[image_id][:url]
      image_title = timeline_resources[image_id][:title]
      # Store the resource
      image = Utility::save_and_get_remote_resource(image_url, image_title, dir)
      uploader.store!(image)

      # Replace the substring with a lightbox image
      s["{{image #{image_id}}}"] = "{{lightbox-image imageSrc=\"#{uploader.full.url}\" imageThumbSrc=\"#{uploader.thumb.url}\" imageCaption=\"#{image_title}\"}}"
    end

    # {{video ID}}
    while match = /{{video (?<video_id>\d*)/.match(s)
      # Get all the video data
      video_id = match["video_id"].to_i
      video = timeline_resources[video_id]

      # Replace the substring with a video embed
      s["{{video #{video_id}}}"] = "{{video-embed videoEmbedCode='#{video[:url]}'}}"
    end

    return s
  end

  def self.quote?(item_csv)
    return item_csv["type"] == "Text"
  end

  def self.has_resource?(item_csv)
    !item_csv["resource"].blank?
  end
end
