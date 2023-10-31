using Statistics, Random, StringEncodings, DelimitedFiles, Primes, FileIO

## INSTRUCTIONS
print("\n\n")
print("*************************************************************\n")
print("************************ INSTRUCTIONS ***********************\n\n")
print("** keygen(size_of_e) -- Share the public key with friends.\n")
print("** encrypt(\"plaintext_file_name\", \"receipient_key_folder\")\n")
print("** decrypt(\"ciphertext_file_name\", \"recovered_file_extension\")\n")
print("***** example:  decrypt(\"ciphertext.txt\",\".odt\")\n\n")
print("*************************************************************\n\n")


## GLOBALS
blocksize = 7;
binarysize = 256;

## Generate the public key n, the public encryption exponent e, and the private decryption exponent d
## Store these in files to use distribute and use later

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

## keyloader() is called by the encrypt and decrypt functions to load the public and private keys stored in text files

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

## The following functions are the encoding functions.  Each encoding function will have an inverse decoding function.

function encoder(ptfile)
    m2 = read(ptfile)
    totalsize = blocksize * ceil(length(m2)/blocksize);
    paddingsize = totalsize - length(m2);
    padding = zeros(UInt8,UInt8(paddingsize),1);
    m2 = [m2; padding]
    indices = 1:blocksize:length(m2)-blocksize+1
    m = [];
    for eachindex in indices
        block = 0;
        for index in 1:blocksize
            blocknew = m2[eachindex+index-1]*binarysize^(index-1)
            block = block + blocknew
        end
        push!(m,block)
    end
    return m 
end

## Encode and encrypt the plaintext.  Output as ciphertext file to transmit.

function encrypt(ptfile, to)
    n,e = keyloader("keys_me",to)
    m2 = encoder(ptfile)
    c = big.(powermod.(m2,e,n));
    writedlm("out_ciphertext.txt", c, ',')
    return c;
end

## Load a ciphertext, use the private key to decrypt, then undo the encoding.  Save a recovered message file.

function decode2(ctfile)
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


function decrypt(ctfile, ext)
    type = string(ext)
    m1 = decode2(ctfile)

    if type == ".txt"
        m = Char(m1[1])

         for index in 2:length(m1)
            m = m*Char(m1[index])
         end

         abc = open("recoveredfile.txt","w")
         write(abc,m)
         close(abc)
         m1 = m
    else 
        file = string("recoveredfile")*type
        abc = open(file,"w")
        write(abc,m1)
        close(abc)
        m = m1
    end
    return m
end

