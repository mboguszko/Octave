;(add-to-list 'exec-path "/applications/Octave.app/Contents/Resources/bin")
(add-to-list 'exec-path "/usr/local/bin/octave")
(autoload 'octave-mode "octave-mod" nil t)
(setq auto-mode-alist (cons '("\\.m$" . octave-mode) auto-mode-alist))
(add-hook 'octave-mode-hook (lambda () (abbrev-mode 1) (auto-fill-mode 1) (if (eq window-system 'x) (font-lock-mode 1))))
(autoload 'run-octave "octave-inf" nil t)



(autoload 'octave-mode "octave-mod" nil t)
          (setq auto-mode-alist
                (cons '("\\.m$" . octave-mode) auto-mode-alist))
(add-hook 'octave-mode-hook
	  (lambda ()
	    (abbrev-mode 1)
	    (auto-fill-mode 1)
	    (if (eq window-system 'x)
		(font-lock-mode 1))))

;(define-key octave-mode-map "\C-m"
;       'octave-reindent-then-newline-and-indent)

(add-hook 'inferior-octave-mode-hook
               (lambda ()
                 (turn-on-font-lock)
                 (define-key inferior-octave-mode-map [up]
                   'comint-previous-input)
                 (define-key inferior-octave-mode-map [down]
                   'comint-next-input)))

;  (autoload 'octave-help "octave-hlp" nil t)
;      (require 'gnuserv)
;      (gnuserv-start)

(setenv "PATH"
       (concat "/Applications/Gnuplot.app/Contents/Resources/bin" ":"
	       (getenv "PATH")
	       )
       )

(defun clear-shell ()
   (interactive)
   (let ((old-max comint-buffer-maximum-size))
     (setq comint-buffer-maximum-size 0)
     (comint-truncate-buffer)
     (setq comint-buffer-maximum-size old-max)))

(global-set-key (kbd "C-x c") 'clear-shell)
