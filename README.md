<html>
  
  <h1 align="center">shcrypt.sh</h1>
  <p align="center">shcrypt.sh is a library for shell scripts made in the POSIX standard to be as portable as possible.</p>
  <hr>
  <h3>available functions:</h3>
  <p>hash functions (gnu coreutils):</p>
    <ul>
      <li>md5</li>
      <li>sha1</li>
      <li>sha224</li>
      <li>sha256</li>
      <li>sha384</li>
      <li>sha512</li>
      <li>blake2b</li>
    </ul>
  <p>Generators:</p>
  <ul>
    <li>Random text</li>
    <li>Random number</li>
    <li>Random UTF-8</li>
  </ul>
  <hr>
  <pre><code><p>HASHES:

[ -t | --text ] = for text
[ -f | --file ] = for file
    
_shcrypt_md5    [-t|-f] 'ARG'
_shcrypt_sha1   [-t|-f] 'ARG'
_shcrypt_sha224 [-t|-f] 'ARG'
_shcrypt_sha256 [-t|-f] 'ARG'
_shcrypt_sha384 [-t|-f] 'ARG'
_shcrypt_sha512 [-t|-f] 'ARG'
_shcrypt_b2     [-t|-f] 'ARG'</p></code></pre>
</html>
