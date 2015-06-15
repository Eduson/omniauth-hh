require 'omniauth/strategies/oauth2'
require 'multi_json'

module OmniAuth
  module Strategies
    class HH < OmniAuth::Strategies::OAuth2
      option :name, 'hh'

      option :client_options, { site: 'https://api.hh.ru',
                                authorize_url: 'https://hh.ru/oauth/authorize',
                                token_url: 'https://hh.ru/oauth/token',
                                headers: { 'User-Agent' => "OmniAuth - HH/#{ OmniAuth::HH::VERSION } (marchi.martius@gmail.com)" } }

      option access_token_options: { param_name: 'code' }

      uid { raw_info['id'] }

      info do
        {
          name: "#{ raw_info['first_name'] } #{ raw_info['last_name'] }",
          email: raw_info['email'],
          first_name: raw_info['first_name'],
          last_name: raw_info['last_name'],
          middle_name: raw_info['middle_name'],
          image: image_url,
          urls: { resume: raw_info['resumes_url'],
                  negotiations: raw_info['negotiations_url'] }
        }
      end

      extra do
        skip_info? ? {} : { raw_info: raw_info }
      end

      def raw_info
        @raw_info ||= MultiJson.load(access_token.get('/me').body)
      end

      private

      def photos_info
        @_photos_info ||= MultiJson.load(access_token.get('/artifacts/photo'))
      end

      def image_url
        photos_info['items'].first['small'] if photos_info['items'].any?
      end
    end
  end
end

OmniAuth.config.add_camelization 'hh', 'HH'
