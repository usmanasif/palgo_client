module OmniAuth
  module Strategies
    class Palgo < OmniAuth::Strategies::OAuth2
      option :name, :palgo

      option :client_options, {
        site: "http://localhost:3000",
        authorize_path: "/oauth/authorize"
      }

      uid do
        raw_info["id"] if raw_info.present?
      end

      info do
        {name: raw_info["full_name"]} if raw_info.present?
      end

      def raw_info
        @raw_info ||= access_token.get('/users/show').parsed if access_token.present?
      end
    end
  end
end