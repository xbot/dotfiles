(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t)
 '(tool-bar-mode nil))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

;; 字体 可 "Monaco-11" 来改字号
(set-default-font "Monaco-11")
 
;; 设置中文字体
(set-fontset-font "fontset-default"
          'gb18030 '("DejaVu Sans YuanTi Mono" . "unicode-bmp"))
 
;; Frame 中的字体添加
(add-to-list 'default-frame-alist '(font . "Monaco-10"))

(setq org-hide-leading-stars t) 
(define-key global-map "\C-ca" 'org-agenda) 
(setq org-log-done 'time)

;; 缺省瀏覽器
(setq browse-url-browser-function (quote browse-url-generic))
(setq browse-url-generic-program "chrome")
