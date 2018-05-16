# $FreeBSD: releng/11.1/share/skel/dot.cshrc 278616 2015-02-12 05:35:00Z cperciva $
#
# .cshrc - csh resource script, read at beginning of execution by each shell
#
# see also csh(1), environ(7).
# more examples available at /usr/share/examples/csh/
#

alias h		history 25
alias j		jobs -l
alias la	ls -aF
alias lf	ls -FA
alias ll	ls -lAF
alias ls	ls -FG

bindkey "^[[3~" delete-char-or-list-or-eof

setenv		CLICOLOR 1

setenv LSCOLORS	"fxbxgxdxGxegedabagacad"

#set autolist = TAB

# These are normally set through /etc/login.conf.  You may override them here
# if wanted.
# set path = (/sbin /bin /usr/sbin /usr/bin /usr/local/sbin /usr/local/bin $HOME/bin)
setenv	BLOCKSIZE	K
# A righteous umask
# umask 22

setenv	EDITOR	vi
setenv	PAGER	more

# P.S. \e is equivalent to \033

#setenv TITLE "%{\033]0;%n@%m:%~\007%}"
setenv TITLE "%{\e]0;%~\007%}"

if ($?prompt) then
	# An interactive shell -- set some stuff up
	#set prompt = "%N@%m:%~ %# "
	#set prompt = "%{\e[36;1m%}%N@%m:%~%{\033[1;0;35m%}%# "
	set prompt = "${TITLE}%{\e[36;1m%}%N@%m:%{\e[33;1m%}%~ %{\e[35;1m%}%#%{\e[0m%} "

	set promptchars = "%#"

	set filec
	set history = 1000
	set savehist = (1000 merge)
	set autolist = ambiguous
	# Use history to aid expansion
	set autoexpand
	set autorehash
	set mail = (/var/mail/$USER)
	if ( $?tcsh ) then
		bindkey "^W" backward-delete-word
		bindkey -k up history-search-backward
		bindkey -k down history-search-forward
	endif

endif
