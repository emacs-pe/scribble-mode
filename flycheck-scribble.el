;;; flycheck-scribble.el --- Flycheck: scribble support      -*- lexical-binding: t; -*-

;; Copyright (c) 2015 Mario Rodas <marsam@users.noreply.github.com>

;; Author: Mario Rodas <marsam@users.noreply.github.com>
;; URL:
;; Keywords: convenience, tools, languages
;; Version: 0.1
;; Package-Requires: ((emacs "24") (flycheck "0.22"))

;; This file is NOT part of GNU Emacs.

;;; License:

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:
;; This Flycheck extension provides a scribble.

;;; Code:
(require 'flycheck)

(flycheck-define-checker scribble
  "A Scribble checker using the scribble compiler.

See URL `http://docs.racket-lang.org/scribble/'."
  :command ("scribble" "--text" "--dest" temporary-directory source)
  :error-patterns
  ((error line-start (file-name) ":" line ":" column ":" (message) line-end))
  :error-filter (lambda (errors)
                  (flycheck-sanitize-errors
                   (flycheck-increment-error-columns errors)))
  :modes scribble-mode)

;;;###autoload
(defun flycheck-scribble-setup ()
  "Setup Flycheck for scribble.

Add `scribble' to `flycheck-checkers'."
  (interactive)
  (add-to-list 'flycheck-checkers 'scribble))

(provide 'flycheck-scribble)

;;; flycheck-scribble.el ends here
