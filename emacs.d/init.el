(add-to-list 'load-path "~/.emacs.d/modes/")
(setenv "PYMACS_PYTHON" "~/.envs/emacs/bin/python")

(require 'linum+)
(require 'pymacs)
(pymacs-load "ropemacs" "rope-")


; Pymacs/Rope configuration
(autoload 'pymacs-apply "pymacs")
(autoload 'pymacs-call "pymacs")
(autoload 'pymacs-eval "pymacs" nil t)
(autoload 'pymacs-exec "pymacs" nil t)
(autoload 'pymacs-load "pymacs" nil t)



; Probably less necessary right now.
; Don't need the refactoring as much as linting.
;(setq pymacs-load-path
;'("/Users/nrb/.envs/emacs/lib/python2.6/site-packages/rope",
;"/Users/nrb/.envs/emacs/lib/python2.6/site-packages/ropemacs-0.6-py2.6.egg/ropemacs/"))
;(ropemacs-mode)

; Pyflakes/flymake integration
; Taken from http://plope.com/Members/chrism/flymake-mode
; http://rhodesmill.org/brandon/static/2009/init.sample.el
(when (load "flymake" t)
  (defun flymake-pyflakes-init ()
    (let* ((temp-file (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-inplace))
           (local-file (file-relative-name
                        temp-file
                        (file-name-directory buffer-file-name))))
      (list "~/.envs/emacs/bin/pyflakes" (list local-file))))
  
  (add-to-list 'flymake-allowed-file-name-masks
               '("\\.py\\'" flymake-pyflakes-init)))

(add-hook 'find-file-hook 'flymake-find-file-hook)


(global-linum-mode 1)