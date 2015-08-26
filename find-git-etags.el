;Copyright (c) 2016, Matthew Weigel
;
;Permission to use, copy, modify, and/or distribute this software for any
;purpose with or without fee is hereby granted, provided that the above
;copyright notice and this permission notice appear in all copies.
;
;THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
;WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
;MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
;ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
;WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
;ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
;OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.

; This code can be added to your .emacs or loaded in any way you
; find most appropriate in order to work with the effortlessly up-to-date
; etags file generated with the git hooks in this repository
(defun find-git-repo-tags-file ()
  "Find a TAGS file (as ETAGS) if the current buffer is in a git repository."
  (when
      (and (buffer-file-name) (vc-git-root (buffer-file-name))
           (file-readable-p (expand-file-name ".git/ETAGS" (vc-git-root (buffer-file-name)))))
    (expand-file-name ".git/ETAGS" (vc-git-root (buffer-file-name)))))

(defvar default-tags-table-function 'find-git-repo-tags-file)
