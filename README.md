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
    <li>uuid</li>
    <li>Random text</li>
    <li>Random number</li>
    <li>Random UTF-8</li>
  </ul>
  
  <hr>
  <h3 align="center">Hash functions</h3>
  <pre><code><p>
[ -t | --text ] = for text
[ -f | --file ] = for file
    
_shcrypt_md5    [-t|-f] 'ARG'
_shcrypt_sha1   [-t|-f] 'ARG'
_shcrypt_sha224 [-t|-f] 'ARG'
_shcrypt_sha256 [-t|-f] 'ARG'
_shcrypt_sha384 [-t|-f] 'ARG'
_shcrypt_sha512 [-t|-f] 'ARG'
_shcrypt_b2     [-t|-f] 'ARG'

> example:
$ _shcrypt_md5 -t "shcrypt"
d796b665160d5ca3e852c3d11fdfd5d8</p></code></pre>

  <hr>
  <h3 align="center">Checksum functions</h3>
  <pre><code><p>
_shcrypt_checksum [--md5|--sha1|--sha224|--sha384|--sha512|--b2] 'file1' 'file2'
-> returns 0 if the checksum is true and 1 if false</p></code></pre>

  <hr>
  <h3 align="center">Generators</h3>
  <pre><code><p>
_shcrypt_uuid
_shcrypt_uuid2
_shcrypt_rnumber [number size] [(amount of lines to be generated in /dev/urandom)]
_shcrypt_rtext   [text size] [(amount of lines to be generated in /dev/urandom)]
_shcrypt_random  [size] [(amount of lines to be generated in /dev/urandom)]

> example:
$ _shcrypt_uuid
ef7ff891-d246-4540-bdec-2a05d52333eb
$ _shcrypt_uuid2
551a08e9-487b-45be-b9e6-2babed1e0fe7
$ _shcrypt_rnumber 10
9586461290
$ _shcrypt_rtext 10
jCddbNabPG
$ _shcrypt_random 40
*Iv+9H?[TLnjH"e5-B:g(o*f|?{#1/1jv5S8ET>`</p></code></pre>

</html>
