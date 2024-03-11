export decode2

"""
    decode2(ctfile)
    
Load a ciphertext, use the private key to decrypt, then undo the encoding.  Called by decrypt.
"""
function decode2(ctfile)
    blocksize = 7;
    binarysize = 256;
    n,e,d = keyloader("keys_me","keys_me")
    c = vec(readdlm(ctfile,',',BigInt))
    rblocks = big.(powermod.(c,d,n));
    m2 = [];
    for block in rblocks
        for i = 1:blocksize
            i = i
            newunblock = UInt8(block%binarysize)
            block = floor(block/binarysize)
            push!(m2,newunblock)
        end
    end
    m2 = UInt8.(m2) #[1:end-1])
    while m2[end] == 0x30 || m2[end] == 0x0a || m2[end] == 0x00
        m2 = m2[1:end-1]
    end
    return m2
end
