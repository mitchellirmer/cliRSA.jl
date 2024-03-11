export keyloader

"""
    keyloader(private, public) 

Loads the public and private keys into memory.
"""
function keyloader(private, public)
    private = private*"/PrivateKey.txt"
    public = public*"/PublicKey.txt"
    privatekey = readlines(private)
    d = parse(BigInt,privatekey[1])
    publickey = readlines(public)
    n = parse(BigInt, publickey[1])
    e = parse(BigInt, publickey[2])
    return n,e,d
end
