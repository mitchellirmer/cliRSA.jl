export keygen
""""
    keygen(size_e)

Generate the public key n, the public encryption exponent e, and the private decryption exponent d.
Store these in files to use distribute and use later.
"""
function keygen(size_e)

    p = big(nextprime(BigInt(abs.(rand(Int)))^4));
    q = big(nextprime(BigInt(abs.(rand(Int)))^5));
    e = big(nextprime(size_e));
    
    n = big(p*q);
    phi_n = big((p-1)*(q-1));
    
    d = big(powermod(e,-1,phi_n));
#    check = e*d % phi_n
    publickey = [n;e]
    privatekey = d;
    writedlm("keys_me/PublicKey.txt", publickey, ',')
    writedlm("keys_me/PrivateKey.txt", privatekey, ',')

end
