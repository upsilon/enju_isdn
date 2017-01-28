module EnjuIsdn
  module IsdnSearch
    def self.included(base)
      base.extend ClassMethods
    end

    module ClassMethods
      def import_isdn(isdn)
        raise EnjuIsdn::InvalidIsbn unless /^278\d{10}$/ =~ isdn

        doc = get_isdn_xml isdn
        manifestation = create_manifestation doc
        publishers = get_isdn_publisher doc
        manifestation.save
        manifestation.publishers << Agent.import_agents([publishers])

        manifestation
      end

      def get_isdn_xml(isdn)
        response = Faraday.get "https://isdn.jp/xml/#{isdn}"
        doc = Nokogiri::XML response.body
        doc.at_xpath '/xmlns:isdn/xmlns:item[@key=$isdn]', nil, { isdn: isdn }
      end

      def create_manifestation(doc)
        Manifestation.new do |m|
          m.original_title = doc.at_xpath('./xmlns:product-name').content
          m.title_transcription = doc.at_xpath('./xmlns:product-yomi').content
          m.pub_date = doc.at_xpath('./xmlns:issue-date').content
          m.price = doc.at_xpath('./xmlns:price').content
          m.dimensions = doc.at_xpath('./xmlns:product-size').content
        end
      end

      def get_isdn_publisher(doc)
        {
          full_name: doc.at_xpath('./xmlns:publisher-name').content,
          full_name_transcription: doc.at_xpath('./xmlns:publisher-yomi').content,
          agent_identifier: doc.at_xpath('./xmlns:publisher-code').content,
        }
      end
    end

    class AlreadyImported < StandardError
    end
  end
end
