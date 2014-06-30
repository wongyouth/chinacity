# Chinacity

Get the lastest China cities data from official site.
Output is supporting json and csv format.
Json format is totally compatible with the areas.json data of gem `china_city`.

Also support output the short yinpin name of city name, like `BJS` for `北京市`.

## Installation

Add this line to your application's Gemfile:

    gem 'chinacity'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install chinacity

## Usage

Check out the command help with

    $ chinacity --help

    Usage: chinacity [options]

    options:
        -s, --short                      Short name, First charactor of every word in pinyin
        -c, --csv                        Output CSV format

Output China cities data to a json file. The format is totally compatible with https://github.com/saberma/china_city/blob/master/db/areas.json

    $ chinacity > areas.json

## Contributing

1. Fork it ( http://github.com/<my-github-username>/chinacity/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
