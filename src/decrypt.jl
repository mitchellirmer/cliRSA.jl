export decrypt

"""
    decrypt(ctfile, ext)

Load a ciphertext, use the private key to decrypt, then undo the encoding.  Save a recovered message file.
"""
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
