# lita-genius

[![Build Status](https://travis-ci.org/tristaneuan/lita-genius.png?branch=master)](https://travis-ci.org/tristaneuan/lita-genius)
[![Coverage Status](https://coveralls.io/repos/tristaneuan/lita-genius/badge.png)](https://coveralls.io/r/tristaneuan/lita-genius)

**lita-genius** is a handler for [Lita](https://github.com/jimmycuadra/lita) that returns requested songs from Genius (formerly known as Rap Genius).

## Installation

Add lita-genius to your Lita instance's Gemfile:

``` ruby
gem "lita-genius"
```

## Usage

Using the `genius` command will return the top Genius result for your query. Song titles and lyrics are both valid types of search strings.
```
<me>   lita: genius weeknd montreal
<lita> A sample from “Laisse Tomber Les Filles” originally performed by France Gall.
<lita> The Weeknd - Montreal | http://genius.com/songs/61962

<me>   lita: genius runnin through the 6 with my woes
<lita> Drake first used this moniker in “Jodeci Freestyle” — a single released in the lead-up to his album Nothing Was The Same.  On the album, the phrase is also referenced in “From Time”, during a monologue by Baka. Over time Drake has made the line a recurring theme in songs such as “0 to 100”. “Know yourself”/know thyself is also an aphorism that has been attributed to a number of ancient Greek sages, including Socrates, Heraclitus and Pythagoras. Care first about the greatest perfection of the soul. — Socrates
<lita> Drake - Know Yourself | http://genius.com/songs/703654
```

## License

[MIT](http://opensource.org/licenses/MIT)
