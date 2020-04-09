# jekyll-scryfall
A [jekyll](https://jekyllrb.com/) plugin to fetch Magic: The Gathering card images from the [Scryfall API](https://scryfall.com/docs/api).

## Installation

Install httparty:

```
npm install httparty
```

Add `jekyll-scryfall.rb` to your `plugins` folder.

## Usage

You can fetch a specific card from Scryfall using the following custom tag:

```
{% card Birds of Paradise %}
```

Which will render:

```
<img alt="" img src="" />
```
