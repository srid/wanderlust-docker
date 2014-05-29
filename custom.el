
(load-theme 'misterioso t)


;; *** 
;; wl customization
;; ***

;; Pre-fetch messages by pressing I in summary view
;; http://www.emacswiki.org/emacs/WlFaq#toc5
(setq wl-summary-incorporate-marks '("N" "U" "!" "A" "F" "$"))

;; Handle HTML emails
;; http://superuser.com/questions/435668/how-to-view-alternate-mime-content-in-wanderlust
(setq mime-view-type-subtype-score-alist
  '(((text . plain) . 4)
    ((text . enriched) . 3)
    ((text . html) . 2)
    ((text . richtext) . 1)))

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

