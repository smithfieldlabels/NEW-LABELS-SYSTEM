(defun company-select ()
  (interactive)
  (setq companychoice (message "%s"
	   (ido-completing-read "Which Company? "
				'("ADDO POOLE BAKERY" "BAKKAVOR MEALS LONDON ELVEDEN" "BENSON PARK" "CRANSWICK GOURMET PASTRY" "FARMERS BOY" "GINSTERS" "KERRY NOON" "KERRY SPURWAY" "KETTLEBY FOODS" "PETERS" "ROWAN" "SALADWORKS" "TAMAR" "WALKERS MIDSHIRE")))))

(defun slaughter-site-select ()
  (interactive)
  (setq returns (ido-completing-read "Which Slaughter Site?" '("UK (NI) 9502" "GB 3005" "GB 3011" "GB 4014" "GB 8016" "GB 3007 / 4014 / 8016"))))



(defun number-of-labels-to-print (orderweight bagweight)
  (interactive)
  (setq total-labels (floor (/ (+ orderweight (* 0.5 bagweight)) bagweight)))
  (message "Total Labels = %s" total-labels))

;(number-of-labels-to-print 802 5)

(defun number-of-labels-to-print-including-production (x)
  (interactive)
  (setq total-labels-incl-production (+ x 1))
  (message "Total Labels = %s" total-labels-incl-production))

;(setq num-of-labels-no-production (number-of-labels-to-print 154 10))
;(setq num-of-labels-no-production (+ (string-to-number(num-of-labels-no-production 1))))

(defun hash-select (x)
  (interactive)
  (setq correct-hash-table
	(cond
	 ((equal x "TAMAR") tamar-hash)
	 ((equal x "SALADWORKS") saladworks-hash)
	 )))

(defun return-hash-value-as-list ()
  (interactive)
  (setq company (company-select)) ;TAMAR
  (setq correct-hash (hash-select company))
  (setq selection (ido-completing-read "Which Product? "
				       (hash-table-keys (hash-select company))))
  (message "%s" (gethash selection correct-hash )))

       
(defun alt-num-labels-to-print ()
  (interactive)
  (message "%s" (read-number "how many labels to print? " )))

(defun todays-date-correctly-formatted ()
  (interactive)
  (setq return (upcase(format-time-string "%d %b %y"))))


(defun other-time-function ()
  (interactive)
  (decode-time(org-time-string-to-time(org-read-date nil nil (message "%s"
								      (message "%s" (concat "+" (message "%s"(read-number "How many days into the future?")))))))))


(defun new-time-function ()
  (interactive)
  (setq baselist (decode-time(org-time-string-to-time (org-read-date))))
  ;;; DAY ;;;
  (setq day (message "%s" (nth 3 baselist)))
  (if (= (length day) 1)
      (setq day (concat "0" (nth 3 baselist)))
    (setq day (nth 3 baselist))
    )
  ;;; MONTHS ;;;
  (setq month (nth 4 baselist))
  (cond
   ((equal month 1) (setq month "JAN"))
   ((equal month 2) (setq month "FEB"))
   ((equal month 3) (setq month "MAR"))
   ((equal month 4) (setq month "APR"))
   ((equal month 5) (setq month "MAY"))
   ((equal month 6) (setq month "JUN"))
   ((equal month 7) (setq month "JUL"))
   ((equal month 8) (setq month "AUG"))
   ((equal month 9) (setq month "SEP"))
   ((equal month 10) (setq month "OCT"))
   ((equal month 11) (setq month "NOV"))
   ((equal month 12) (setq month "DEC")))
  ;;; YEAR ;;;
  (setq year (nth 5 baselist))
  (cond
   ((equal year 2021) (setq year "21"))
   ((equal year 2022) (setq year "22"))
   ((equal year 2023) (setq year "23"))
   ((equal year 2024) (setq year "24")))
  ;;; FINAL ;;;
  (setq string-return (message "%s %s %s" day month year))
  (setq string-return (cons baselist string-return))
  )

(new-time-function)

("25 MAY 21" 0 0 0 25 5 2021 2 t 3600)

(nth 1 (new-time-function))






			   
