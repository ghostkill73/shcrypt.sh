############################################################
#
#
#	 shcrypt.sh (c) 2024  Abner Benedito
#
#	       shcrypt.sh is a portable
#	         shell script library
#
#		     contribute
#	 <github.com/ghostkill73/shcrypt.sh>
#
#		    bug report in
#     <github.com/ghostkill73/shcrypt.sh/issues>
#
#
############################################################



############################################################
# Variables
############################################################

# 0 == true, 1 == false, 2 == error
_shcrypt_true="0"
_shcrypt_false="1"
_shcrypt_error="2"


############################################################
# Functions
############################################################

# message output
_shcrypt_msg()
{
	printf '%s\n' "$*" 2>/dev/null
}

# if an option does not exist, print message error
_shcrypt_invalid_option()
{
	__invalid__=
	unset __invalid__
	: ${__invalid__?"$1"}
	exit ${_shcrypt_error}
}

# text test
_shcrypt_text_test()
{
	[ -n "$1" ] && { #if
		return ${_shcrypt_true}
	} || { #else
		unset _invalid_text
		: ${_invalid_text?"$1"}
		exit ${_shcrypt_false}
	} #endif
}

# file test
_shcrypt_file_test()
{
	[ -e "$1" ] && { #if
		return ${_shcrypt_true}
	} || { #else
		unset _invalid_file
		: ${_invalid_file?"$1"}
		exit ${_shcrypt_false}
	} #endif
}


############################################################
# HASHES utils
#  Avaliable hashes:
#	- MD5
#	- SHA1
#	- SHA224
#	- SHA256
#	- SHA384
#	- SHA512
#	- BLAKE2B
#
# [!] need's GNU Coreutils
############################################################

# _shcrypt_md5 -t [TEXT] (you need to quote the text/variable)
# _shcrypt_md5 -f [FILE] (only 1 file)
_shcrypt_md5()
{
	_md5_opt="$1"
	_md5_in="$2"
	_md5_out=

	case "$_md5_opt" in

		-t|--text)
			_shcrypt_text_test "$_md5_in"

			_md5_out="`printf "$_md5_in" | md5sum`"
			_shcrypt_msg "${_md5_out%% *}"
		;;

		-f|--file)
			_shcrypt_file_test "$_md5_in"

			_md5_out="`md5sum "$_md5_in"`"
			_shcrypt_msg "${_md5_out%% *}"
		;;

		*)
			_shcrypt_invalid_option "$_md5_opt"
		;;

	esac

	return ${_shcrypt_true}
}

# _shcrypt_sha1 -t [TEXT] (you need to quote the text/variable)
# _shcrypt_sha1 -f [FILE] (only 1 file)
_shcrypt_sha1()
{
	_sha1_opt="$1"
        _sha1_in="$2"
        _sha1_out=

        case "$_sha1_opt" in

                -t|--text)
			_shcrypt_text_test "$_sha1_in"

                        _sha1_out="`printf "$_sha1_in" | sha1sum`"
                        _shcrypt_msg "${_sha1_out%% *}"
                ;;

                -d|--dir)
			_shcrypt_file_test "$_sha1_in"

                        _sha1_out="`sha1sum "$_sha1_in"`"
                        _shcrypt_msg "${_sha1_out%% *}"
                ;;

                *)
			_shcrypt_invalid_option "$_sha1_opt"
                ;;

        esac

        return ${_shcrypt_true}
}

# _shcrypt_sha224 -t [TEXT] (you need to quote the text/variable)
# _shcrypt_sha224 -f [FILE] (only 1 file)
_shcrypt_sha224()
{
        _sha224_opt="$1"
        _sha224_in="$2"
        _sha224_out=

        case "$_sha224_opt" in

                -t|--text)
			_shcrypt_text_test "$_sha224_in"

                        _sha224_out="`printf "$_sha224_in" | sha224sum`"
                        _shcrypt_msg "${_sha224_out%% *}"
                ;;

                -d|--dir)
			_shcrypt_file_test "$_sha224_in"

                        _sha224_out="`sha224sum "$_sha224_in"`"
                        _shcrypt_msg "${_sha224_out%% *}"
                ;;

                *)
			_shcrypt_invalid_option "$_sha224_opt"
                ;;

        esac

        return ${_shcrypt_true}
}

# _shcrypt_sha256 -t [TEXT] (you need to quote the text/variable)
# _shcrypt_sha256 -f [FILE] (only 1 file)
_shcrypt_sha256()
{
        _sha256_opt="$1"
	_sha256_in="$2"
        _sha256_out=

        case "$_sha256_opt" in

                -t|--text)
			_shcrypt_text_test "$_sha256_in"

                        _sha256_out="`printf "$_sha256_in" | sha256sum`"
                        _shcrypt_msg "${_sha256_out%% *}"
                ;;

                -d|--dir)
			_shcrypt_file_test "$_sha256_in"

                        _sha256_out="`sha256sum "$_sha256_in"`"
                        _shcrypt_msg "${_sha256_out%% *}"
                ;;

                *)
			_shcrypt_invalid_option "$_sha256_opt"
                        exit ${_shcrypt_error}
                ;;

        esac

        return ${_shcrypt_true}
}

# _shcrypt_sha384 -t [TEXT] (you need to quote the text/variable)
# _shcrypt_sha384 -f [FILE] (only 1 file)
_shcrypt_sha384()
{
        _sha384_opt="$1"
	_sha384_in="$2"
        _sha384_out=

        case "$_sha384_opt" in

                -t|--text)
			_shcrypt_text_test "$_sha384_in"

                        _sha384_out="`printf "$_sha384_in" | sha384sum`"
                        _shcrypt_msg "${_sha384_out%% *}"
                ;;

                -d|--dir)
			_shcrypt_file_test "$_sha384_in"

                        _sha384_out="`sha384sum "$_sha384_in"`"
                        _shcrypt_msg "${_sha384_out%% *}"
                ;;

                *)
			_shcrypt_invalid_option "$_sha384_opt"
                        exit ${_shcrypt_error}
                ;;

        esac

        return ${_shcrypt_true}
}

# _shcrypt_sha512 -t [TEXT] (you need to quote the text/variable)
# _shcrypt_sha512 -f [FILE] (only 1 file)
_shcrypt_sha512()
{
        _sha512_opt="$1"
	_sha512_in="$2"
        _sha512_out=

        case "$_sha512_opt" in

                -t|--text)
			_shcrypt_text_test "$_sha512_in"

                        _sha512_out="`printf "$_sha512_in" | sha512sum`"
                        _shcrypt_msg "${_sha512_out%% *}"
                ;;

                -d|--dir)
			_shcrypt_file_test "$_sha512_in"

                        _sha512_out="`sha512sum "$_sha512_in"`"
                        _shcrypt_msg "${_sha512_out%% *}"
                ;;

                *)
			_shcrypt_invalid_option "$_sha512_opt"
                ;;

        esac

        return ${_shcrypt_true}
}

# _shcrypt_b2 -t [TEXT] (you need to quote the text/variable)
# _shcrypt_b2 -f [FILE] (only 1 file)
_shcrypt_b2()
{
        _b2_opt="$1"
	_b2_in="$2"
        _b2_out=

        case "$_b2_opt" in

                -t|--text)
			_shcrypt_text_test "$_b2_in"

                        _b2_out="`printf "$_b2_in" | b2sum`"
                        _shcrypt_msg "${_b2_out%% *}"
                ;;

                -d|--dir)
			_shcrypt_file_test "$_b2_in"

                        _b2_out="`b2sum "$_b2_in"`"
                        _shcrypt_msg "${_b2_out%% *}"
                ;;

                *)
			_shcrypt_invalid_option "$_b2_opt"
                ;;

        esac

        return ${_shcrypt_true}
}


############################################################
# CHECKSUM utils
# Avaliable functions:
#	- hash checksum
#
############################################################

_shcrypt_checksum()
{
	_ck_opt="$1"
	_ck_file1="$2"
	_ck_file2="$3"

	case "$_ck_opt" in

		--md5|--sha1|--sha224|--sha256|--sha384|--sha512|--b2)
			_shcrypt_file_test "$_ck_file1"
			_shcrypt_file_test "$_ck_file2"

			_ck_file1_hash="`${_ck_opt#--}sum "$_ck_file1"`"
			_ck_file2_hash="`${_ck_opt#--}sum "$_ck_file2"`"

			[ "${_ck_file1_hash%% *}" = "${_ck_file2_hash%% *}" ] && { #if
				return ${_shcrypt_true}
			} || { #else
				return ${_shcrypt_false}
			} #endif
		;;

		*)
			_shcrypt_invalid_option "$_ck_opt"
		;;
	esac
}

############################################################
# GENERATORS utils
# Avaliable functions:
#	- UUID
#	- Random number
#	- Random text
#	- Random UTF-8 characters
#
############################################################

# _shcrypt_uuid
_shcrypt_uuid()
{
	N="0"
	C="89ab"

	while [ "$N" -lt "16" ]; do
	B="`expr ${RANDOM} % 256`"

        case "$N" in

		6)
			printf '4%x' "`expr ${B} % 16`"
		;;

		8)
			printf '%c%x' "${C:$RANDOM%${#C}:1}" \
			"`expr ${B} % 16`"
		;;

		3|5|7|9)
			printf '%02x-' "$B"
		;;

		*)
			printf '%02x' "$B"
		;;

		esac

		N="`expr ${N} + 1`"
	done

	printf '\n'

	return ${_shcrypt_true}
}

## much faster uuid generator alternative
# _shcrypt_uuid2
_shcrypt_uuid2()
{
	_shcrypt_msg "`</proc/sys/kernel/random/uuid`"

	return ${_shcrypt_true}
}

# _shcrypt_rnumber [size] [head extract lines length(if necessary)]
_shcrypt_rnumber()
{
	_rnum_in="$1"
	_rnum_length="$2"
	_rnum_out=

	: ${_rnum_length:=100}

	_rnum_out="`LC_ALL=C head -n "$_rnum_length" /dev/urandom | tr -dc '0-9' 2>/dev/null | head -c "$_rnum_in"`"

	_shcrypt_msg "$_rnum_out"

	return ${_shcrypt_true}
}

# _shcrypt_rtext [size] [head extract lines length(if necessary)]
_shcrypt_rtext()
{
	_rtext_in="$1"
	_rtext_length="$2"
	_rtext_out=

	: ${_rtext_length:=100}

	_rtext_out="`LC_ALL=C head -n "$_rtext_length" /dev/urandom | tr -dc 'a-zA-Z' 2>/dev/null | head -c "$_rtext_in"`"

	_shcrypt_msg "$_rtext_out"

	return ${_shcrypt_true}
}

# _shcrypt_random [size] [head extract lines length(if necessary)]
_shcrypt_random()
{
	_rtext_in="$1"
	_rtext_length="$2"
	_rtext_out=

	: ${_rtext_length:=100}

	_rtext_out="`LC_ALL=C head -n "$_rtext_length" /dev/urandom | tr -dc '[:graph:]' 2>/dev/null | head -c "$_rtext_in"`"

	_shcrypt_msg "$_rtext_out"

	return ${_shcrypt_true}
}
