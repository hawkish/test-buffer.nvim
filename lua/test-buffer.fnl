
(local maps {:fennel {:extension :fnl :comment ";"}
             :lua {:extension :lua :comment "--"}
             :python {:extension :py :comment "#"}})

(fn set-plugin [options]
  (print options.name))

(fn setup-autocmd [options]
  (local augroup (_G.vim.api.nvim_create_augroup :TestBuffer {:clear true}))
  (_G.vim.api.nvim_create_autocmd :VimEnter
                               {:group augroup
                                :desc "Set a fennel scratch buffer on load"
                                :once true
                                :callback (fn [] (set-plugin options))}))

(fn setup [user_options]
  (when (not (= (_G.vim.fn.argc) 0))
    (lua :return)) ; Return when the user used N_G.vim to open a file directly
  (let [default_options {
                        :filetype :fennel
                        :name :default-name}
        options (_G.vim.tbl_extend :force default_options (or user_options {}))]
    (if (= (. maps options.filetype) nil)
        (error (.. "Filetype " options.filetype " is not supported")))
    (setup-autocmd options)))

{: setup}
