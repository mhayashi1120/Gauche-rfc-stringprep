;;
;; Package Gauche-rfc-stringprep
;;

(define-gauche-package "Gauche-rfc-stringprep"
  ;;
  :version "0.0.2"

  ;; Description of the package.  The first line is used as a short
  ;; summary.
  :description "String preparation (mainly RFC 3454) \n\
                Normalize a utf-8 text."

  ;; List of dependencies.
  ;; Example:
  ;;     :require (("Gauche" (>= "0.9.5"))  ; requires Gauche 0.9.5 or later
  ;;               ("Gauche-gl" "0.6"))     ; and Gauche-gl 0.6
  :require (("Gauche" (>= "0.9.11-p1")))

  ;; List of providing modules
  ;; NB: This will be recognized >= Gauche 0.9.7.
  ;; Example:
  ;;      :providing-modules (util.algorithm1 util.algorithm1.option)
  :providing-modules (
                      rfc.stringprep
                      )

  ;; List name and contact info of authors.
  ;; e.g. ("Eva Lu Ator <eval@example.com>"
  ;;       "Alyssa P. Hacker <lisper@example.com>")
  :authors ("Masahiro Hayashi <mhayashi1120@gmail.com>")

  ;; List name and contact info of package maintainers, if they differ
  ;; from authors.
  ;; e.g. ("Cy D. Fect <c@example.com>")
  :maintainers ()

  ;; List licenses
  ;; e.g. ("BSD")
  :licenses ("BSD")

  ;; Homepage URL, if any.
  :homepage "https://github.com/mhayashi1120/Gauche-rfc-stringprep/"

  ;; Repository URL, e.g. github
  :repository "git@github.com:mhayashi1120/Gauche-rfc-stringprep.git"
  )
