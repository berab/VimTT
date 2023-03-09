"map function to a key sequence in visual mode
vmap ,t y :call Test()<CR>

function! Test()
python3 << EOF
import vim
import ai21

text = vim.eval('@0')
ai21.api_key = ''
response = ai21.Paraphrase.execute(text=text)
paraphrased_texts = [suggestion['text'] for suggestion in response['suggestions']] 
for paraphrased_text in paraphrased_texts:
    print(paraphrased_text)
EOF
endfunction
