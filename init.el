;; Install packages (effective during image creation only)
(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))
(defvar my-packages
  '(starter-kit-bindings
    auto-complete
    zenburn-theme)
  "A list of packages to ensure are installed at launch.")
(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))


;; Use a suitable theme for reading email
(load-theme 'zenburn t)


;; *** 
;; wl customization
;; ***

;; HTML email
;; http://www.emacswiki.org/emacs/WlFaq#toc25
(require 'w3m)
(require 'mime-w3m)

;; Pre-fetch messages by pressing I in summary view
;; http://www.emacswiki.org/emacs/WlFaq#toc5
(setq wl-summary-incorporate-marks '("N" "U" "!" "A" "F" "$"))

;; Handle HTML emails
;; http://superuser.com/questions/435668/how-to-view-alternate-mime-content-in-wanderlust
(setq mime-view-type-subtype-score-alist
  '(
    ((text . html) . 4)
    ((text . richtext) . 3)
    ((text . enriched) . 2)
    ((text . plain) . 1)))

;; Large screen friendly summary line format:
(setq wl-summary-line-format "%n%T%P %D/%M (%W) %h:%m %t%[%7(%c %f%) %] %s")

;; Kill narrower summary column.
;; Must run wl-summary-rescan on existing entries.
(setq wl-summary-width nil)
;; ignore all fields (press H to view all fields)
(setq wl-message-ignored-field-list '("^.*:"))
;; ...except these fields:
(setq wl-message-visible-field-list
'("^From:"
  "^To:"
  "^Cc:"
  "^Subject:"))
;;   "^Date:"))

