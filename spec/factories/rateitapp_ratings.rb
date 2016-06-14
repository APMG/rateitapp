FactoryGirl.define do
  factory :rateitapp_rating, class: 'Rateitapp::Rating' do
    factory :rating do
      factory :song_rating do
        ratee_type 'jukebox_song'
      end
    end
  end
end
