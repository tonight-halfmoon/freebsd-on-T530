# $FreeBSD: releng/11.1/share/skel/dot.cshrc 278616 2015-02-12 05:35:00Z cperciva $
#
# .cshrc - csh resource script, read at beginning of execution by each shell
#
# see also csh(1), environ(7).
# more examples available at /usr/share/examples/csh/
#
#
#

#setenv XMODIFIERS @im=fcitx
#setenv GTK_IM_MODULE fcitx
#setenv GTK3_IM_MODULE fcitx

# vidcontrol cyan black

#setenv TERM "xterm-color"

alias h		history 10000
alias j		jobs -l
alias la	ls -aF
alias lf	ls -FA
alias ll	ls -lAF
alias ls	ls -FG
alias al	ls -al

# These are normally set through /etc/login.conf.  You may override them here
# if wanted.
# set path = (/sbin /bin /usr/sbin /usr/bin /usr/local/sbin /usr/local/bin $HOME/bin)
setenv	BLOCKSIZE	G
# A righteous umask
# umask 22

#bindkey "^[[3~" delete-char-or-list-or-eof

# Reference: http://www.ibb.net/~anne/keyboard.html
# Reference: https://lists.freebsd.org/pipermail/freebsd-questions/2004-July/054180.html
#bindkey "^?" delete-char # for Console
#bindkey "^[[3~" delete-char # for xterm
#bindkey "\e[3~" delete-char
#bindkey "\e[1~" beginning-of-line
bindkey "\e[4~" end-of-line
bindkey "^R" history-search-backward

setenv CLICOLOR		1

setenv LSCOLORS "GxCxgxdxGxegedaCagacad"

setenv	EDITOR	vi
setenv	PAGER	more
setenv  TITLE   "%{\e]0;%~\007%}"

# colors!
set     red="%{\e[31;1m%}"
set	g="%{\e[32;0m%}"
set	y="%{\e[33;1m%}"
set	b="%{\e[34;1m%}"
set	m="%{\e[35;1m%}"
set	c="%{\e[36;1m%}"
set	w="%{\e[37;0m%}"
set	reset="%{\e[0m%}"


if ($?prompt) then
	# An interactive shell -- set some stuff up
	#set prompt = "%N@%m:%~ %# "
	set promptchars = "%#"
	set prompt = "${TITLE}${red}AT${c}%N@%m:${y}%c ${m}%#${reset} "

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

unset red g y b m c w reset
