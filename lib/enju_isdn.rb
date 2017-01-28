require 'enju_isdn/engine'
require 'open-uri'
require 'enju_isdn/isdn_search'

module EnjuIsdn
  module ActsAsMethods
    def self.included(base)
      base.extend ClassMethods
    end

    module ClassMethods
      def enju_isdn_isdn_search
        include EnjuIsdn::IsdnSearch
      end
    end
  end

  class RecordNotFound < StandardError
  end

  class InvalidIsbn < StandardError
  end
end

ActiveRecord::Base.send :include, EnjuIsdn::ActsAsMethods
