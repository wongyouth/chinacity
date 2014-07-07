# encoding: utf-8
require 'nokogiri'
require 'chinese_pinyin'
require 'json'
require 'httparty'
require 'csv'

module Chinacity
  HOST = 'http://www.stats.gov.cn'
  LIST_PATH = '/tjsj/tjbz/xzqhdm/'
  LIST_URL = HOST + LIST_PATH

  class Cli
    def initialize options
      @short    = options[:short]
      @foramt   = options[:format]
      @minimize = options[:minimize]
      @headless = options[:headless]
    end

    def start
      doc = Nokogiri::HTML(get_data)
      get_cities(doc)

      add_short_name if @short

      @foramt == :json ? output_json : output_csv
    end

    private
      def get_data
        # puts LIST_URL

        # get newest city url
        data = HTTParty.get(LIST_URL).body
        doc = Nokogiri::HTML data
        url = LIST_URL + doc.css('.center_list a')[0][:href]
        # puts url

        # get newest city data
        HTTParty.get(url).body
      end

      def get_cities(doc)
        @cities = doc.css('p.MsoNormal').map do |data|
          id, text = data.text.gsub(/[[:space:]]+/, ' ').split

          {id: id, text: text} if id
        end.compact
      end

      def add_short_name
        @cities.each do |city|
          # puts city
          city[:short] = Pinyin.t(city[:text]).split.map{|w|w[0]}.join.upcase
        end

        self
      end

      def nested_cities
        pretty = {}

        @cities.each do |city|
          if city[:id].end_with? '0000'
            pretty[:province] ||= []
            pretty[:province] << city
          elsif city[:id].end_with? '00'
            pretty[:city] ||= []
            pretty[:city] << city
          else
            pretty[:district] ||= []
            pretty[:district] << city
          end
        end

        pretty
      end

      def output_json
        if @minimize
          STDOUT.write JSON.generate(nested_cities)
        else
          STDOUT.write JSON.pretty_generate(nested_cities)
        end
      end

      def output_csv
        CSV do |csv_out|
          unless @headless
            list = @short ? ["id", "名称", "缩写", "层级"] : ["id", "名称", "层级"]
            csv_out << list
          end

          @cities.map do |city|
            level = if city[:id].end_with? '0000'
              1
            elsif city[:id].end_with? '00'
              2
            else
              3
            end

            list = @short ? [city[:id], city[:text], city[:short], level] : [city[:id], city[:text], level]

            csv_out << list
          end
        end
      end
  end
end
