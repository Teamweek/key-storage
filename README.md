# Key-Storage

## Features
* Uses **node.js require** style modules
* For **browser**, not node.js
* Uses localStorage when possible
* Uses cookies if localStorage is not available
* Simple get, set and remove API

## Installation
```sh
npm install key-storage
```

## Usage
```javascript
var storage = require('key-storage');

storage.set('key', 'value');
storage.get('key'); //=> 'value'
storage.remove('key');
```
