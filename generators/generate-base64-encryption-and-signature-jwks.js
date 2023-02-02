const jose = require('node-jose');
const keyStore = jose.JWK.createKeyStore();

const promises = [];

// In order to be FAPI compliand we have to encrypt JWTs with alg RSA-OAEP and enc A256CBC-HS512.
promises.push(keyStore.generate('RSA', 2048, { alg: 'RSA-OAEP', enc: 'A256CBC-HS512', use: 'enc' }));

// In order to be FAPI compliand we have to sign JWTs with alg PS256.
promises.push(keyStore.generate('RSA', 2048, { alg: 'PS256', use: 'sig' }));

Promise.all(promises).then(_results => {
  const includePrivateKeys = true;
  const stringifiedJWKs = JSON.stringify(keyStore.toJSON(includePrivateKeys));
  const base64JWKs = jose.util.base64url.encode(stringifiedJWKs);

  console.log('Base64 Encoded JWKs:', base64JWKs);
});
