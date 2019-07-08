module Filterable
  extend ActiveSupport::Concern

  included do
    @search_scopes ||= []
  end

  module ClassMethods
    attr_reader :search_scopes

    def search_scope(name, *args)
      scope name, *args
      @search_scopes << name
    end

    def filter(params)
      results = self.all
      params.each do |key, value|
        results = results.public_send(key, value) if value.present?
      end
      results
    end
  end
end
