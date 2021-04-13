;;; command-mode.el --- A major mode for efficiently entering commands.  -*- lexical-binding: t; -*-

;; Copyright (C) 2021  Sam

;; Author: Sam <scmorris.dev@gmail.com>
;; Keywords: tools

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;; 

;;; Code:

(define-derived-mode command-mode fundamental-mode "Command"
  "Major mode for

The query editor uses the Recoll query language, documented here:
https://www.lesbonscomptes.com/recoll/usermanual/webhelp/docs/RCL.SEARCH.LANG.html"
  
  (hl-line-mode)
  )

(defun commander ()
  "Display a tooltip showing metadata about the file at POINT."
  (interactive)
  (let ((buffer (get-buffer-create "*commander*")))
    (with-current-buffer buffer
      (visual-line-mode 1)
      ;; (auto-fill-mode 1)
      (let ((inhibit-read-only t))
        (erase-buffer))
      (pop-to-buffer buffer)
      (fit-window-to-buffer)
      (command-mode)
      ;; (set-window-point (get-buffer-window buffer) 0)
      )))

(provide 'command-mode)
;;; command-mode.el ends here
