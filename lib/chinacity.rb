require 'optparse'
require "chinacity/version"
require "chinacity/cli"

options = {
  short: false,
  format: :json
}

parser = OptionParser.new do |opts|
  opts.banner = "Usage: chinacity [options]"
  opts.separator ""
  opts.separator "options:"

  opts.on('-s', '--short', 'Short name, First charactor of every word in pinyin') do
    options[:short] = true
  end

  opts.on('-c', '--csv', 'Output CSV format') do
    options[:format] = :csv
  end
end

parser.parse!

cli = Chinacity::Cli.new options
cli.start

