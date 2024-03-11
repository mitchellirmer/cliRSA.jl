export encrypt

"""
    encrypt(ptfile,to)

Encrypts a file (pdf,png,odt,etc) using the recipient's public key.

## ARGS
> ptfile - location of the file to be encrypted
>
> to - location of the recipient's public key
"""
function encrypt(ptfile, to)
    n,e = keyloader("keys_me",to)
    m2 = encoder(ptfile)
    c = big.(powermod.(m2,e,n));
    writedlm("out_ciphertext.txt", c, ',')
    return c;
end
