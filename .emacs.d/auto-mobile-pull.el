(org-mobile-pull) ;; run org-mobile-pull at startup

(defun install-monitor (file secs)
  (run-with-timer
   0 secs
   (lambda (f p)
     (unless (< p (second (time-since (elt (file-attributes f) 5))))
       (org-mobile-pull)))
   file secs))

(install-monitor (file-truename
                  (concat
                   (file-name-as-directory org-mobile-directory)
                          org-mobile-capture-file))
                 5)

;; Do a pull every 5 minutes to circumvent problems with timestamping
;; (ie. dropbox bugs)
(run-with-timer 0 (* 5 60) 'org-mobile-pull)
