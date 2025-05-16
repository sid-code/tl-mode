;; tl-mode.el --- a major-mode for editing Teal scripts  -*- lexical-binding: t -*-
;;
;; Author: Sid Kulkarni
;;
;;
;; Version: 20250516
;; Package-Requires: ((emacs "24.3"))
;;
;; This file is NOT part of Emacs.
;;
;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;; Keywords: languages, processes, tools

(eval-and-compile
  (setq tl--keywords `((,(lua-rx (symbol "record" "interface" "enum" "type")) . font-lock-keyword-face))
        ;; TODO: need to handle `: integer` or `: boolean` syntax highlighting.
        tl--builtins `((,(lua-rx (symbol "integer" "boolean")) . font-lock-builtin-face))))

(defvar tl-font-lock-keywords
  (append tl--keywords
          tl--builtins
          lua-font-lock-keywords))

(define-derived-mode tl-mode lua-mode "Teal"
  "Major mode for Teal, a Lua variant with static types."
  :group 'tl
  (setq-local font-lock-defaults '(tl-font-lock-keywords  ;; keywords
                                   nil                    ;; keywords-only
                                   nil                    ;; case-fold
                                   nil                    ;; syntax-alist
                                   nil                    ;; syntax-begin
                                   )))


;;; tl-mode.el ends here
