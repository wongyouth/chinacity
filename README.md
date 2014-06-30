# Chinacity

Get the latest China cities data from [official site](http://www.stats.gov.cn/tjsj/tjbz/xzqhdm/).

Output is supporting JSON and CSV format.
JSON format is totally compatible with the areas.json data of gem [china_city](https://github.com/saberma/china_city).
Also support output of the first charactor of every word in pinyin as short name of a city, like `BJS` for `北京市`.

## Installation

Add this line to your application's Gemfile:

    gem 'chinacity'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install chinacity

## Usage

### Output China cities data in JSON format.
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
```

### Output China cities data with short name.

    $ chinacity -s > areas.json

The Result json looks like

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

### Output China cities data in CSV format.

    $ chinacity -sc > areas.csv

The result looks like

```
id, 名称, 缩写, 层级
110000, 北京市, BJS, 1
110100, 市辖区, SXQ, 2
110101, 东城区, DCQ, 3
110102, 西城区, XCQ, 3
110105, 朝阳区, ZYQ, 3
...
```

### Full options

    $ chinacity --help

    Usage: chinacity [options]

    options:
        -s, --short                      Short name, First charactor of every word in pinyin
        -c, --csv                        Output CSV format


## Contributing

1. Fork it ( http://github.com/<my-github-username>/chinacity/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
