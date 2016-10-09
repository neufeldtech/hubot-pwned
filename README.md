hubot-pwned
================
[![npm version](https://badge.fury.io/js/hubot-pwned.svg)](https://badge.fury.io/js/hubot-pwned)

Hubot interface to the https://haveibeenpwned.com/ service.
## Installation


* Run the ```npm install``` command

```
npm install hubot-pwned --save
```

* Add **hubot-pwned** to the array in your external-scripts.json file.

```
[
  "hubot-pwned"
]
```

## Usage

```
bin/hubot

hubot> has foo@bar.com been pwned?
Yes, foo@bar.com has been pwned:
myspace.com
```
