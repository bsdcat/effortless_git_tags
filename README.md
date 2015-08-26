# Effortless Etags and Ctags with Git

## Inspired by Tim Pope's blog entry [Effortless Ctags with Git][1]

This is a collection of hooks and a bit of Emacs Lisp to make it easy
to keep an old-school tags file up-to-date while using `git`.
Updating, rebasing, changing branches... it will silently update your
tags file in the background.

## I have made a few notable changes

First, out of the box it is set up to generate an etags file and a
ctags file.  I did this because I mostly use Emacs but not
exclusively, and it seemed easier to share a general solution instead
of two almost-identical solutions.  It is trivial to remove one or the
other to meet your needs.

Second, it works with Exuberant Ctags, Emacs Etags, and BSD ctags.
There are helpful variables in the 'etags' script to specify a path
and/or arguments to pick the right one, in case you happen to have
multiple versions installed.  A couple examples of doing things unusually:

* `ETAGS="ctags -e"` will use Exuberent Ctags from your `PATH` in etags
  mode to generate the tags file for Emacs.
* `CTAGS=/Applications/Emacs.app/Contents/MacOS/bin-x86_64-10_9/ctags` will
  use the ctags from your copy of [Emacs for Mac OS X][2] to generate the
  tags file for Vi.

Third, and this is minor, instead of generating `.git/TAGS` for Emacs,
it generates `.git/ETAGS` for use on MacOS X with case-insensitive
filenames.  Fortunately the included Emacs lisp for finding the tags
file is aware of this.  It continues to use the convention of
`.git/tags` for the ctags file, which I understand works with
[vim-git][3], but it's not a thing that has so far particularly
concerned me.

## Getting started

For your editor, if appropriate, take a look at `vim-git` or
`find-git-etags.el` included in this repository.  Of course many other
editors support these formats, perhaps you can easily configure them
to look for a tags file under the .git directory.  You can also adjust
the `template/hooks/etags` script to drop the tags file(s) elsewhere
as needed.

For git, to make it easiest you will need to set a template directory.
For example, `git config --global init.templatedir
~/effortless_git_tags/template` will use the template directory
included in this repository without modification.  Then to add these
hooks to existing repositories you have, simply `git init` in them.

This won't overwrite or update any files already present, so if your
local repositories already have some of these hooks, you will need to
merge the simple one-liners included in this repository with your
existing hooks.

## Moderately tested, use at your own risk

I have used or intend to use this primarily on MacOS X and Linux.  If
it comes up that I'm working with git in Emacs on Windows again, I'll
try to make it behave there too.  Patches gratefully accepted.

[1]: http://tbaggery.com/2011/08/08/effortless-ctags-with-git.html
[2]: http://emacsformacosx.com/
[3]: https://github.com/tpope/vim-git
