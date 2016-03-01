# Chinacity

Get the latest China cities data from [official site](http://www.stats.gov.cn/tjsj/tjbz/xzqhdm/).

## China city data file download links

* [areas.csv](https://github.com/wongyouth/chinacity/raw/master/areas.csv)
* [areas.json](https://github.com/wongyouth/chinacity/raw/master/json.csv)

Or you can create these data by your own, check out [Usage](https://github.com/wongyouth/chinacity#usage).

## Feature

* A command line tool
* Get the latest China cities data from Official site
* Outputs format support JSON and CSV
* Option to output first charactors of every word in pinyin as short name of cities, like `BJS` for `北京市`
* JSON format is compatible with city data of [china_city](https://github.com/saberma/china_city) gem

## Installation

Add this line to your application's Gemfile:

    gem 'chinacity'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install chinacity

## Usage

### Outputs China cities data in JSON format.

The format is totally compatible with <https://github.com/saberma/china_city/blob/master/db/areas.json>

    $ chinacity > areas.json


The result looks like

```
{
  "province": [
    {
      "id": "110000",
      "text": "北京市"
    },
    {
      "id": "120000",
      "text": "天津市"
    },
    ...
  ],
  "city": [
    {
      "id": "110100",
      "text": "市辖区"
    },
    {
      "id": "110200",
      "text": "县"
    },
    ...
  ],
  "district": [
    {
      "id": "110101",
      "text": "东城区"
    },
    {
      "id": "110102",
      "text": "西城区"
    },
    ...
  ]
}
```

### Outputs China cities data with short name.

    $ chinacity -s > areas.json

The result looks like

```
{
  "province": [
    {
      "id": "110000",
      "text": "北京市",
      "short": "BJS"
    },
    {
      "id": "120000",
      "text": "天津市",
      "short": "TJS"
    },
    {
      "id": "130000",
      "text": "河北省",
      "short": "HBS"
    },
    ...
  ],
  "city": [...],
  "district": [...]
}

```

### Outputs China cities data in CSV format.

    $ chinacity -sc > areas.csv

The result looks like

```
id,名称,缩写,层级
110000,北京市,BJS,1
110100,市辖区,SXQ,2
110101,东城区,DCQ,3
110102,西城区,XCQ,3
110105,朝阳区,ZYQ,3
...
```

### Full options

    $ chinacity --help

    Usage: chinacity [options]

    options:
        -s, --short                      Short name, first charactors of every word in pinyin
        -c, --csv                        Outputs in CSV format
        -m, --minimize                   Trim spaces to minimize JSON data
        -H, --headless                   Skip outputing the head line for CSV

## Dependencies

As `chinacity` use `csv` library, only Ruby 1.9+ is supported.

## Contributing

1. Fork it ( http://github.com/<my-github-username>/chinacity/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
