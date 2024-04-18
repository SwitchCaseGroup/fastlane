module Fastlane
  module Actions
    class GooglePlayTrackReleasesAction < Action
      # Supply::Options.available_options keys that apply to this action.
      OPTIONS = [
        :package_name,
        :track,
        :key,
        :issuer,
        :json_key,
        :json_key_data,
        :root_url,
        :timeout
      ]

      def self.run(params)
        require 'supply'
        require 'supply/options'
        require 'supply/reader'

        Supply.config = params

        releases = Supply::Reader.new.track_releases || []
        return releases.compact
      end

      #####################################################
      # @!group Documentation
      #####################################################

      def self.description
        "Retrieves release names for a Google Play track"
      end

      def self.details
        "More information: [https://docs.fastlane.tools/actions/supply/](https://docs.fastlane.tools/actions/supply/)"
      end

      def self.available_options
        require 'supply'
        require 'supply/options'

        Supply::Options.available_options.select do |option|
          OPTIONS.include?(option.key)
        end
      end

      def self.output
      end

      def self.return_value
        "Array of objects representing the releases for the given Google Play track"
      end

      def self.authors
        ["raldred"]
      end

      def self.is_supported?(platform)
        platform == :android
      end

      def self.example_code
        [
          'google_play_track_releases'
        ]
      end

      def self.category
        :misc
      end
    end
  end
end
