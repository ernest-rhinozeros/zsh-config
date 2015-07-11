# Enable colors in prompt
autoload -U colors && colors

function hg_prompt_string {
#	hg prompt --angle-brackets "< on <branch>>< at <tags|, >><status|modified|unknown><update><patches: <patches|join( → )>>" 2>/dev/null

	# same as above with color
	hg prompt --angle-brackets "< on %{$fg[magenta]%}<branch>%{$reset_color%}>< at %{$fg[yellow]%}<tags|%{$reset_color%}, %{$fg[yellow]%}>%{$reset_color%}>%{$fg[green]%}<status|modified|unknown><update>%{$reset_color%}<patches: <patches|join( → )|pre_applied(%{$fg[yellow]%})|post_applied(%{$reset_color%})|pre_unapplied(%{$fg_bold[black]%})|post_unapplied(%{$reset_color%})>>" 2>/dev/null
}
