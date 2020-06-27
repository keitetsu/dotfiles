;;; Config initialization
;;;
;;; Author:     Oliver Stotzem (keitetsu)
;;; Repository: https://github.com/keitetsu/dotfiles
;;;-----------------------------------------------------------------------------
;;; Copyright © Oliver Stotzem (keitetsu)
;;; See the file LICENSE.md for copying permission.

(require 'cl)

(defconst keitetsu-custom-file
  (expand-file-name "custom" "~/.config/keitetsu/user/emacs")
  "User custom file.")

(defconst keitetsu-user-file
  (expand-file-name "init" "~/.config/keitetsu/user/emacs")
  "User defined configuration.")

;;;=============================================================================
;;;===========================[ ::: MODULES ::: ]===============================
;;;=============================================================================

;; Load user-defined configuration.
(load keitetsu-user-file 'no-error)

;; Load custom file.
(setq custom-file keitetsu-custom-file)
(load custom-file 'no-error)
