"map function to a key sequence in visual mode
inoremap <F5> <C-R>=ShowRegContents()<CR>
vmap ,p x:call TextTuner()<CR>i<F5>

function! TextTuner()
let fname = 'AI21_API_KEY.txt'
for line in readfile(fname, '', 10)
  let key = line
endfor

python3 << EOF
import vim
import ai21
    
text = vim.eval('@-')
ai21.api_key  = vim.eval('key')
response = ai21.Paraphrase.execute(text=text)
paraphrased_texts = [suggestion['text'] for suggestion in response['suggestions']] 
for i, paraphrased_text in enumerate(paraphrased_texts):
    vim.command(f'let @{i} = "{paraphrased_text}"')
EOF
endfunction

func! ShowRegContents()
  call complete(col('.'), [@0, @1, @2, @3, @4, @5, @6, @7, @8, @9, @-])
  return ''
endfunc

