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
          urls: { 'Resume' => resume_url }
        }.tap { |hash|
          if raw_info['is_employer']
            hash[:employer] = {
              company_name: raw_info['employer']['name'],
              vacancies: vacancies,
              employer_id: employer_id
            }
          end
        }
      end

      extra do
        skip_info? ? {} : { raw_info: raw_info }
      end

      def raw_info
        @raw_info ||= MultiJson.load(access_token.get('/me').body)
      rescue
        { 'items' => [] }
      end

      private

      def photos_info
        @_photos_info ||= MultiJson.load(access_token.get('/artifacts/photo').body)
      rescue
        { 'items' => [] }
      end

      def image_url
        photos_info['items'].first['medium'] if photos_info['items'].any?
      end

      def resumes_info
        @_resumes_info ||= MultiJson.load(access_token.get('/resumes/mine').body)
      rescue
        { 'items' => [] }
      end

      def resume_url
        resumes_info['items'].first['alternate_url'] if resumes_info['items'].any?
      end

      def vacancies
        @_vacancies = MultiJson.load(access_token.get("/employers/#{employer_id}/vacancies/active?manager_id=#{manager_id}").body)['items']
      end

      def employer_id
        raw_info['employer']['id']
      end

      def manager_id
        raw_info['employer']['manager_id']
      end
    end
  end
end

OmniAuth.config.add_camelization 'hh', 'HH'
