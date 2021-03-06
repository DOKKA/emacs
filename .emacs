(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))
(defvar my-packages 
 '(
  ;; add some better defaults and little niceities
  starter-kit starter-kit-lisp starter-kit-bindings starter-kit-eshell

  ;; window number instead of hitting ctrl-x-o all the time
  window-number

  flymake-cursor  flymake-ruby

  js2-mode 
 ))
 
(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))
	

	(autoload 'window-number-mode "window-number"
   "A global minor mode that enables selection of windows according to
 numbers with the C-x C-j prefix.  Another mode,
 `window-number-meta-mode' enables the use of the M- prefix."
   t)

 (autoload 'window-number-meta-mode "window-number"
   "A global minor mode that enables use of the M- prefix to select
 windows, use `window-number-mode' to display the window numbers in
 the mode-line."
   t)
(window-number-mode 1)
(window-number-meta-mode 1)


(require 'flymake-ruby)
(add-hook 'ruby-mode-hook 'flymake-ruby-load)

(require 'flymake-cursor)

(add-hook 'js-mode-hook 'js2-minor-mode)
(add-hook 'js-mode-hook 'esk-paredit-nonlisp)



(defun comment-or-uncomment-region-or-line ()
  "Comments or uncomments the region or the current line if there's no active region."
  (interactive)
  (let (beg end)
    (if (region-active-p)
        (setq beg (region-beginning) end (region-end))
      (setq beg (line-beginning-position) end (line-end-position)))
    (comment-or-uncomment-region beg end)
    (next-line)))

(global-set-key (kbd "C-l") 'comment-or-uncomment-region-or-line)



(defun eshell/clear ()
  "04Dec2001 - sailor, to clear the eshell buffer."
  (interactive)
  (let ((inhibit-read-only t))
    (erase-buffer)))

(global-set-key (kbd "M-n") 'end-of-defun)
(global-set-key (kbd "M-p") 'beginning-of-defun)

(defun enlarge-window-alot ()
  "Enlarge the window a whole lot"
  (interactive)
  (enlarge-window 40))




