# frozen_string_literal: true

module Rateitapp
  # Install required configuration files.
  class InstallGenerator < Rails::Generators::Base
    # rubocop:disable Metrics/MethodLength, Style/AlignParameters
    def create_initializer_file
      create_file 'config/initializers/rateitapp.rb',
"# frozen_string_literal: true
Rateitapp.plugin_manager.add(PlaylistPlugin.new('name_of_your_plugin'))
Rateitapp.provider_domain = Rails.configuration.oauth_domain"
    end

    def create_playlist_plugin_model
      create_file 'app/models/playlist_plugin.rb',
"# frozen_string_literal: true
class PlaylistPlugin
  def initialize(service_name)
    @service_name = service_name
  end
  def name
    @service_name + '-song' # ratable_type
  end
  def valid?(rating)
    uri = URI('http://' + Rails.configuration.playlist_domain + '/api/v1/services/' + @service_name + '/songs/' + rating.ratable_id)
    res = Net::HTTP.get_response(uri)
    if res.is_a?(Net::HTTPSuccess)
      true
    else
      rating.errors.add(:ratable_id, 'ID is not valid')
      false
    end
  end
end"
    end
  end
end
