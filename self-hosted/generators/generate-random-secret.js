const crypto = require('crypto');

console.log(crypto.randomBytes(40).toString('hex'));