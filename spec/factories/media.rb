FactoryGirl.define do 
  factory :medium do
    work
    caption "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec a diam lectus. Sed sit amet ipsum mauris."
    featured false

    factory :image_medium, class: "ImageMedium" do
      image_attachment "file location"
      content_type "image"
    end
    factory :audio_medium, class: "AudioMedium" do
      audio_attachment "file location"
      content_type "audio"
    end
    factory :video_medium, class: "VideoMedium" do
      video_id "https://www.youtube.com/watch?v=eFpea-sYk8w"
      content_type "video"
    end
  end
end