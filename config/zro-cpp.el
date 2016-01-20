(require 'ac-clang)
(require 'auto-complete-clang)
(require 'auto-complete-c-headers)
(require 'ac-c-headers)

(defun zro-cc-ac-init ()
  (add-to-list 'ac-sources 'auto-complete-c-headers)

  (setq ac-clang-flags
	(mapcar (lambda (item) (concat "-I" item))
		(split-string
		 "
 /usr/local/Cellar/gcc48/4.8.4/lib/gcc/4.8/gcc/x86_64-apple-darwin14.5.0/4.8.4/../../../../../../include/c++/4.8.4
 /usr/local/Cellar/gcc48/4.8.4/lib/gcc/4.8/gcc/x86_64-apple-darwin14.5.0/4.8.4/../../../../../../include/c++/4.8.4/x86_64-apple-darwin14.5.0
 /usr/local/Cellar/gcc48/4.8.4/lib/gcc/4.8/gcc/x86_64-apple-darwin14.5.0/4.8.4/../../../../../../include/c++/4.8.4/backward
 /usr/local/Cellar/gcc48/4.8.4/lib/gcc/4.8/gcc/x86_64-apple-darwin14.5.0/4.8.4/include
 /usr/local/include
 /usr/local/Cellar/gcc48/4.8.4/include
 /usr/local/Cellar/gcc48/4.8.4/lib/gcc/4.8/gcc/x86_64-apple-darwin14.5.0/4.8.4/include-fixed
 /usr/include
 /System/Library/Frameworks
 /Library/Frameworks
" )))
  
  (setq ac-clang-cflags (append '("-std=c++11") ac-clang-cflags)))
 

(add-hook 'c++-mode 'zro-cc-ac-init)
